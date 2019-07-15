From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Date: Mon, 15 Jul 2019 15:24:05 +0200
Message-ID: <20190715132405.GA5040@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 10, 2019 at 02:33:03PM +0530, Viresh Kumar wrote:
> On 05-07-19, 11:57, Niklas Cassel wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> >  	cpu_opp_table: cpu-opp-table {
> > -		compatible = "operating-points-v2";
> > +		compatible = "operating-points-v2-kryo-cpu";
> >  		opp-shared;
> >  
> >  		opp-1094400000 {
> >  			opp-hz = /bits/ 64 <1094400000>;
> > -			opp-microvolt = <1224000 1224000 1224000>;
> > +			required-opps = <&cpr_opp1>;
> >  		};
> >  		opp-1248000000 {
> >  			opp-hz = /bits/ 64 <1248000000>;
> > -			opp-microvolt = <1288000 1288000 1288000>;
> > +			required-opps = <&cpr_opp2>;
> >  		};
> >  		opp-1401600000 {
> >  			opp-hz = /bits/ 64 <1401600000>;
> > -			opp-microvolt = <1384000 1384000 1384000>;
> > +			required-opps = <&cpr_opp3>;
> > +		};
> > +	};
> > +
> > +	cpr_opp_table: cpr-opp-table {
> > +		compatible = "operating-points-v2-qcom-level";
> > +
> > +		cpr_opp1: opp1 {
> > +			opp-level = <1>;
> > +			qcom,opp-fuse-level = <1>;
> > +			opp-hz = /bits/ 64 <1094400000>;
> > +		};
> > +		cpr_opp2: opp2 {
> > +			opp-level = <2>;
> > +			qcom,opp-fuse-level = <2>;
> > +			opp-hz = /bits/ 64 <1248000000>;
> > +		};
> > +		cpr_opp3: opp3 {
> > +			opp-level = <3>;
> > +			qcom,opp-fuse-level = <3>;
> > +			opp-hz = /bits/ 64 <1401600000>;
> >  		};
> >  	};
> 
> - Do we ever have cases more complex than this for this version of CPR ?

For e.g. CPR on msm8916, we will have 7 different frequencies in the CPU
OPP table, but only 3 OPPs in the CPR OPP table.

Each of the 7 OPPs in the CPU OPP table will have a required-opps that
points to an OPP in the CPR OPP table.

On certain msm8916:s, the speedbin efuse will limit us to only have 6
OPPs in the CPU OPP table, but the required-opps are still the same.

So I would say that it is just slightly more complex..

> 
> - What about multiple devices with same CPR table, not big LITTLE
>   CPUs, but other devices like two different type of IO devices ? What
>   will we do with opp-hz in those cases ?

On all SoCs where there is a CPR for e.g. GPU, there is an additional
CPR hardware block, so then there will also be an additional CPR OPP
table. So I don't think that this will be a problem.

> 
> - If there are no such cases, can we live without opp-hz being used
>   here and reverse-engineer the highest frequency by looking directly
>   at CPUs OPP table ? i.e. by looking at required-opps field.

This was actually my initial thought when talking to you 6+ months ago.
However, the problem was that, from the CPR drivers' perspective, it
only sees the CPR OPP table.


So this is the order things are called,
from qcom-cpufreq-nvmem.c perspective:

1) dev_pm_opp_set_supported_hw()

2) dev_pm_opp_attach_genpd() ->
which results in
int cpr_pd_attach_dev(struct generic_pm_domain *domain,
		      struct device *dev)
being called.
This callback is inside the CPR driver, and here we have the
CPU's (genpd virtual) struct device, and this is where we would like to
know the opp-hz.
The problem here is that:
[    3.114979] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: genpd:0:cpu0: -19
[    3.119610] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpu0: 0
[    3.126489] cpr_pd_attach_dev: dev_pm_opp_get_opp_count for dev: cpr@b018000: 3

While we have the CPR OPP table in the attach callback, we don't
have the CPU OPP table, neither in the CPU struct device or the genpd virtual
struct device.

Since we have called dev_pm_opp_attach_genpd(.., .., &virt_devs) which
attaches an OPP table to the CPU, I would have expected one of them to
be >= 0.
Especially since dev_name(virt_devs[0]) == genpd:0:cpu0

I guess it should still be possible to parse the required-opps manually here,
by iterating the OF nodes, however, we won't be able to use the CPU's struct
opp_table (which is the nice representation of the OF nodes).

Any suggestions?


Kind regards,
Niklas
