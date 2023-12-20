package main;
import CLIPSJNI.*;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;

import java.util.*;



public class Main extends Application {
    static Environment env;
    boolean answered = false;
    static ResourceBundle textBundle;

    ToggleGroup group;
    PrimitiveValue state;
    PrimitiveValue displayState;
    PrimitiveValue answers;
    RadioButton[] buttons;
    VBox vertPane;
    String question = "";
    String questionId;
    Button nextButton;
    Text questionDisp;
    boolean next = false;
    public static void main(String[] args) {
        try{
            textBundle = ResourceBundle.getBundle("rsc.species", Locale.getDefault());
        }
        catch (MissingResourceException ex){
            System.err.println("Resource not found");
            return;
        }
        env = new Environment();
        env.load("species_rules.clp");
        env.reset();
        env.eval("(assert (init))");
        //env.run();
        launch(args);
    }

    @Override
    public void start(Stage stage) throws Exception {
        stage.setTitle("What species did you evolve from?");
        nextButton = new Button("Start");
        group = new ToggleGroup();

        vertPane = new VBox(5);




        nextButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent actionEvent) {
                handleQuestions();
            }
        });
        vertPane.getChildren().add(nextButton);
        VBox.setMargin(nextButton, new Insets(0, 0, 0, 135));
        Scene scene = new Scene(vertPane, 300, 300);
        stage.setScene(scene);
        stage.show();
    }

    void handleQuestions(){
        if(answered){
            //assert answer fact
            RadioButton selected = (RadioButton) group.getSelectedToggle();
            String id = "";
            for (int i = 0; i < buttons.length; i++) {
                if (selected.getText().equals(buttons[i].getText())) {
                    try {
                        id = answers.get(i).toString();
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                }

            }
            System.out.println("(assert (" + questionId + " " + id + "))");
            env.eval("(assert (" + questionId + " " + id + "))");
            //retract current question
            env.eval("(retract " + getIntId(displayState.toString()) + ")");


        }
        else {
            nextButton.setText("Next");
        }
        vertPane.getChildren().removeIf(item -> !(item instanceof Button));
        env.run();
        try {
            displayState = env.eval("(find-all-facts ((?f display)) TRUE)").get(0);
            String result = displayState.getFactSlot("result").toString();
            if(result.equals("yes"))
            {
                handleResults();
                return;
            }
            answered = true;
            answers = displayState.getFactSlot("answers");
            buttons = new RadioButton[answers.size()];
            question = "";
            questionId = displayState.getFactSlot("question").toString();
            try {
                question = textBundle.getString(questionId);
            } catch (Exception e) {
                System.err.println("Question " + questionId + "  not found");
                return;
            }

            questionDisp = new Text(10, 50, question);
            vertPane.getChildren().add(questionDisp);
            for (int i = 0; i < answers.size(); i++) {
                buttons[i] = new RadioButton();
                String id = answers.get(i).toString();
                String text = "";
                try {
                    text = textBundle.getString(id);
                } catch (Exception e) {
                    System.err.println("Answer " + id + " not found");
                    return;
                }
                buttons[i].setText(text);
                buttons[i].setToggleGroup(group);
                vertPane.getChildren().add(buttons[i]);
                VBox.setMargin(buttons[i], new Insets(5, 5, 5, 5));
            }
            buttons[0].setSelected(true);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    void handleResults() throws Exception {
        env.run();
        PrimitiveValue res = null;

        res = env.eval("(find-all-facts ((?f result)) TRUE)").get(0);
        questionDisp.setText(textBundle.getString("result") + textBundle.getString(res.getFactSlot("animal").toString()) +"!");
        vertPane.getChildren().add(questionDisp);
        nextButton.setText("Restart");
        env = new Environment();
        answered = false;
        env.load("species_rules.clp");
        env.reset();
        env.eval("(reset)");
        env.eval("(assert (init))");
        env.run();
    }

    public int getIntId(String factId){
        return Integer.parseInt(factId.replaceAll("[\\D]", ""));
    }
}