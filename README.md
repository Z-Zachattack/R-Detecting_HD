* Project Summary
** Organization:
Research and Development (Machine Learning Expert): Waqas Hassan
Team Lead/Philosophy: Zachariah Woodbridge
** Description:
*** Application:
The application of choice for this project will be RScript. RScript is a free environment
that works on the entire teams’ computers. Additionally, RScript is compatible with
randomForest. With its strong statistical and classification processes, the R environment is
exceptionally situated to examine the chosen data sets.
Training Data:
We are examining three data sets to see if a machine-learning algorithm can accurately
predict heart disease. The three data sets we will discuss are from hospitals in Cleveland (303
instances), Hungary (294 instances), and Switzerland (123 instances). When examining these
data sets, we plan on looking for both positive diagnosis attributes and see if there are attributes
with a negative correlation for heart disease. Processed data sets have been refined to 14 key
attributes, 13 features, and 1 Predictor:
1. Age
2. Sex
3. Chest Pain
4. Resting Blood Pressure
5. Cholesterol
6. Fasting Blood Sugar
7. Resting Electrocardiographic Results
8. Maximum heart rate achieved
9. Exercise-Induced Angina
10. ST Depression Induced by Exercise Relative to Rest
11. Slope of Peak Exercise ST Segment
12. Number of Major Vessels (0-3) Colored by Fluoroscopy
13. Thalassemia
14. (Prediction) Heart Disease[1]
Of note, the 14th Attribute, which is the attribute we are attempting to predict, has five potential
values. 0 means no presence of heart disease, 1-4 refers to ascendingly more severe heart disease.
We will be considering any value from 1-4 as positive, while 0 being negative as our primary
consideration is whether or not heart disease is present, not the severity of the condition.
Goals:
This project’s primary goal is to accurately predict heart disease in patients using the
features available. Due to the sensitive nature of patient data and the moral obligations of
doctors, it is imperative that our project prioritize accuracy above all other considerations.
Because inaccurate predictions could lead to unnecessary surgeries or even death, we will be
focusing on maximizing the F1-Score (2*(precision*recall/precision+recall)). While accuracy is
of the utmost importance, we must also ensure that patient privacy is maintained and that any
predictive model created respects that privacy.
Additionally, we are highly motivated to ensure the predictive model created is highly
explainable as such information would be invaluable to doctors. Next, we will examine different
classification models to see which model provides the most accurate data. We will also explore
whether some features negatively correlate to heart disease and if there are any other trends
within the data.
If we have time, we may attempt to see if geographical regions have markedly different
considerations, but this is not explicitly required for the project.
Machine Learning Algorithm:
Precision, Recall, F1-score and Support:
Precision : be “how many are correctly classified among that class”
Recall : “how many of this class you find over the whole number of element of this class”
F1-score : harmonic mean of precision and recall values.
F1 score reaches its best value at 1 and worst value at 0.
F1 Score = 2 x ((precision x recall) / (precision + recall))
Support: # of samples of the true response that lie in that class.
Decision tree creation/training consisted of choosing best Variables in each node and the best
split (threshold).
Take Labeled Input data (label = decision class) - with a Target Variable and a list of Independent
Variables
Best Split: Find Best Split for each of the independent variables
The use of multiple trees, each trained on slightly different training data, voting together for
correct decision is very powerful, robust and clever
RF:
– create NTREE training sets using bootstrap aggregating (bagging)
– from each NTREE sets create decision tree using CART
RF is the rare ML alg that does not require explicit cross validation.
[1] https://archive.ics.uci.edu/ml/datasets/Heart+Disease: UCI Machine Learning Repository
