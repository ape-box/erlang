-module(custom_set_tests).

% This file is automatically generated from the exercises canonical data.

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").


sets_with_no_elements_are_empty_test() ->
    ?assert(custom_set:empty(custom_set:from_list([]))).

sets_with_elements_are_not_empty_test() ->
    ?assertNot(custom_set:empty(custom_set:from_list([1]))).

nothing_is_contained_in_an_empty_set_test() ->
    ?assertNot(custom_set:contains(1,
				   custom_set:from_list([]))).

when_the_element_is_in_the_set_test() ->
    ?assert(custom_set:contains(1,
				custom_set:from_list([1, 2, 3]))).

when_the_element_is_not_in_the_set_test() ->
    ?assertNot(custom_set:contains(4,
				   custom_set:from_list([1, 2, 3]))).

empty_set_is_a_subset_of_another_empty_set_test() ->
    ?assert(custom_set:subset(custom_set:from_list([]),
			      custom_set:from_list([]))).

empty_set_is_a_subset_of_non_empty_set_test() ->
    ?assert(custom_set:subset(custom_set:from_list([]),
			      custom_set:from_list([1]))).

non_empty_set_is_not_a_subset_of_empty_set_test() ->
    ?assertNot(custom_set:subset(custom_set:from_list([1]),
				 custom_set:from_list([]))).

set_is_a_subset_of_set_with_exact_same_elements_test() ->
    ?assert(custom_set:subset(custom_set:from_list([1, 2,
						    3]),
			      custom_set:from_list([1, 2, 3]))).

set_is_a_subset_of_larger_set_with_same_elements_test() ->
    ?assert(custom_set:subset(custom_set:from_list([1, 2,
						    3]),
			      custom_set:from_list([4, 1, 2, 3]))).

set_is_not_a_subset_of_set_that_does_not_contain_its_elements_test() ->
    ?assertNot(custom_set:subset(custom_set:from_list([1, 2,
						       3]),
				 custom_set:from_list([4, 1, 3]))).

the_empty_set_is_disjoint_with_itself_test() ->
    ?assert(custom_set:disjoint(custom_set:from_list([]),
				custom_set:from_list([]))).

empty_set_is_disjoint_with_non_empty_set_test() ->
    ?assert(custom_set:disjoint(custom_set:from_list([]),
				custom_set:from_list([1]))).

non_empty_set_is_disjoint_with_empty_set_test() ->
    ?assert(custom_set:disjoint(custom_set:from_list([1]),
				custom_set:from_list([]))).

sets_are_not_disjoint_if_they_share_an_element_test() ->
    ?assertNot(custom_set:disjoint(custom_set:from_list([1,
							 2]),
				   custom_set:from_list([2, 3]))).

sets_are_disjoint_if_they_share_no_elements_test() ->
    ?assert(custom_set:disjoint(custom_set:from_list([1,
						      2]),
				custom_set:from_list([3, 4]))).

empty_sets_are_equal_test() ->
    ?assert(custom_set:equal(custom_set:from_list([]),
			     custom_set:from_list([]))).

empty_set_is_not_equal_to_non_empty_set_test() ->
    ?assertNot(custom_set:equal(custom_set:from_list([]),
				custom_set:from_list([1, 2, 3]))).

non_empty_set_is_not_equal_to_empty_set_test() ->
    ?assertNot(custom_set:equal(custom_set:from_list([1, 2,
						      3]),
				custom_set:from_list([]))).

sets_with_the_same_elements_are_equal_test() ->
    ?assert(custom_set:equal(custom_set:from_list([1, 2]),
			     custom_set:from_list([2, 1]))).

sets_with_different_elements_are_not_equal_test() ->
    ?assertNot(custom_set:equal(custom_set:from_list([1, 2,
						      3]),
				custom_set:from_list([1, 2, 4]))).

add_to_empty_set_test() ->
    ?assertEqual(custom_set:from_list([3]),
		 custom_set:add(3, custom_set:from_list([]))).

add_to_non_empty_set_test() ->
    ?assertEqual(custom_set:from_list([1, 2, 3, 4]),
		 custom_set:add(3, custom_set:from_list([1, 2, 4]))).

adding_an_existing_element_does_not_change_the_set_test() ->
    ?assertEqual(custom_set:from_list([1, 2, 3]),
		 custom_set:add(3, custom_set:from_list([1, 2, 3]))).

intersection_of_two_empty_sets_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:intersection(custom_set:from_list([]),
					 custom_set:from_list([]))).

intersection_of_an_empty_set_and_non_empty_set_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:intersection(custom_set:from_list([]),
					 custom_set:from_list([3, 2, 5]))).

intersection_of_a_non_empty_set_and_an_empty_set_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:intersection(custom_set:from_list([1, 2, 3,
							       4]),
					 custom_set:from_list([]))).

intersection_of_two_sets_with_no_shared_elements_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:intersection(custom_set:from_list([1, 2, 3]),
					 custom_set:from_list([4, 5, 6]))).

intersection_of_two_sets_with_shared_elements_is_a_set_of_the_shared_elements_test() ->
    ?assertEqual(custom_set:from_list([2, 3]),
		 custom_set:intersection(custom_set:from_list([1, 2, 3,
							       4]),
					 custom_set:from_list([3, 2, 5]))).

difference_of_two_empty_sets_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:difference(custom_set:from_list([]),
				       custom_set:from_list([]))).

difference_of_empty_set_and_non_empty_set_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:difference(custom_set:from_list([]),
				       custom_set:from_list([3, 2, 5]))).

difference_of_a_non_empty_set_and_an_empty_set_is_the_non_empty_set_test() ->
    ?assertEqual(custom_set:from_list([1, 2, 3, 4]),
		 custom_set:difference(custom_set:from_list([1, 2, 3,
							     4]),
				       custom_set:from_list([]))).

difference_of_two_non_empty_sets_is_a_set_of_elements_that_are_only_in_the_first_set_test() ->
    ?assertEqual(custom_set:from_list([1, 3]),
		 custom_set:difference(custom_set:from_list([3, 2, 1]),
				       custom_set:from_list([2, 4]))).

union_of_empty_sets_is_an_empty_set_test() ->
    ?assertEqual(custom_set:from_list([]),
		 custom_set:union(custom_set:from_list([]),
				  custom_set:from_list([]))).

union_of_an_empty_set_and_non_empty_set_is_the_non_empty_set_test() ->
    ?assertEqual(custom_set:from_list([2]),
		 custom_set:union(custom_set:from_list([]),
				  custom_set:from_list([2]))).

union_of_a_non_empty_set_and_empty_set_is_the_non_empty_set_test() ->
    ?assertEqual(custom_set:from_list([1, 3]),
		 custom_set:union(custom_set:from_list([1, 3]),
				  custom_set:from_list([]))).

union_of_non_empty_sets_contains_all_unique_elements_test() ->
    ?assertEqual(custom_set:from_list([3, 2, 1]),
		 custom_set:union(custom_set:from_list([1, 3]),
				  custom_set:from_list([2, 3]))).

version_test() ->
    ?assertMatch(1, custom_set:test_version()).
