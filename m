Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88213C2D0CD
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 06:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F0A8218AC
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 06:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kW22feBU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbfLRG23 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 01:28:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35476 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfLRG23 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 01:28:29 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so521850plt.2
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 22:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fziCYHKMFGHsNNkb3erFLyDFxVdCoJ51kiuuQ1qt9Kc=;
        b=kW22feBUWfPB/kASEVMgzJn2QdKFoWWWeI67fHE0GTQczcpANL+r5Y1l+I4bIh11fu
         l3qVbyQ7u2prTTODSULlbCJLGLytdTJvyEJ91Ue2deuxD9sGpn60w2HgxjpvygK3Qd/q
         3WkWecayTLDHH9dNRDt+RRcuBM4c14hgodrhcLI8DC0TpyyX2XEs1m3rHnVsiuLJK1Qi
         Al3NyGIfpUjalE2kH5pxnVQTKOusWx9GfQbL64tcxJ5KqeMZwarQNVmxD5fop0n8U2+p
         o/umlfpCRrVER55UalRcc8sWOXVfzYy83kYFWYomJFUDexQd1OT/d6GHpXlRiCkc+ttG
         kmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fziCYHKMFGHsNNkb3erFLyDFxVdCoJ51kiuuQ1qt9Kc=;
        b=pGbY/osFBkcGWfvFXgdD2GNVlR4HuxMdDl7ZL8ehmzBw0i54nczCklToQSe8xlw9J4
         XDsqXCHJ+/qFTeVgkVGyCiLVknGBxe4vNLOjYnIznb9ezkkew3gvbIh2RlnAiuNP4DgU
         ihzrBJtv+1nGhh1jH43LAFucomTEXERtf6VcGDCyjJ4+SQR/zdesM8aGMMU8L3y9HIzn
         GUM3rhuMa/HmX0xNTVgESCHBvzW/oZx8QAQA8EL4pkqfH0bk7e2xQIriT8cLdomI9Ee0
         H0JKLhalt0ykhXYfFrRAqLU7H0+VjSXBO241xTIzjmmEL27QIYpfL3aX+B4pcQuV4RHa
         TytQ==
X-Gm-Message-State: APjAAAX2dElNUSNO1Ck6/bq1rjWM81PvFS/2vS041c13mYij49KBK0l4
        yIA4xquLUhwRcWGr7Uw23WLxlA==
X-Google-Smtp-Source: APXvYqw09rCC+r58pnI4mLp/hhbh2GNoXV+2C8tiw+f7MCtjIXKEwA5+2HLBZyEyUtKnq+pNtSP7xg==
X-Received: by 2002:a17:902:ba8c:: with SMTP id k12mr98163pls.329.1576650508476;
        Tue, 17 Dec 2019 22:28:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a69sm1300253pfa.129.2019.12.17.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 22:28:27 -0800 (PST)
Date:   Tue, 17 Dec 2019 22:28:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Victhor Foster <victhor.foster@ufpe.br>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: dts: apq8084: Fix tsens kernel panic during boot
 and kernel warnings due to IRQ_TYPE_NONE interrupt type
Message-ID: <20191218062825.GA3755841@builder>
References: <587764682.8806511.1576626759806.JavaMail.zimbra@ufpe.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587764682.8806511.1576626759806.JavaMail.zimbra@ufpe.br>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 17 Dec 15:52 PST 2019, Victhor Foster wrote:

> This patch fixes a kernel panic on the tsens driver that prevented APQ8084 platforms from booting, by adding a missing register property and the number of sensors

I was under the impression that the tsens driver did maintain backwards
compatibility wrt a single reg cell...

> , corrects all instances of IRQ_TYPE_NONE in interrupts, to avoid causing kernel warnings during boot, and also changes most interrupt properties to their respective macros, as defined by arm-gic.h.
> 
> Signed-off by: Victhor Foster <victhor.foster@ufpe.br>

