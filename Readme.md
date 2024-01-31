# Continual Load Modelling (HELM)


<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/fourier_series-011.png?raw=true" align="right" width="450px"/>

**Continual Load Modelling (HELM)** provides an approach to the exisiting load modelling efforts by considering power electronic devices while formulating generalized 
load structures. Previously load models were defined as (1) conventional ZIP (constant impedance (Z), current (I), and power (P) at fundamental frequency. 
(2) Adjusted ZIP to account for the current harmonics using a multiplying factor, the voltage harmonics are not considered. (3) Norton Model utilizes a linear relationship 
between corresponding harmonic components of load current and voltage, the cross coupling effects between the current and voltage harmonics are not considered.
Frequency Coupling Matrix (FCM) approach allows a cross coupling between the load current and voltage through a linear relationship. It utilizes the generalized 
Norton model, cross admittance matrix, harmonic admittance matrix. The main drawback is that it assumes a linear relationship between the harmonics.
The non-linear coupling model provides a cross coupling between the load current and voltage using a non-linear relationship. The major challenge incorporates a 
generalized model with high throughput data.

<br clear="left"/>


```math
\begin{bmatrix}I_1\\I_2\\.\\.\\.\\I_n\end{bmatrix} = \begin{bmatrix}f_1(V_1,V_3,...,V_{km})\\f_3(V_1,V_3,...,V_{km})\\...\\f_{km}(V_1,V_3,...,V_{km})\end{bmatrix}
```

For generation of synthetic throughput data we utilize PSCAD/EMTdc software for feederwide interactions between multiple houses with power electronic loads such as EV, laptop, desktop, PV inverter, HVAC.


<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/house_representation.png?raw=true" align="right" width="450px"/>

Non-linear power electronic loads intothe distribution network has the potential to disrupt the existing distribution transformer operations. They were not designed to mediate the excessive heating losses 
generated from the harmonics. To have a good  understanding of  current standing challenges, a knowledge of the generation and load mix as well as the current harmonic estimations are essential for designing 
transformers and evaluating their performance.

Detailed power electronic models are developed for different load combinations to create harmonic rich datasets to entail their effect on transformer operation using PSCAD/EMTdc. A high fidelity dataset 
was curated for the analysis using a mixture of different power electronic load combinations as discussed in the scenarios below. The data is collected from the secondary of a split phase transformer are [available](https://github.com/pnnl/Continual-Load-Modelling-HELM/tree/master/datasets).

For replicating a house EV charging condition a single phase EV charger with unidirectional power flow was designed (Level 1 120V) <br>.

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/EV_model.png?raw=true" align="left" width="500px"/>

<br>
The different loading conditions for the use cases are:

(i) 5 scenarios for 5 different houses sampled at 20kHz:

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/cases.jpg?raw=true" align="right" width="400px"/>

| Scenario | P <br> (kW) | Q <br> (kVar) | Transformer <br> Loading (%) |
| ------------- | ------------- | ------------- | ------------- |
| 1 | 7 | -3 | 14 |
| 2 | 7.75 |  -3 | 15 |
| 3 | 5.5 |  -8 | 20 |
| 4 | -20 | -5 | 41 |
| 5 | -7 | -33 | 68 |


(ii) 11 scenarios for 5 different houses along with EV sampled at 3.8kHz:

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/scenarios_ev.png?raw=true" align="right" width="400px"/>

| Scenario | P <br> (kW) | Q <br> (kVar) | Transformer <br> Loading (%) |
| ------------- | ------------- | ------------- | ------------- |
| 1 | 7 | -1 | 14 |
| 2 | 19 | 4 | 40 |
| 3 | 25 | 3.5 | 51 |
| 4 | 36 | 3 | 72 |
| 5 | 45 | 2 | 90 |
| 6 | 55 | 4 | 110 |
| 7 | 39 | -5 | 78 |
| 8 | 32 | -12 | 68 |
| 9 | 29 | -17 | 68 |
| 10 | 20 | -18 | 54 |
| 11 | 60 | -14.5 | 123 |

The load compositions depict different times of the day when the transformer would be loaded close to its maximum operating capacity. 

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/trans_current.png?raw=true" align="left" width="350px"/> <img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/transformer_sec.png?raw=true" align="right" width="400px"/>


<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/eddy_loss_4scenario.png?raw=true" align="left" width="350px"/> <img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/thd_eddy_loss.png?raw=true" align="right" width="400px"/>

<br clear="left"/> <br clear="right"/> 
Analysis of the transformer secondary currents are performed to have a detailed understanding on the Total Harmonic Distortion (THD) and Eddy Current losses (%).

For further details on our work please check out the poster presented at IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT) [2023](https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/ISGT23-Bhaskar.pdf).



**Team**
```
Soumya Kundu

Bhaskar Mitra

Orestis Vasios

Aaqib Peerzada

James Ogle
```

**Publications**

If you are using our data and repository kindly cite the following papers:


B. Mitra, A. Singhal, S. Kundu and J. P. Ogle, "Analyzing Distribution Transformer Degradation with Increased Power Electronic Loads," 2023 IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT), Washington, DC, USA, 2023, pp. 1-5, doi: 10.1109/ISGT51731.2023.10066387.

A. Singhal, D. Wang, A. P. Reiman, Y. Liu, D. J. Hammerstrom and S. Kundu, "Harmonic Modeling, Data Generation, and Analysis of Power Electronics-Interfaced Residential Loads," 2022 IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT), New Orleans, LA, USA, 2022, pp. 1-5, doi: 10.1109/ISGT50606.2022.9817492.


**Acknowledgement**

This work was supported by the Sensors and Data Analytics Program of the U.S. Department of Energy Office of Electricity.
