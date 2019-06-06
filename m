From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dragonboard 845c
Date: Thu, 6 Jun 2019 11:48:57 +0530
Message-ID: <20190606061857.GA9160@vkoul-mobl.Dlink>
References: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606043851.18050-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05-06-19, 21:38, Bjorn Andersson wrote:
> This adds an initial dts for the Dragonboard 845. Supported
> functionality includes Debug UART, UFS, USB-C (peripheral), USB-A
> (host), microSD-card and Bluetooth.
> 
> Initializing the SMMU is clearing the mapping used for the splash screen
> framebuffer, which causes the board to reboot. This can be worked around
> using:
> 
>   fastboot oem select-display-panel none

I was able to boot db845c on v5.2-rc1 with this patch :)
 
I found some nits, nevertheless this looks good, so:
 
Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>

> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0

No copyright?

> +	pcie0_3p3v_dual: vldo-3v3-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VLDO_3V3";
> +
> +		vin-supply = <&vbat>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie0_pwren_state>;
> +	};
> +
> +	gpio_keys {

Rest of this file is sorted but this isn't, so this should be after dc12v

> +		compatible = "gpio-keys";
> +		#address-cells = <1>;

does this require address cell, we don't have range property here?

> +		#size-cells = <0>;
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_pin_a>;
> +
> +		vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {

This one as well..

-- 
~Vinod
