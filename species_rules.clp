(deftemplate display
    (slot result)
    (slot question)
    (multislot answers)
)



(deftemplate result
    (slot animal)
)



(defrule favorite_thing_to_do ""
    (not (favorite_thing_to_do ?))
    ?f <- (init)
    =>
    
    (assert (display (result no) (question favorite_thing_to_do)
                           (answers run eat sleep swim mate i_dont_understand)
            )
    )
    (retract ?f)
)

(defrule how_fast_question ""
    (not (how_fast_question ?))
    (favorite_thing_to_do run)
    =>
    (assert (display (result no) (question how_fast_question)
						   (answers pretty_quick so_fast i_walk)
		    )
    )
)
						  
(defrule indoor_question ""
    (not (indoor_question ?))
    (how_fast_question pretty_quick)
    =>
    (assert (display (result no) (question indoor_question)
						   (answers yes no)
		    )
    )
)

(defrule do_you_own_question ""
    (indoor_question yes)
    (not (do_you_own_question ?))
    =>
    (assert (display (result no) (question do_you_own_question)
						   (answers im_between_floors if_i_pee)
		    )
    )
	
)

(defrule what_on_ipod_question ""
    (indoor_question no)
    (not (what_on_ipod_question ?))
    =>
    (assert (display (result no) (question what_on_ipod_question)
						   (answers old_home matata)
		    )
    )
	
)


(defrule literally_question ""
    (not (literally_question ?))
    (how_fast_question so_fast)
    =>
    (assert (display (result no) (question literally_question)
						   (answers yes no)
		    )
    )
	
)

(defrule how_then_question ""
    (not (how_then_question ?))
    (literally_question no)
    =>
    (assert (display (result no) (question how_then_question)
						   (answers in_dreams metaphorically)
		    )
    )
	
)


(defrule with_haste_question ""
    (not (with_haste_question ?))
    (how_fast_question i_walk)
    =>
    (assert (display (result no) (question with_haste_question)
						   (answers yes no)
		    )
    )
	
)

(defrule your_posture_question ""
    (not (your_posture_question ?))
    (with_haste_question yes)
    =>
    (assert (display (result no) (question your_posture_question)
						   (answers good quasimodo)
		    )
    )
	
)

(defrule hit_and_quit_question ""
    (not (hit_and_quit_question ?))
    (favorite_thing_to_do mate)
    =>
    (assert (display (result no) (question hit_and_quit_question)
						   (answers yes no)
		    )
    )
	
)
						  
(defrule stay_at_home_question ""
    (not (stay_at_home_question ?))
    (hit_and_quit_question no)
    =>
    (assert (display (result no) (question stay_at_home_question)
						   (answers yes no)
		    )
    )
	
)

(defrule where_swim_question ""
    (not (where_swim_question ?))
    (favorite_thing_to_do swim)
    =>
    (assert (display (result no) (question where_swim_question)
						   (answers sand in_shallows deep_blue_sea no_deep_blue_sea)
		    )
    )
	
)
						  
(defrule in_what_shallows ""
    (not (in_what_shallows ?))
    (where_swim_question in_shallows)
    =>
    (assert (display (result no) (question in_what_shallows)
						   (answers in_puddles in_ponds_lakes in_rivers_streams)
		    )
    )
)

(defrule do_you_eat_fries_question ""
    (not (do_you_eat_fries_question ?))
    (in_what_shallows in_puddles)
    =>
    (assert (display (result no) (question do_you_eat_fries_question)
						   (answers and_pretzels no)
		    )
    )
	
)

(defrule your_buoyancy_question ""
    (not (your_buoyancy_question ?))
    (in_what_shallows in_ponds_lakes)
    =>
    (assert (display (result no) (question your_buoyancy_question)
						   (answers sink_lika_rock couldnt_sink)
		    )
    )
	
)

(defrule recreationally_question ""
    (not (recreationally_question ?))
    (in_what_shallows in_rivers_streams)
    =>
    (assert (display (result no) (question recreationally_question)
						   (answers like_goof_around can_be_intense)
		    )
    )
	
)

