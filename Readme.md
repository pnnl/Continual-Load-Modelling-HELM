# HydroGenerate

## About

**Continual Load Modelling (HELM)** provides an approach to the exisiting load modelling efforts by considering power electronic devices while formulating generalized load structures. Previously load models were defined as (1) conventional ZIP (constant impedance (Z), current (I), and power (P) at fundamental frequency. (2) Adjusted ZIP to account for the current harmonics using a multiplying factor, the voltage harmonics are not considered. (3) Norton Model utilizes a linear relationship between corresponding harmonic components of load current and voltage, the cross coupling effects between the current and voltage harmonics are not considered.
Frequency Coupling Matrix (FCM) approach allows a cross coupling between the load current and voltage through a linear relationship. It utilizes the generalized Norton model, cross admittance matrix, harmonic admittance matrix. The main drawback is that it assumes a linear relationship between the harmonics.
The non-linear coupling model provides a cross coupling between the load current and voltage using a non-linear relationship. The major challenge incorporates a generalized model with high throughput data.

```math
\begin{bmatrix}I_1\\I_2\\...\\I_n\end{bmatrix} = \begin{bmatrix}f_1(V_1,V_3,...,V_{km})\\f_3(V_1,V_3,...,V_{km})\\...\\f_{km}(V_1,V_3,...,V_{km})\end{bmatrix}
```

For generation of synthetic throughput data we utilize PSCAD/EMTdc software for feederwide interactions between multiple houses with power electronic loads such as EV, laptop, desktop, PV inverter, HVAC.

![alt text](https://github.com/pnnl/Continual-Load-Modelling-HELM/raw/master/img/house_representation.png?raw=true)



**Authors**
```
Bhaskar Mitra

Ankit Singhal

Soumya Kundu

James Ogle
```

**Citation**

If you are using our repository kindly use the following citation format(s).

_Bibtex_
```


@misc{osti_1829986,
title = {Hydrogenerate: Open Source Python Tool To Estimate Hydropower Generation Time-series, Version 3.6 or newer},
author = {Mitra, Bhaskar and Gallego-Calderon, Juan F. and Elliott, Shiloh N and Mosier, Thomas M and USDOE Office of Energy Efficiency and Renewable Energy},
abstractNote = {Hydropower is one of the most mature forms of renewable energy generation. The United States (US) has almost 103 GW of installed, with 80 GW of conventional generation and 23 GW of pumped hydropower [1]. Moreover, the potential for future development on Non-Powered Dams is up to 10 GW. With the US setting its goals to become carbon neutral [2], more renewable energy in the form of hydropower needs to be integrated with the grid. Currently, there are no publicly available tool that can estimate the hydropower potential for existing hydropower dams or other non-powered dams. The HydroGenerate is an open-source python library that has the capability of estimating hydropower generation based on flow rate either provided by the user or received from United States Geological Survey (USGS) water data services. The tool calculates the efficiency as a function of flow based on the turbine type either selected by the user or estimated based on the “head” provided by the user.},
url = {https://www.osti.gov//servlets/purl/1829986},
doi = {10.11578/dc.20211112.1},
url = {https://www.osti.gov/biblio/1829986}, year = {2021},
month = {10},
note =
}
```

_Chicago_

```


Mitra, Bhaskar, Gallego-Calderon, Juan F., Elliott, Shiloh N, Mosier, Thomas M, and USDOE Office of Energy Efficiency and Renewable Energy. Hydrogenerate: Open Source Python Tool To Estimate Hydropower Generation Time-series. Computer software. Version 3.6 or newer. October 19, 2021. https://www.osti.gov//servlets/purl/1829986. doi:https://doi.org/10.11578/dc.20211112.1.

```

_APA_

```


Mitra, Bhaskar, Gallego-Calderon, Juan F., Elliott, Shiloh N, Mosier, Thomas M, & USDOE Office of Energy Efficiency and Renewable Energy. (2021, October 19). Hydrogenerate: Open Source Python Tool To Estimate Hydropower Generation Time-series (Version 3.6 or newer) [Computer software]. https://www.osti.gov//servlets/purl/1829986. https://doi.org/10.11578/dc.20211112.1
```

_MLA_

```

Mitra, Bhaskar, Gallego-Calderon, Juan F., Elliott, Shiloh N, Mosier, Thomas M, and USDOE Office of Energy Efficiency and Renewable Energy. Hydrogenerate: Open Source Python Tool To Estimate Hydropower Generation Time-series. Computer software. https://www.osti.gov//servlets/purl/1829986. Vers. 3.6 or newer. USDOE Office of Energy Efficiency and Renewable Energy (EERE). 19 Oct. 2021. Web. doi:10.11578/dc.20211112.1.
```

**Acknowledgement**

The project is funded by the Sensor Technologies and Data Analytics Program (US DOE OE)
