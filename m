From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 06/12] ARM: dts: apq8064: Add MDP support
Date: Fri, 10 Apr 2015 20:39:34 +0100
Message-ID: <552826F6.5040105@linaro.org>
References: <1428669187-10775-1-git-send-email-srinivas.kandagatla@linaro.org> <1428669271-11032-1-git-send-email-srinivas.kandagatla@linaro.org> <552802B6.2040804@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <552802B6.2040804@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: bjorn.andersson@sonymobile.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
List-Id: devicetree@vger.kernel.org



On 10/04/15 18:04, Stephen Boyd wrote:
> On 04/10/15 05:34, Srinivas Kandagatla wrote:
>> @@ -250,6 +265,18 @@
>>   			};
>>   		};
>>
>> +		ext_3p3v: regulator-fixed@1 {
>> +			compatible = "regulator-fixed";
>> +			regulator-min-microvolt = <3300000>;
>> +			regulator-max-microvolt = <3300000>;
>> +			regulator-name = "ext_3p3v";
>> +			regulator-type = "voltage";
>> +			startup-delay-us = <0>;
>> +			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
>> +			enable-active-high;
>> +			regulator-boot-on;
>> +		};
>
> This shouldn't be inside the SoC node because it doesn't have a reg
> property. It should be in a 'regulators' node that's in the root of the
> tree:

Is this new DT requirement/style? I have not noticed such a dt style in 
the past. I might have missed it. Any advantage of doing this way?
>
> 	regulators {
> 		compatible = "simple-bus";
>
> 		ext_3p3v: fixedregulator@0 {
> 			compatible = "regulator-fixed";
> 			...
> 		};
> 	};
>
I will move this to the suggested style in next version.
>
>> +
>>   		qcom,ssbi@500000 {
>>   			compatible = "qcom,ssbi";
>>   			reg = <0x00500000 0x1000>;
>> @@ -522,5 +549,82 @@
>>   			compatible = "qcom,tcsr-apq8064", "syscon";
>>   			reg = <0x1a400000 0x100>;
>>   		};
>> +
>> +		hdmi: qcom,hdmi-tx@4a00000 {
>> +			compatible = "qcom,hdmi-tx-8960";
>> +			reg-names = "core_physical";
>> +			reg = <0x04a00000 0x1000>;
>> +			interrupts = <GIC_SPI 79 IRQ_TYPE_NONE>;
>> +			clock-names =
>> +			    "core_clk",
>> +			    "master_iface_clk",
>> +			    "slave_iface_clk";
>> +			clocks =
>> +			    <&mmcc HDMI_APP_CLK>,
>> +			    <&mmcc HDMI_M_AHB_CLK>,
>> +			    <&mmcc HDMI_S_AHB_CLK>;
>> +			qcom,hdmi-tx-ddc-clk = <&tlmm_pinmux 70
>> +						GPIO_ACTIVE_HIGH>;
>> +			qcom,hdmi-tx-ddc-data = <&tlmm_pinmux 71
>> +						GPIO_ACTIVE_HIGH>;
>> +			qcom,hdmi-tx-hpd = <&tlmm_pinmux 72
>> +						GPIO_ACTIVE_HIGH>;
>
> This should be done via the *-gpios method. i.e. hdmi-tx-ddc-clk-gpios,
> hdmi-tx-ddc-data-gpios, etc.
>
Thanks for the inputs,

That's true, These are existing bindings, so I can't change it as part 
of this patch, However I will make another patch to fix this in both 
drivers and DT for good reasons. Just noticed that bindings are not 
consistent with the examples and the driver, which I guess is another issue.
>> +			core-vdda-supply = <&pm8921_hdmi_switch>;
>> +			hdmi-mux-supply = <&ext_3p3v>;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&hdmi_pinctrl>;
>> +		};
>> +
>> +		gpu: qcom,adreno-3xx@4300000 {
>> +			compatible = "qcom,adreno-3xx";
>> +			reg = <0x04300000 0x20000>;
>> +			reg-names = "kgsl_3d0_reg_memory";
>> +			interrupts = <GIC_SPI 80 IRQ_TYPE_NONE>;
>> +			interrupt-names = "kgsl_3d0_irq";
>> +			clock-names =
>> +			    "core_clk",
>> +			    "iface_clk",
>> +			    "mem_clk",
>> +			    "mem_iface_clk";
>> +			clocks =
>> +			    <&mmcc GFX3D_CLK>,
>> +			    <&mmcc GFX3D_AHB_CLK>,
>> +			    <&mmcc GFX3D_AXI_CLK>,
>> +			    <&mmcc MMSS_IMEM_AHB_CLK>;
>> +			qcom,chipid = <0x03020002>;
>> +			qcom,gpu-pwrlevels {
>> +				compatible = "qcom,gpu-pwrlevels";
>> +				qcom,gpu-pwrlevel@0 {
>> +					qcom,gpu-freq = <450000000>;
>> +				};
>> +				qcom,gpu-pwrlevel@1 {
>> +					qcom,gpu-freq = <27000000>;
>> +				};
>> +			};
>
> This should be an OPP.
Yes, that looks reasonable approch, But as I said before the driver and 
the bindings are still using this style, so I cant change this as part 
of this patch. I will create another patch to for better bindings with 
driver fixes too.

>
