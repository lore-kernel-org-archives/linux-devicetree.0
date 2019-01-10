From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v1 7/7] arm64: dts: sdm845: wireup the thermal trip
 points to cpufreq
Date: Thu, 10 Jan 2019 11:53:59 +0530
Message-ID: <20190110062359.aea3tic5aw3iuocr@vireshk-i7>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <6c5b26e65be18222587724e066fc2e39b9f60397.1547078153.git.amit.kucheria@linaro.org>
 <20190110022217.GX261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190110022217.GX261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, tdas@codeaurora.org, swboyd@chromium.org, dianders@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09-01-19, 18:22, Matthias Kaehlcke wrote:
> Hi Amit,
> 
> On Thu, Jan 10, 2019 at 05:30:56AM +0530, Amit Kucheria wrote:
> > Since the big and little cpus are in the same frequency domain, use all
> > of them for mitigation in the cooling-map. At the lower trip points we
> > restrict ourselves to throttling only a few OPPs. At higher trip
> > temperatures, allow ourselves to be throttled to any extent.
> > 
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 145 +++++++++++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 29e823b0caf4..cd6402a9aa64 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -13,6 +13,7 @@
> >  #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> >  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >  
> >  / {
> >  	interrupt-parent = <&intc>;
> > @@ -99,6 +100,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x0>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> >  			next-level-cache = <&L2_0>;
> >  			L2_0: l2-cache {
> >  				compatible = "cache";
> > @@ -114,6 +116,7 @@
> >  			compatible = "qcom,kryo385";
> >  			reg = <0x0 0x100>;
> >  			enable-method = "psci";
> > +			#cooling-cells = <2>;
> 
> This is not needed (also applies to other for other non-policy
> cores). A single cpufreq device is created per frequency domain /
> cluster, hence a single cooling device is registered per cluster,
> which IMO makes sense given that the CPUs of a cluster can't change
> their frequencies independently.
 
> As per above, there are no cooling devices for CPU1-3 and CPU5-7.

lore.kernel.org/lkml/cover.1527244200.git.viresh.kumar@linaro.org
lore.kernel.org/lkml/b687bb6035fbb010383f4511a206abb4006679fa.1527244201.git.viresh.kumar@linaro.org

-- 
viresh
