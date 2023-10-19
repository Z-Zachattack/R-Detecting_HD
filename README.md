# Project Summary
## Description:
### Application:
The application of choice for this project will be R-Script. R-Script is a free environment that is adequate and free. Additionally, With its strong statistical and classification specialization, the R environment is exceptionally situated to examine the chosen data sets.
### Training Data:
Examine three data sets to determine whether a machine-learning algorithm can predict heart disease accurately. The three data sets discussed are from hospitals in Cleveland (303 instances), Hungary (294 instances), and Switzerland (123 instances). By looking for both positive diagnosis attributes to see if there are attributes with a negative correlation for heart disease. Processed data sets have been refined to 14 key attributes, 13 features, and 1 Predictor:
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
  14. (Prediction) Heart Disease (https://archive.ics.uci.edu/ml/datasets/Heart+Disease) Of note, the 14th attribute, which the model is attempting to predict, has five potential values:
* 0 means no presence of heart disease.
* 1-4 refers to ascendingly more severe heart disease.
  We will be considering any value from 1-4 as positive, thus a value of 0 is the primary consideration since severity is not of conserned in this model.
## Goals:
This project’s primary goal is to predict heart disease in patients using the features available accurately. Due to the sensitive nature of patient data and the moral obligations of doctors, it is imperative that our project prioritize accuracy above all other considerations. Because inaccurate predictions could lead to unnecessary surgeries or even death, there is an emphasis on maximizing the F1-Score (2* precision*recall/precision+recall)). 
While accuracy is of the utmost importance, we must also ensure that patient privacy is maintained and that any predictive model created respects that privacy.
Additionally, this project is highly motivated to ensure the predictive model is explainable, as such information would be invaluable to doctors. Next, we will examine different classification models to see which model provides the most accurate data. We will also explore whether some features negatively correlate to heart disease and if there are any other trends within the data.
Finally, if there is time, we may attempt to see if geographical regions have markedly different considerations, but this is not explicitly required for the project.
## Machine Learning Algorithm:
#### Precision, Recall, F1-score and Support:
**Precision:** be “how many are correctly classified among that class”
**Recall:** “how many of this class you find over the whole number of element of this class”
**F1-score:** harmonic mean of precision and recall values.
* F1 score reaches its best value at 1 and worst value at 0.
* F1 Score = 2 x ((precision x recall) / (precision + recall))
**Support:** # of samples of the true response that lie in that class.
#### Decision Tree:
* Creation/training consisted of choosing best Variables in each node and the best split (threshold).
* Take 'Labeled Input data' (label = decision class) - with a Target Variable and a list of Independent Variables
* Best Split: Find Best Split for each of the independent variables
* The use of multiple trees, each trained on slightly different training data, voting together for
the correct decision is compelling, robust, and clever.
#### RandomForest:
* Create NTREE training sets using bootstrap aggregating (bagging)
* From each NTREE set create a decision tree using CART (Classification and Regression Trees)
* RF is the rare ML alg that does not require explicit cross-validation.
[1] https://archive.ics.uci.edu/ml/datasets/Heart+Disease: UCI Machine Learning Repository
