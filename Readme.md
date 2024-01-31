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
was curated for the analysis using a mixture of different power electronic load combinations including laptops, desktops/television, PV, HVAC and EVs. The data is collected from the secondary of a split phase transformer.
High fidelity data for two simulated conditions are [available](https://github.com/pnnl/Continual-Load-Modelling-HELM/tree/master/datasets).

The different loading conditions for the use cases are:

(i) 10 scenarios for 5 different houses:

| Scenario |  P (kW) | Q (kVar) |
| ------------- | ------------- | ------------- |
| 1 | 7 | -1 |
| 1 | 20 |  4 |
| 1 | 17 |  2 |
| 1 | 7 | -1 |
| 1 | 25 | -1 |

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/scenarios_updated.jpg?raw=true" align="right" width="450px"/>

(ii) 11 scenarios for 5 different houses along with EV:

| Scenario | P (kW) | Q (kVar) |
| ------------- | ------------- | ------------- |
| 1 | 7 | -1 |
| 2 | 19 | 4 |
| 3 | 25 | 3.5 |
| 4 | 36 | 3 |
| 5 | 45 | 2 |
| 6 | 55 | 4 |
| 7 | 39 | -5 |
| 8 | 32 | -12 |
| 9 | 29 | -17 |
| 10 | 20 | -18 |
| 11 | 60 | -14.5 |

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/scenarios_ev.png?raw=true" align="right" width="450px"/>

<br clear="left"/>

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/Transformer_current.png?raw=true" align="right" width="450px"/>

Currents recorded in the transformer secondary for scenarios described were recorded. The load compositions depict different times of the day when the transformer would be loaded close to 
its maximum operating capacity. 

<br clear="right"/>

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/transformer_sec.png?raw=true" align="left" width="400px"/>

<br clear="left"/>

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/THD_calc.png?raw=true" align="right" width="400px"/>

<br clear="left"/>

<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/thd_eddy_loss.png?raw=true" align="left" width="400px"/>

<br clear="left"/>

Analysis of the transformer secondary currents are performed to have a detailed understanding on the Total Harmonic Distortion (THD) and Eddy Current losses (%).

For further details on our work please check out the poster presented at IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT) [2023](https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/ISGT23-Bhaskar.pdf).


<br clear="right"/>

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
