From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm8150: add base dts file
Date: Tue, 20 Aug 2019 18:03:57 +0530
Message-ID: <20190820123357.GZ12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-2-vkoul@kernel.org>
 <20190820122742.GE31261@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820122742.GE31261@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-08-19, 14:27, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:09PM +0530, Vinod Koul wrote:
> > This add base DTS file with cpu, psci, firmware, clock, tlmm and
> > spmi nodes which enables boot to console
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 305 +++++++++++++++++++++++++++
> >  1 file changed, 305 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > new file mode 100644
> > index 000000000000..d9dc95f851b7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2019, Linaro Limited
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > +#include <dt-bindings/clock/qcom,rpmh.h>
> > +
> > +/ {
> > +	interrupt-parent = <&intc>;
> > +
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	chosen { };
> 
> What is the point of an empty node without a label?
> Perhaps I'm missing something.

Hmm that seems to be the case with other dts in qcom folder :), we do
have chosen in mtp dts as well which is not empty

> 
> > +
> > +	clocks {
> > +		xo_board: xo-board {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <38400000>;
> > +			clock-output-names = "xo_board";
> > +		};
> > +
> > +		sleep_clk: sleep-clk {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32764>;
> > +			clock-output-names = "sleep_clk";
> > +		};
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <2>;
> > +		#size-cells = <0>;
> > +
> > +		CPU0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> 
> I don't see this compatible in
> Documentation/devicetree/bindings/arm/cpus.yaml

Thanks for pointing, will send

> 
> > +			reg = <0x0 0x0>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_0>;
> > +			L2_0: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +				L3_0: l3-cache {
> > +				      compatible = "cache";
> > +				};
> > +			};
> > +		};
> > +
> > +		CPU1: cpu@100 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x100>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_100>;
> > +			L2_100: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +
> > +		};
> > +
> > +		CPU2: cpu@200 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x200>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_200>;
> > +			L2_200: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +
> > +		CPU3: cpu@300 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x300>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_300>;
> > +			L2_300: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +
> > +		CPU4: cpu@400 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x400>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_400>;
> > +			L2_400: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +
> > +		CPU5: cpu@500 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x500>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_500>;
> > +			L2_500: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +
> > +		CPU6: cpu@600 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x600>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_600>;
> > +			L2_600: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +
> > +		CPU7: cpu@700 {
> > +			device_type = "cpu";
> > +			compatible = "qcom,kryo485";
> > +			reg = <0x0 0x700>;
> > +			enable-method = "psci";
> > +			next-level-cache = <&L2_700>;
> > +			L2_700: l2-cache {
> > +				compatible = "cache";
> > +				next-level-cache = <&L3_0>;
> > +			};
> > +		};
> > +	};
> 
> I was expecting to see the cpu-map here, defining
> the core to cluster relationship.

That would come later with bunch of other support

> 
> > +
> > +	firmware {
> > +		scm: scm {
> > +			compatible = "qcom,scm-sm8150", "qcom,scm";
> > +			#reset-cells = <1>;
> > +		};
> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		/* We expect the bootloader to fill in the size */
> > +		reg = <0 0x80000000 0 0>;
> > +	};
> > +
> > +	psci {
> > +		compatible = "arm,psci-1.0";
> > +		method = "smc";
> > +	};
> > +
> > +	soc: soc@0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		ranges = <0 0 0 0xffffffff>;
> > +		compatible = "simple-bus";
> > +
> > +		gcc: clock-controller@100000 {
> > +			compatible = "qcom,gcc-sm8150";
> > +			reg = <0x00100000 0x1f0000>;
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +			#power-domain-cells = <1>;
> > +			clock-names = "bi_tcxo",
> > +				      "sleep_clk";
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&sleep_clk>;
> > +		};
> > +
> > +		qupv3_id_1: geniqup@ac0000 {
> > +			compatible = "qcom,geni-se-qup";
> > +			reg = <0x00ac0000 0x6000>;
> > +			clock-names = "m-ahb", "s-ahb";
> > +			clocks = <&gcc 123>,
> > +				 <&gcc 124>;
> 
> Is there no defines for these?

It is, but if you look at cover we did that here so that we can get
these merged and not worry about dependency. The defines are in clock
tree. After next cycle these will be replaced with defines.

-- 
~Vinod
