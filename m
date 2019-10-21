Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62B2CA9EB5
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 05:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 725FB2089C
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 05:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jpIe82zQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfJUFix (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 01:38:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39067 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfJUFix (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 01:38:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id v4so7674779pff.6
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 22:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g8TRkov274ARhNaH9+VNBabFekS3pr6baLyjkSjNaFU=;
        b=jpIe82zQpdG0bCP03T7GBfXFyP2osn7Qq9h8GpauO/kcPXLAlH0ZhlhQCH8Y+geeNp
         eEIGrBgijhpAxe1LdB8BgQTpWx/DP90CXR/XtopqZsv5vaikEmZm11c2vGsC7az/UNhQ
         p4Z41WCCS2ZAuEfDDHJVHca3ZBdV4z+yXE63L0ko7C3kC+j/rbL7KBAzj91PzFxJUP+n
         5yOlU0TmxepgehnGk2yJdEFp1U3sPnfctxrwcVrLCjDYsWv1aFdyulxG0LnRRiquonhw
         A+hp73VDX5l6mtgg2gp8giegtkZaUmjFdMYTK3bqK5KSF0aWnAGaZl5dO0t0xaVn6BQl
         k/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g8TRkov274ARhNaH9+VNBabFekS3pr6baLyjkSjNaFU=;
        b=gjRZ6eZZVWZu2Kz6g1enThiGjvIGHUB+pU7n5Um5QzzvECoSiT1QVwrXEI417DjOCZ
         2ku/gp8C5EFO9DPieWPdOSe9gE/Li8kkGTOKucm3WBdCUeQZPPJUirUQ2ogsZtw3mEUQ
         ZVeJZ5dikkD9bgpB+goYtiCsMqeq5GvDM+TcMUOXNlQ+0LRtIkhkp7j3oUk0PlNVxhM0
         K9yv/LWYIdfdu4N3T6A8tF5vgq/FazXRFkyhqFQc/JnTZBPWZkYFuY1HiL8QtdKOrPWL
         V4bFgaZP3/IEYSku6eG578KH6zZOMetzpyaTpbjUNQwKnkU/t9qPZkRIN96foj34VSJ3
         6nhg==
X-Gm-Message-State: APjAAAVvXKAPXc4tQ12T5xbS0LqQI3BAGkQ47vUt7GAkx9RdVvi8RhAT
        Ohqn1Sjloit5a8OF2Gzyjj6FTA==
X-Google-Smtp-Source: APXvYqxd+4wvcSgAoLCptEA8knrsjY3c0eyRiB0V8m+Xd+/nBNizGpPFNwt7zcWkPctQ42KLzRHNgg==
X-Received: by 2002:a17:90a:34c1:: with SMTP id m1mr26358594pjf.89.1571636331593;
        Sun, 20 Oct 2019 22:38:51 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o15sm13221045pjs.14.2019.10.20.22.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:38:51 -0700 (PDT)
Date:   Sun, 20 Oct 2019 22:38:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, marijns95@gmail.com
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add configuration for PM8950 and
 PMI8950 peripherals
Message-ID: <20191021053848.GI4500@tuxbook-pro>
References: <20191020150746.64114-1-kholk11@gmail.com>
 <20191020150746.64114-4-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020150746.64114-4-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 20 Oct 08:07 PDT 2019, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> The PM(I)8950 feature integrated peripherals like ADC, GPIO
> controller, MPPs, PON keys and others.
> Add them to DT files that will be imported on boards having
> this PMIC combo (or one of them, anyways).
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8950.dtsi  | 187 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi |  98 ++++++++++++++
>  2 files changed, 285 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8950.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8950.dtsi b/arch/arm64/boot/dts/qcom/pm8950.dtsi
> new file mode 100644
> index 000000000000..c5041349bfe1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8950.dtsi
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pm8950_lsid0: pm8950@0 {
> +		compatible = "qcom,pm8950", "qcom,spmi-pmic";
> +		reg = <0x0 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8950_gpios: gpio@c000 {
> +			compatible = "qcom,pm8950-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> +				<0 0xc1 0 IRQ_TYPE_NONE>,
> +				<0 0xc3 0 IRQ_TYPE_NONE>,
> +				<0 0xc4 0 IRQ_TYPE_NONE>,
> +				<0 0xc5 0 IRQ_TYPE_NONE>,
> +				<0 0xc6 0 IRQ_TYPE_NONE>,
> +				<0 0xc7 0 IRQ_TYPE_NONE>;
> +		};
> +
> +		pm8950_mpps: mpps@a000 {
> +			compatible = "qcom,pm8950-mpp", "qcom,spmi-mpp";
> +			reg = <0xa000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0 0xa0 0 IRQ_TYPE_NONE>,
> +				     <0 0xa1 0 IRQ_TYPE_NONE>,
> +				     <0 0xa2 0 IRQ_TYPE_NONE>,
> +				     <0 0xa3 0 IRQ_TYPE_NONE>;
> +
> +			/* MPP_2: PA_THERM1 */
> +			pa_therm {
> +				pm8950_mpp2_def: pa_therm1_default {
> +					pins = "mpp2";
> +					function = "analog";
> +					input-enable;
> +					qcom,amux-route =
> +						<PMIC_MPP_AMUX_ROUTE_CH6>;
> +				};
> +			};
> +
> +			/* MPP_4: QUIET_THERM */
> +			case_therm {
> +				pm8950_mpp4_def: case_therm_default {
> +					pins = "mpp4";
> +					function = "analog";
> +					input-enable;
> +					qcom,amux-route =
> +						<PMIC_MPP_AMUX_ROUTE_CH8>;
> +				};
> +			};
> +		};
> +
> +		pon@800 {
> +			compatible = "qcom,pm8916-pon";
> +			reg = <0x0800>;
> +			mode-bootloader = <0x2>;
> +			mode-recovery = <0x1>;
> +
> +			pwrkey {
> +				compatible = "qcom,pm8941-pwrkey";
> +				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				linux,code = <KEY_POWER>;
> +			};
> +		};
> +
> +		pm8950_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0 0x24 0 IRQ_TYPE_EDGE_RISING>;
> +			io-channels = <&pm8950_adc VADC_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pm8950_adc: adc@3100 {
> +			compatible = "qcom,spmi-vadc";
> +			reg = <0x3100>;
> +			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +
> +			vcoin {
> +				label = "vcoin";
> +				reg = <VADC_VCOIN>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			vph_pwr {
> +				label = "vph_pwr";
> +				reg = <VADC_VSYS>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			die_temp {
> +				label = "die_temp";
> +				reg = <VADC_DIE_TEMP>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_625mv {
> +				label = "ref_625mv";
> +				reg = <VADC_REF_625MV>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_1250v {
> +				label = "ref_1250v";
> +				reg = <VADC_REF_1250MV>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_buf_625mv {
> +				label = "ref_buf_625mv";
> +				reg = <VADC_SPARE1>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_gnd {
> +				reg = <VADC_GND_REF>;
> +			};
> +			ref_vdd {
> +				reg = <VADC_VDD_VADC>;
> +			};
> +			pa_therm0 {
> +				label = "pa_therm0";
> +				reg = <VADC_LR_MUX7_HW_ID>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +			};
> +			pa_therm1 {
> +				label = "pa_therm1";
> +				reg = <VADC_P_MUX2_1_1>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +			};
> +			xo_therm {
> +				label = "xo_therm";
> +				reg = <VADC_LR_MUX3_XO_THERM>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +			};
> +			xo_therm_buf {
> +				label = "xo_therm_buf";
> +				reg = <VADC_LR_MUX3_BUF_XO_THERM>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +			};
> +			case_therm {
> +				label = "case_therm";
> +				reg = <VADC_P_MUX4_1_1>;
> +				qcom,pre-scaling = <1 1>;
> +				qcom,ratiometric;
> +				qcom,hw-settle-time = <200>;
> +			};
> +		};
> +
> +		rtc@6000 {
> +			compatible = "qcom,pm8941-rtc";
> +			reg = <0x6000>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> +		};
> +	};
> +
> +	pm8950_1: pm8950@1 {
> +		compatible = "qcom,pm8950", "qcom,spmi-pmic";
> +		reg = <0x1 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8950_spmi_regulators: regulators {
> +			compatible = "qcom,pm8950-regulators";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> new file mode 100644
> index 000000000000..15c3e47bab0c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmi8950_lsid0: pmic@2 {
> +		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
> +		reg = <0x2 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmi8950_adc: adc@3100 {
> +			compatible = "qcom,spmi-vadc";
> +			reg = <0x3100>;
> +			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +
> +			usbin {
> +				label = "usbin";
> +				reg = <VADC_USBIN>;
> +				qcom,pre-scaling = <1 4>;
> +			};
> +			dcin {
> +				label = "dcin";
> +				reg = <VADC_DCIN>;
> +				qcom,pre-scaling = <1 4>;
> +			};
> +			vchg_sns {
> +				label = "vchg_sns";
> +				reg = <VADC_VCHG_SNS>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_625mv {
> +				label = "ref_625mv";
> +				reg = <VADC_REF_625MV>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_1250v {
> +				label = "ref_1250v";
> +				reg = <VADC_REF_1250MV>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			ref_gnd {
> +				reg = <VADC_GND_REF>;
> +			};
> +			ref_vdd {
> +				reg = <VADC_VDD_VADC>;
> +			};
> +			chg_temp {
> +				label = "chg_temp";
> +				reg = <VADC_SPARE2>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			usb_dp {
> +				label = "usb_dp";
> +				reg = <VADC_USB_DP>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +			usb_dm {
> +				label = "usb_dm";
> +				reg = <VADC_USB_DM>;
> +				qcom,pre-scaling = <1 1>;
> +			};
> +		};
> +
> +		pmi8950_gpio: gpios@c000 {

Please sort nodes by unit address, then name.

Apart from that, this looks good.

Regards,
Bjorn

> +			compatible = "qcom,pmi8950-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> +				<0 0xc1 0 IRQ_TYPE_NONE>;
> +		};
> +
> +		pmi8950_mpp: mpps@a000 {
> +			compatible = "qcom,pmi8950-mpp", "qcom,spmi-mpp";
> +			reg = <0xa000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupts = <0x2 0xa0 0 IRQ_TYPE_NONE>,
> +				<0x2 0xa1 0 IRQ_TYPE_NONE>,
> +				<0x2 0xa2 0 IRQ_TYPE_NONE>,
> +				<0x2 0xa3 0 IRQ_TYPE_NONE>;
> +		};
> +	};
> +
> +	pmi8950_lsid1: pmic@3 {
> +		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
> +		reg = <0x3 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.21.0
> 
