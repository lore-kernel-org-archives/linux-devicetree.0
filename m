Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF531C3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 03:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CB65214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 03:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576036250;
	bh=yeWMVwkeo+bPf+stZQf8exXrur23N3eKXJvU7vHghWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ONQqNfgQ371yO8I8zwPpVcHSDl9GuZsYS7SU3tajTLGoE+IudRAS+/kvx9alM3ghB
	 lkY80p2Q6beBS6f/Tc3rlm6OdL3MwYLc7JOEq+BfovflD5h022Jhimc6Jm/uAQBwX4
	 +HFmj7dg9WZ8UeIaz7fi4kNPniA1Z4imcwqa6BPI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLKDut (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 22:50:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:44180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726718AbfLKDut (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 22:50:49 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A06820836;
        Wed, 11 Dec 2019 03:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576036248;
        bh=yeWMVwkeo+bPf+stZQf8exXrur23N3eKXJvU7vHghWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=17AiTk5hH292fkuzRbzMsc/nLJeGpowEqmeGdsZEgvmLY6EeGD8KzNUL+nzvxylQe
         WKSbvPJeSihZ4epY6rhRnfsaLuwIWZkIJItrLTUD1u6i5ko0PCai5DmTS9qRb6jrvC
         5rDlkP5Od9eWXMMe+AMcgeeTUCT4NZYXxY0mqKHc=
Date:   Wed, 11 Dec 2019 11:50:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jun Li <jun.li@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mn-evk: enable usb1 and typec support
Message-ID: <20191211035036.GJ15858@dragon>
References: <1575533029-13049-1-git-send-email-jun.li@nxp.com>
 <1575533029-13049-3-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575533029-13049-3-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 05, 2019 at 08:06:28AM +0000, Jun Li wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> USB1 port has typec connector with power delivery support:
> - Dual data role: host and device.
> - Dual power role: source and sink, prefer power sink.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 65 +++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> index 2a74330..61511e9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright 2019 NXP
>   */
>  
> +#include <dt-bindings/usb/pd.h>
>  #include "imx8mn.dtsi"
>  
>  / {
> @@ -60,6 +61,42 @@
>  	status = "okay";
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec1>;
> +		reg = <0x50>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <11 8>;

We prefer to use macro for IRQ type:

s/8/IRQ_TYPE_LEVEL_LOW

I fixed it up and applied all 3 patches.

Shawn

> +		status = "okay";
> +
> +		port {
> +			typec1_dr_sw: endpoint {
> +				remote-endpoint = <&usb1_drd_sw>;
> +			};
> +		};
> +
> +		typec1_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +		};
> +	};
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> @@ -70,6 +107,21 @@
>  	status = "okay";
>  };
>  
> +&usbotg1 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
>  &usdhc2 {
>  	assigned-clocks = <&clk IMX8MN_CLK_USDHC2>;
>  	assigned-clock-rates = <200000000>;
> @@ -138,12 +190,25 @@
>  		>;
>  	};
>  
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c3
> +			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
> +		>;
> +	};
> +
>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmc {
>  		fsl,pins = <
>  			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
>  		>;
>  	};
>  
> +	pinctrl_typec1: typec1grp {
> +		fsl,pins = <
> +			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
> +		>;
> +	};
> +
>  	pinctrl_uart2: uart2grp {
>  		fsl,pins = <
>  			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
> -- 
> 2.7.4
> 