(defrule alone_question ""
    (not (alone_question ?))
    (where_swim_question deep_blue_sea)
    =>
    (assert (display (result no) (question alone_question)
						   (answers yes no)
		    )
    )
)

(defrule bummer_question ""
    (not (bummer_question ?))
    (alone_question yes)
    =>
    (assert (display (result no) (question bummer_question)
						   (answers im_mean feel_invisible)
		    )
    )
	
)

(defrule with_who_question ""
    (not (with_who_question ?))
    (alone_question no)
    =>
    (assert (display (result no) (question with_who_question)
						   (answers life_mate facebook_friends)
		    )
    )
	
)

(defrule you_scary_question ""
    (not (you_scary_question ?))
    (where_swim_question no_deep_blue_sea)
    =>
    (assert (display (result no) (question you_scary_question)
						   (answers yes no)
		    )
    )
)

(defrule do_you_have_more_question ""
    (not (do_you_have_more_question ?))
    (or (you_scary_question no)
	(you_scary_question yes) )
    =>
    (assert (display (result no) (question do_you_have_more_question)
						   (answers teeth appendages)
		    )
    )
	
)

(defrule work_graveyard_shift_question ""
    (not (work_graveyard_shift_question ?))
    (favorite_thing_to_do sleep)
    =>
    (assert (display (result no) (question work_graveyard_shift_question)
						   (answers yes no)
		    )
    )
	
)
						  
(defrule you_cuddly_question ""
    (not (you_cuddly_question ?))
    (work_graveyard_shift_question no)
    =>
    (assert (display (result no) (question you_cuddly_question)
						   (answers my_mother_says other_people_say)
		    )
    )
	
)

(defrule what_you_eat_question ""
    (not (what_you_eat_question ?))
    (favorite_thing_to_do eat)
    =>
    (assert (display (result no) (question what_you_eat_question)
						   (answers no_meat not_that_picky things_with_blood)
		    )
    )
)

(defrule you_hippie_question ""
    (not (you_hippie_question ?))
    (what_you_eat_question no_meat)
    =>
    (assert (display (result no) (question you_hippie_question)
						   (answers yes no)
		    )
    )
)

(defrule rockin_beard_question ""
    (not (rockin_beard_question ?))
    (you_hippie_question yes)
    =>
    (assert (display (result no) (question rockin_beard_question)
						   (answers full_body like_tats)
		    )
    )
	
)

(defrule how_you_vote_question ""
    (not (how_you_vote_question ?))
    (you_hippie_question no)
    =>
    (assert (display (result no) (question how_you_vote_question)
						   (answers for_underground for_guns)
		    )
    )
	
)

(defrule would_you_climb_tree_question ""
    (not (would_you_climb_tree_question ?))
    (what_you_eat_question not_that_picky)
    =>
    (assert (display (result no) (question would_you_climb_tree_question)
						   (answers yes no)
		    )
    )
)

(defrule how_quickly_question ""
    (not (how_quickly_question ?))
    (would_you_climb_tree_question yes)
    =>
    (assert (display (result no) (question how_quickly_question)
						   (answers faster slower)
		    )
    )
	
)

(defrule why_lazy_question ""
    (not (why_lazy_question ?))
    (would_you_climb_tree_question no)
    =>
    (assert (display (result no) (question why_lazy_question)
						   (answers need_beauty_sleep trash_cans_easier)
		    )
    )
	
)

(defrule do_you_kill_it_question ""
    (not (do_you_kill_it_question ?))
    (what_you_eat_question things_with_blood)
    =>
    (assert (display (result no) (question do_you_kill_it_question)
						   (answers yes no)
		    )
    )
)

(defrule how_long_question ""
    (not (how_long_question ?))
    (do_you_kill_it_question yes)
    =>
    (assert (display (result no) (question how_long_question)
						   (answers hours seconds kill_later)
		    )
    )
	
)

