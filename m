From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date: Wed, 4 Sep 2019 17:22:34 +0530
Message-ID: <20190904115234.GV2672@vkoul-mobl>
References: <20190904113917.15223-1-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904113917.15223-1-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04-09-19, 12:39, Lee Jones wrote:
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb

Can we keep this sorted, so before mtp.

>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> new file mode 100644
> index 000000000000..ad160c718b33
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: GPL-2.0

Are we going to make this dual? or BSD..

> +&apps_rsc {
> +	pm8998-rpmh-regulators {
> +		compatible = "qcom,pm8998-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
> +
> +		vreg_s2a_1p125: smps2 {
> +		};
> +
> +		vreg_s3a_1p35: smps3 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4a_1p8: smps4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a_2p04: smps5 {
> +			regulator-min-microvolt = <2040000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7a_1p025: smps7 {

Any reason why we dont specify the mode and min/max voltage for this
and few others below..?

> +&i2c1 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +	qcom,geni-se-fifo;
> +
> +	battery@70 {
> +		compatible = "some,battery";

some,battery ..?

> +&qup_i2c12_default {

Please move the qup nodes up so that nodes are sorted alphabetically

-- 
~Vinod
