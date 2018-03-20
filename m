From: <ilialin@codeaurora.org>
Subject: RE: [PATCH v3 09/10] DT: QCOM: Add cpufreq-dt to msm8996
Date: Tue, 20 Mar 2018 15:46:19 +0200
Message-ID: <013a01d3c051$d65a9160$830fb420$@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-10-git-send-email-ilialin@codeaurora.org>
 <152147812199.242365.11821734771337881765@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <152147812199.242365.11821734771337881765@swboyd.mtv.corp.google.com>
Content-Language: en-us
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Stephen Boyd' <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 18:49
> To: Ilia Lin <ilialin@codeaurora.org>; linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 09/10] DT: QCOM: Add cpufreq-dt to msm8996
> 
> Quoting Ilia Lin (2018-02-14 05:59:51)
> > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > index 492a011..930f68b 100644
> > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > @@ -1,5 +1,5 @@
> >  /*
> > - * Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2014-2016,2018 The Linux Foundation. All rights reserved.
> >   *
> >   * This program is free software; you can redistribute it and/or modify
> >   * it under the terms of the GNU General Public License version 2 and
> 
> Why?
The file was changed again in 2018. I'm reflecting this in the file dates.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 4b2afcc..0359197 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -144,6 +152,182 @@
> >                 };
> >         };
> >
> > +       cluster0_opp: opp_table0 {
> > +               compatible = "operating-points-v2";
> > +               opp-shared;
> > +
> > +               opp@307200000 {
> > +                       opp-hz = /bits/ 64 <  307200000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@422400000 {
> > +                       opp-hz = /bits/ 64 <  422400000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@480000000 {
> 
> It looks like opp-480000000 now instead of opp@<freq>.
Will be changed in the next spin.
> 
> > +                       opp-hz = /bits/ 64 <  480000000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@556800000 {
> > +                       opp-hz = /bits/ 64 <  556800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@652800000 {
> > +                       opp-hz = /bits/ 64 <  652800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@729600000 {
> > +                       opp-hz = /bits/ 64 <  729600000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@844800000 {
> > +                       opp-hz = /bits/ 64 <  844800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@960000000 {
> > +                       opp-hz = /bits/ 64 <  960000000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1036800000 {
> > +                       opp-hz = /bits/ 64 < 1036800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1113600000 {
> > +                       opp-hz = /bits/ 64 < 1113600000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1190400000 {
> > +                       opp-hz = /bits/ 64 < 1190400000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1228800000 {
> > +                       opp-hz = /bits/ 64 < 1228800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1324800000 {
> > +                       opp-hz = /bits/ 64 < 1324800000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1401600000 {
> > +                       opp-hz = /bits/ 64 < 1401600000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1478400000 {
> > +                       opp-hz = /bits/ 64 < 1478400000 >;
> > +                       clock-latency-ns = <200000>;
> > +               };
> > +               opp@1593600000 {
> [...]
> > +
> > +       };
> >         thermal-zones {
> >                 cpu-thermal0 {
> >                         polling-delay-passive = <250>; @@ -403,7
> > +587,7 @@
> >                 };
> >
> >                 kryocc: clock-controller@6400000 {
> > -                       compatible = "qcom,apcc-msm8996";
> > +                       compatible = "qcom-msm8996-apcc";
> 
> Bad change?
This was required by Rob Herring.
> 
> >                         reg = <0x6400000 0x90000>;
> >                         #clock-cells = <1>;
> >                 };
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c
> > b/drivers/cpufreq/cpufreq-dt-platdev.c
> > index 3b585e4..b6cd0ae 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -95,6 +95,9 @@
> >         { .compatible = "xlnx,zynq-7000", },
> >         { .compatible = "xlnx,zynqmp", },
> >
> > +       { .compatible = "qcom,msm8996", },
> > +       { .compatible = "qcom,apq8096", },
> > +
> 
> Why can't we base it on the kryocc node being present?
This could be good idea, if I would writing a platform specific cpufreq driver, which may be a future option.
> Or even populate
> the cpufreq-dt from the kryocc driver?
There is a problem that during the clock probe the OPP table still doesn't exist. 
