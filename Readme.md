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
\begin{bmatrix}I_1\\I_2\\...\\I_n\end{bmatrix} = \begin{bmatrix}f_1(V_1,V_3,...,V_{km})\\f_3(V_1,V_3,...,V_{km})\\...\\f_{km}(V_1,V_3,...,V_{km})\end{bmatrix}
```

For generation of synthetic throughput data we utilize PSCAD/EMTdc software for feederwide interactions between multiple houses with power electronic loads such as EV, laptop, desktop, PV inverter, HVAC.



<img src="https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/house_representation.png?raw=true" align="right" width="450px"/>

Non-linear power electronic loads intothe distribution network has the potential to disrupt the existing distribution transformer operations. They were not designed to mediate the excessive heating losses 
generated from the harmonics. To have a good  understanding of  current standing challenges, a knowledge of the generation and load mix as well as the current harmonic estimations are essential for designing 
transformers and evaluating their performance.

<br clear="left"/>

Detailed power electronic models are developed for different load combinations to create harmonic rich datasets to entail their effect on transformer operation usinf PSCAD/EMTdc.

**Authors**
```
Bhaskar Mitra

Ankit Singhal

Soumya Kundu

James Ogle
```

**Publications**

B. Mitra, A. Singhal, S. Kundu, J. P Ogle,"Analyzing Distribution Transformer Degradation with Increased Power Electronic Loads", 2023 IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT), Washington D.C., USA, 2023,

A. Singhal, D. Wang, A. P. Reiman, Y. Liu, D. J. Hammerstrom and S. Kundu, "Harmonic Modeling, Data Generation, and Analysis of Power Electronics-Interfaced Residential Loads," 2022 IEEE Power & Energy Society Innovative Smart Grid Technologies Conference (ISGT), New Orleans, LA, USA, 2022, pp. 1-5, doi: 10.1109/ISGT50606.2022.9817492.

**Citation**

If you are using our repository kindly use the following citation format(s).

_Bibtex_



_Chicago_



_APA_



_MLA_



**Acknowledgement**

This work was supported by the Sensors and Data Analytics Program of the U.S. Department of Energy Office of Electricity.