(defrule why_not_question ""
    (not (why_not_question ?))
    (do_you_kill_it_question no)
    =>
    (assert (display (result no) (question why_not_question)
						   (answers someone_else_does like_extra_rare_steak)
		    )
    )
	
)










(defrule cockroach
    
    (favorite_thing_to_do run)
    (how_fast_question pretty_quick)
    (indoor_question yes)
    (do_you_own_question im_between_floors)
    =>     (assert (display (result yes) (question none) (answers none)))

    (assert (result (animal cockroach)))
)

(defrule schnauzer
    
    (favorite_thing_to_do run)
    (how_fast_question pretty_quick)
    (indoor_question yes)
    (do_you_own_question if_i_pee)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal schnauzer)))
)

(defrule quaterhorse
    
    (favorite_thing_to_do run)
    (how_fast_question pretty_quick)
    (indoor_question no)
    (what_on_ipod_question old_home)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal quaterhorse)))
)

(defrule lion
    
    (favorite_thing_to_do run)
    (how_fast_question pretty_quick)
    (indoor_question no)
    (what_on_ipod_question matata)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal lion)))
)

(defrule falcon
    
    (favorite_thing_to_do run)
    (how_fast_question so_fast)
    (literally_question yes)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal falcon)))
)

(defrule ostrich
    
    (favorite_thing_to_do run)
    (how_fast_question so_fast)
    (literally_question no)
    (how_then_question in_dreams)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal ostrich)))
)

(defrule cheetah
    
    (favorite_thing_to_do run)
    (how_fast_question so_fast)
    (literally_question no)
    (how_then_question metaphorically)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal cheetah)))
)

(defrule kangaroo
    
    (favorite_thing_to_do run)
    (how_fast_question i_walk)
    (with_haste_question yes)
    (your_posture_question good)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal kangaroo)))
)

(defrule gorilla
    
    (favorite_thing_to_do run)
    (how_fast_question i_walk)
    (with_haste_question yes)
    (your_posture_question quasimodo)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal gorilla)))
)

(defrule tortoise
    
    (favorite_thing_to_do run)
    (how_fast_question i_walk)
    (with_haste_question no)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal tortoise)))
)

(defrule dolphine
    
    (favorite_thing_to_do mate)
    (hit_and_quit_question yes)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal dolphine)))
)

(defrule seahorse
    
    (favorite_thing_to_do mate)
    (hit_and_quit_question no)
    (stay_at_home_question yes)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal seahorse)))
)

(defrule dove
    
    (favorite_thing_to_do mate)
    (hit_and_quit_question no)
    (stay_at_home_question no)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal dove)))
)

(defrule monitor
    
    (favorite_thing_to_do swim)
    (where_swim_question sand)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal monitor)))
)

(defrule pigeon
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_puddles)
	(do_you_eat_fries_question and_pretzels)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal pigeon)))
)

(defrule algae
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_puddles)
	(do_you_eat_fries_question no)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal algae)))
)

(defrule mussel
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_ponds_lakes)
	(your_buoyancy_question sink_lika_rock)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal mussel)))
)

(defrule goose
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_ponds_lakes)
	(your_buoyancy_question couldnt_sink)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal goose)))
)

(defrule otter
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_rivers_streams)
	(recreationally_question like_goof_around)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal otter)))
)

(defrule piranha
    
    (favorite_thing_to_do swim)
    (where_swim_question in_shallows)
	(in_what_shallows in_rivers_streams)
	(recreationally_question can_be_intense)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal piranha)))
)

(defrule shark
    
    (favorite_thing_to_do swim)
    (where_swim_question deep_blue_sea)
	(alone_question yes)
	(bummer_question im_mean)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal shark)))
)

(defrule jellyfish
    
    (favorite_thing_to_do swim)
    (where_swim_question deep_blue_sea)
	(alone_question yes)
	(bummer_question feel_invisible)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal jellyfish)))
)

(defrule angelfish
    
    (favorite_thing_to_do swim)
    (where_swim_question deep_blue_sea)
	(alone_question no)
	(with_who_question life_mate)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal angelfish)))
)

