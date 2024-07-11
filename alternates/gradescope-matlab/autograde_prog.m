%% -*- Mode: matlab -*-
%% Sample Octave assignment autograder for Gradescope
%%
%% The sample assignment is: prog.m
%%
%% Author: Marek Rychlik


clear all;
print(path);
addpath('..')

filename = "prog.m" % Assignment file name


json_filename = "/autograder/results/results.json" % Change to "results.json" when testing locally
results_exemplar = jsondecode(fileread("results_exemplar.json"));



test_cases(1).name = "One";
test_cases(1).fun = 'prog';
test_cases(1).args = { 1, 2 };
test_cases(1).expect = 3;
test_cases(1).visibility = "visible";
test_cases(1).weight = 10;


test_cases(2).name = "Two";
test_cases(2).fun  = 'prog',
test_cases(2).args = { 2, 5, 7 };
test_cases(2).expect = 14;
test_cases(2).visibility = "visible"
test_cases(2).weight = 10;

for j = 1:numel(test_cases)
  cur = test_cases(j);
  cur_test = results_exemplar.tests;
  try
    ret_val = feval(cur.fun,cur.args{:});
  if ret_val == cur.expect 
    cur_test.score =  cur.weight;
    cur_test.output = "Test passed"
  else
    cur.score = 0;
    cur.output = "Invalid output";
    cur_test.name = cur.name;
    cur_test.score = cur.score;
    cur_test.max_score = cur.weight;
  end
  catch
    cur_test.output = "Test resulted in an error.";
  end_try_catch;

  tests(j) = cur_test;
end

results = struct('tests',tests);

json_results = jsonencode(results,'PrettyPrint',true)
fid = fopen(json_filename,"w");
fwrite(fid,json_results);
fclose(fid);
