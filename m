From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 06/12] ARM: dts: apq8064: Add MDP support
Date: Fri, 10 Apr 2015 10:04:54 -0700
Message-ID: <552802B6.2040804@codeaurora.org>
References: <1428669187-10775-1-git-send-email-srinivas.kandagatla@linaro.org> <1428669271-11032-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428669271-11032-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/10/15 05:34, Srinivas Kandagatla wrote:
> @@ -250,6 +265,18 @@
>  			};
>  		};
>  
> +		ext_3p3v: regulator-fixed@1 {
> +			compatible = "regulator-fixed";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-name = "ext_3p3v";
> +			regulator-type = "voltage";
> +			startup-delay-us = <0>;
> +			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};

This shouldn't be inside the SoC node because it doesn't have a reg
property. It should be in a 'regulators' node that's in the root of the
tree:

	regulators {
		compatible = "simple-bus";

		ext_3p3v: fixedregulator@0 {
			compatible = "regulator-fixed";
			...
		};
	};


> +
>  		qcom,ssbi@500000 {
>  			compatible = "qcom,ssbi";
>  			reg = <0x00500000 0x1000>;
> @@ -522,5 +549,82 @@
>  			compatible = "qcom,tcsr-apq8064", "syscon";
>  			reg = <0x1a400000 0x100>;
>  		};
> +
> +		hdmi: qcom,hdmi-tx@4a00000 {
> +			compatible = "qcom,hdmi-tx-8960";
> +			reg-names = "core_physical";
> +			reg = <0x04a00000 0x1000>;
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_NONE>;
> +			clock-names =
> +			    "core_clk",
> +			    "master_iface_clk",
> +			    "slave_iface_clk";
> +			clocks =
> +			    <&mmcc HDMI_APP_CLK>,
> +			    <&mmcc HDMI_M_AHB_CLK>,
> +			    <&mmcc HDMI_S_AHB_CLK>;
> +			qcom,hdmi-tx-ddc-clk = <&tlmm_pinmux 70
> +						GPIO_ACTIVE_HIGH>;
> +			qcom,hdmi-tx-ddc-data = <&tlmm_pinmux 71
> +						GPIO_ACTIVE_HIGH>;
> +			qcom,hdmi-tx-hpd = <&tlmm_pinmux 72
> +						GPIO_ACTIVE_HIGH>;

This should be done via the *-gpios method. i.e. hdmi-tx-ddc-clk-gpios,
hdmi-tx-ddc-data-gpios, etc.

> +			core-vdda-supply = <&pm8921_hdmi_switch>;
> +			hdmi-mux-supply = <&ext_3p3v>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&hdmi_pinctrl>;
> +		};
> +
> +		gpu: qcom,adreno-3xx@4300000 {
> +			compatible = "qcom,adreno-3xx";
> +			reg = <0x04300000 0x20000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_NONE>;
> +			interrupt-names = "kgsl_3d0_irq";
> +			clock-names =
> +			    "core_clk",
> +			    "iface_clk",
> +			    "mem_clk",
> +			    "mem_iface_clk";
> +			clocks =
> +			    <&mmcc GFX3D_CLK>,
> +			    <&mmcc GFX3D_AHB_CLK>,
> +			    <&mmcc GFX3D_AXI_CLK>,
> +			    <&mmcc MMSS_IMEM_AHB_CLK>;
> +			qcom,chipid = <0x03020002>;
> +			qcom,gpu-pwrlevels {
> +				compatible = "qcom,gpu-pwrlevels";
> +				qcom,gpu-pwrlevel@0 {
> +					qcom,gpu-freq = <450000000>;
> +				};
> +				qcom,gpu-pwrlevel@1 {
> +					qcom,gpu-freq = <27000000>;
> +				};
> +			};

This should be an OPP.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
