From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: pm8150: Add Base DTS file
Date: Tue, 20 Aug 2019 18:04:43 +0530
Message-ID: <20190820123443.GA12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-3-vkoul@kernel.org>
 <20190820122719.GD31261@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820122719.GD31261@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 20-08-19, 14:27, Niklas Cassel wrote:
> On Tue, Aug 20, 2019 at 12:12:10PM +0530, Vinod Koul wrote:
> > Add base DTS file for pm8150 along with GPIOs, power-on, rtc and vadc
> > nodes
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8150.dtsi | 95 ++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> > new file mode 100644
> > index 000000000000..4a678be46d37
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> > @@ -0,0 +1,95 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2019, Linaro Limited
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > +
> > +&spmi_bus {
> > +	pm8150_0: pmic@0 {
> > +		compatible = "qcom,pm8150", "qcom,spmi-pmic";
> > +		reg = <0x0 SPMI_USID>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		pon: power-on@800 {
> > +			compatible = "qcom,pm8916-pon";
> > +			reg = <0x0800>;
> > +			pwrkey {
> > +				compatible = "qcom,pm8941-pwrkey";
> > +				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> 
> Here you use 0 for 3rd cell
> 
> > +				debounce = <15625>;
> > +				bias-pull-up;
> > +				linux,code = <KEY_POWER>;
> > +
> > +				status = "disabled";
> > +			};
> > +		};
> > +
> > +		pm8150_adc: adc@3100 {
> > +			compatible = "qcom,spmi-adc5";
> > +			reg = <0x3100>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			#io-channel-cells = <1>;
> > +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> 
> Here you use 0x0 for 3rd cell, be consistent.

Will make it either at this and other places, thanks for pointing!

-- 
~Vinod