The content looks good, but can you please split it in two; one for the
tsens change and one for the interrupts cells? And please limit your
commit message to 72 chars.

Thanks,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 43 +++++++++++++++--------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..dc4ea3a8dc6d 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /dts-v1/;
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-apq8084.h>
>  #include <dt-bindings/gpio/gpio.h>
>  
> @@ -184,7 +185,7 @@
>  
>  	cpu-pmu {
>  		compatible = "qcom,krait-pmu";
> -		interrupts = <1 7 0xf04>;
> +		interrupts = <GIC_PPI 7 0xf04>;
>  	};
>  
>  	clocks {
> @@ -203,10 +204,10 @@
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> -		interrupts = <1 2 0xf08>,
> -			     <1 3 0xf08>,
> -			     <1 4 0xf08>,
> -			     <1 1 0xf08>;
> +		interrupts = <GIC_PPI 2 0xf08>,
> +			     <GIC_PPI 3 0xf08>,
> +			     <GIC_PPI 4 0xf08>,
> +			     <GIC_PPI 1 0xf08>;
>  		clock-frequency = <19200000>;
>  	};
>  
> @@ -253,9 +254,11 @@
>  
>  		tsens: thermal-sensor@fc4a8000 {
>  			compatible = "qcom,msm8974-tsens";
> -			reg = <0xfc4a8000 0x2000>;
> +			reg = <0xfc4a9000 0x1000>, /* TM */
> +			      <0xfc4a8000 0x1000>; /* SROT */
>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
> +			#qcom,sensors = <11>;
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> @@ -269,50 +272,50 @@
>  
>  			frame@f9021000 {
>  				frame-number = <0>;
> -				interrupts = <0 8 0x4>,
> -					     <0 7 0x4>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9021000 0x1000>,
>  				      <0xf9022000 0x1000>;
>  			};
>  
>  			frame@f9023000 {
>  				frame-number = <1>;
> -				interrupts = <0 9 0x4>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9023000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9024000 {
>  				frame-number = <2>;
> -				interrupts = <0 10 0x4>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9024000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9025000 {
>  				frame-number = <3>;
> -				interrupts = <0 11 0x4>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9025000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9026000 {
>  				frame-number = <4>;
> -				interrupts = <0 12 0x4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9026000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9027000 {
>  				frame-number = <5>;
> -				interrupts = <0 13 0x4>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9027000 0x1000>;
>  				status = "disabled";
>  			};
>  
>  			frame@f9028000 {
>  				frame-number = <6>;
> -				interrupts = <0 14 0x4>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0xf9028000 0x1000>;
>  				status = "disabled";
>  			};
> @@ -404,13 +407,13 @@
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -			interrupts = <0 208 0>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
>  		blsp2_uart2: serial@f995e000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0xf995e000 0x1000>;
> -			interrupts = <0 114 0x0>;
> +			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
>  			clock-names = "core", "iface";
>  			status = "disabled";
> @@ -420,7 +423,7 @@
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 123 0>, <0 138 0>;
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&gcc GCC_SDCC1_AHB_CLK>,
> @@ -433,7 +436,7 @@
>  			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
>  			reg-names = "hc_mem", "core_mem";
> -			interrupts = <0 125 0>, <0 221 0>;
> +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "hc_irq", "pwr_irq";
>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&gcc GCC_SDCC2_AHB_CLK>,
> @@ -449,7 +452,7 @@
>  			      <0xfc4cb000 0x1000>,
>  			      <0xfc4ca000 0x1000>;
>  			interrupt-names = "periph_irq";
> -			interrupts = <0 190 0>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			qcom,ee = <0>;
>  			qcom,channel = <0>;
>  			#address-cells = <2>;
> @@ -463,7 +466,7 @@
>  		compatible = "qcom,smd";
>  
>  		rpm {
> -			interrupts = <0 168 1>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>  			qcom,ipc = <&apcs 8 0>;
>  			qcom,smd-edge = <15>;
>  
> --
> 2.24.0
