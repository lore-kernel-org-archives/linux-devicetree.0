From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 10/14] dt-bindings: power: avs: Add support for CPR
 (Core Power Reduction)
Date: Thu, 22 Aug 2019 12:20:02 +0200
Message-ID: <20190822102002.GA8494@centauri>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
 <20190725104144.22924-11-niklas.cassel@linaro.org>
 <5d579b36.1c69fb81.85eba.ff51@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d579b36.1c69fb81.85eba.ff51@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, linux-arm-msm@vger.kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 16, 2019 at 11:14:13PM -0700, Stephen Boyd wrote:
> Quoting Niklas Cassel (2019-07-25 03:41:38)
> > +       cpr@b018000 {
> > +               compatible = "qcom,qcs404-cpr", "qcom,cpr";
> > +               reg = <0x0b018000 0x1000>;
> > +               interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
> > +               clocks = <&xo_board>;
> > +               clock-names = "ref";
> > +               vdd-apc-supply = <&pms405_s3>;
> > +               #power-domain-cells = <0>;
> > +               operating-points-v2 = <&cpr_opp_table>;
> > +               acc-syscon = <&tcsr>;
> > +
> > +               nvmem-cells = <&cpr_efuse_quot_offset1>,
> > +                       <&cpr_efuse_quot_offset2>,
> > +                       <&cpr_efuse_quot_offset3>,
> > +                       <&cpr_efuse_init_voltage1>,
> > +                       <&cpr_efuse_init_voltage2>,
> > +                       <&cpr_efuse_init_voltage3>,
> > +                       <&cpr_efuse_quot1>,
> > +                       <&cpr_efuse_quot2>,
> > +                       <&cpr_efuse_quot3>,
> > +                       <&cpr_efuse_ring1>,
> > +                       <&cpr_efuse_ring2>,
> > +                       <&cpr_efuse_ring3>,
> > +                       <&cpr_efuse_revision>;
> > +               nvmem-cell-names = "cpr_quotient_offset1",
> > +                       "cpr_quotient_offset2",
> > +                       "cpr_quotient_offset3",
> > +                       "cpr_init_voltage1",
> > +                       "cpr_init_voltage2",
> > +                       "cpr_init_voltage3",
> > +                       "cpr_quotient1",
> > +                       "cpr_quotient2",
> > +                       "cpr_quotient3",
> > +                       "cpr_ring_osc1",
> > +                       "cpr_ring_osc2",
> > +                       "cpr_ring_osc3",
> > +                       "cpr_fuse_revision";
> > +
> > +               qcom,cpr-timer-delay-us = <5000>;
> > +               qcom,cpr-timer-cons-up = <0>;
> > +               qcom,cpr-timer-cons-down = <2>;
> > +               qcom,cpr-up-threshold = <1>;
> > +               qcom,cpr-down-threshold = <3>;
> > +               qcom,cpr-idle-clocks = <15>;
> > +               qcom,cpr-gcnt-us = <1>;
> > +               qcom,vdd-apc-step-up-limit = <1>;
> > +               qcom,vdd-apc-step-down-limit = <1>;
> 
> Are any of these qcom,* properties going to change for a particular SoC?
> They look like SoC config data that should just go into the driver and
> change based on the SoC compatible string.
> 

Hello Stephen,
thanks a lot for your reviews.

I agree with you, will drop these properties from the dt-binding
and the driver once I respin the series.

I'm hoping to get the cpufreq part of the patch series merged this
merge window, so that the patch pile will decrease.


Kind regards,
Niklas