(defrule barracuda
    
    (favorite_thing_to_do swim)
    (where_swim_question deep_blue_sea)
	(alone_question no)
	(with_who_question facebook_friends)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal barracuda)))
)

(defrule viperfish
    
    (favorite_thing_to_do swim)
    (where_swim_question no_deep_blue_sea)
	(or(you_scary_question yes) (you_scary_question no))
	(do_you_have_more_question teeth)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal viperfish)))
)

(defrule squid
    
    (favorite_thing_to_do swim)
    (where_swim_question no_deep_blue_sea)
	(or(you_scary_question yes) (you_scary_question no))
	(do_you_have_more_question appendages)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal squid)))
)

(defrule bat
    
    (favorite_thing_to_do sleep)
    (work_graveyard_shift_question yes)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal bat)))
)

(defrule armadillo
    
    (favorite_thing_to_do sleep)
    (work_graveyard_shift_question no)
    (you_cuddly_question my_mother_says)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal armadillo)))
)

(defrule koala
    
    (favorite_thing_to_do sleep)
    (work_graveyard_shift_question no)
    (you_cuddly_question other_people_say)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal koala)))
)

(defrule yak
    
    (favorite_thing_to_do eat)
    (what_you_eat_question no_meat)
    (you_hippie_question yes)
	(rockin_beard_question full_body)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal yak)))
)

(defrule zebra
    
    (favorite_thing_to_do eat)
    (what_you_eat_question no_meat)
    (you_hippie_question yes)
	(rockin_beard_question like_tats)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal zebra)))
)

(defrule worm
    
    (favorite_thing_to_do eat)
    (what_you_eat_question no_meat)
    (you_hippie_question no)
	(how_you_vote_question for_underground)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal worm)))
)

(defrule elephant
    
    (favorite_thing_to_do eat)
    (what_you_eat_question no_meat)
    (you_hippie_question no)
	(how_you_vote_question for_guns)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal elephant)))
)

(defrule black_bear
    
    (favorite_thing_to_do eat)
    (what_you_eat_question not_that_picky)
    (would_you_climb_tree_question yes)
	(how_quickly_question faster)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal black_bear)))
)

(defrule sloth
    
    (favorite_thing_to_do eat)
    (what_you_eat_question not_that_picky)
    (would_you_climb_tree_question yes)
	(how_quickly_question slower)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal sloth)))
)

(defrule marmot
    
    (favorite_thing_to_do eat)
    (what_you_eat_question not_that_picky)
    (would_you_climb_tree_question no)
	(why_lazy_question need_beauty_sleep)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal marmot)))
)

(defrule raccoon
    
    (favorite_thing_to_do eat)
    (what_you_eat_question not_that_picky)
    (would_you_climb_tree_question no)
	(why_lazy_question trash_cans_easier)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal raccoon)))
)

(defrule python
    
    (favorite_thing_to_do eat)
    (what_you_eat_question things_with_blood)
    (do_you_kill_it_question yes)
	(how_long_question hours)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal python)))
)

(defrule crocodile
    
    (favorite_thing_to_do eat)
    (what_you_eat_question things_with_blood)
    (do_you_kill_it_question yes)
	(how_long_question seconds)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal crocodile)))
)

(defrule spider
    
    (favorite_thing_to_do eat)
    (what_you_eat_question things_with_blood)
    (do_you_kill_it_question yes)
	(how_long_question kill_later)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal spider)))
)

(defrule vulture
    
    (favorite_thing_to_do eat)
    (what_you_eat_question things_with_blood)
    (do_you_kill_it_question no)
	(why_not_question someone_else_does)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal vulture)))
)

(defrule leech
    
    (favorite_thing_to_do eat)
    (what_you_eat_question things_with_blood)
    (do_you_kill_it_question no)
	(why_not_question like_extra_rare_steak)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert (result (animal leech)))
)

(defrule sheep
    
   
    (favorite_thing_to_do i_dont_understand)
    =>     (assert (display (result yes) (question none) (answers none)))
    (assert(result (animal sheep)))
)