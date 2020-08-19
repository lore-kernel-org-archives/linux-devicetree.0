Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C26C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 13:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E1492075E
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597845351;
	bh=PMYKWpFtARinrQbKF5MpEV0XBEswzJUxujtm4AKQ4Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zr6yKUcyBDw0BJw7xvn17OeEYwTFRZnO1c02ZVB+9uB5hw8viw9Ncc1S2hgtMFw4V
	 +/hZA2lEguwOqhstt0GFRcqGwjVuLuAcW2k1sK9g12AE+q7rg4RAtO/uVIIX9s+shg
	 KZPgXLMm6nraoE++fV3jwaAA+PwwNbP93i1VNRKk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgHSNzu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 09:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:44706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727018AbgHSNzs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Aug 2020 09:55:48 -0400
Received: from dragon (unknown [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E68D3204FD;
        Wed, 19 Aug 2020 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597845348;
        bh=PMYKWpFtARinrQbKF5MpEV0XBEswzJUxujtm4AKQ4Zs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WzpIYpjMN3v161SDcMEqzoIgqf/L8RKxIVF6V4l5+DOg61JsK1EmKu+6mUWYTqnXz
         7Ir1ub5f22zRgODz7+Ddpi10x69YRQAarWmOZK0yCqqZVCvuY3ZhZZ6t1WWIhpdrDD
         1PQimzt9dHALnxwa+KFQq+32Vu6sS1B1YkqXFEvA=
Date:   Wed, 19 Aug 2020 21:55:30 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     robh+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: imx8mm: Add imx8mm ddr4 evk board support
Message-ID: <20200819134852.GD7114@dragon>
References: <1595918641-2325-1-git-send-email-ping.bai@nxp.com>
 <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595918641-2325-3-git-send-email-ping.bai@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 28, 2020 at 02:44:01PM +0800, Jacky Bai wrote:
> Add the board dts support for i.MX8MM DDR4 EVK board.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>  .../boot/dts/freescale/imx8mm-ddr4-evk.dts    | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a39f0a1723e0..417c552480f2 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
> new file mode 100644
> index 000000000000..9cd89182218e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dts
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-evk.dtsi"
> +
> +/ {
> +	model = "FSL i.MX8MM DDR4 EVK with CYW43455 WIFI/BT board";
> +	compatible = "fsl,imx8mm-ddr4-evk", "fsl,imx8mm";
> +
> +	leds {
> +		pinctrl-0 = <&pinctrl_gpio_led_2>;
> +
> +		status {
> +			gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&ddrc {
> +	operating-points-v2 = <&ddrc_opp_table>;
> +
> +	ddrc_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-25M {
> +			opp-hz = /bits/ 64 <25000000>;
> +		};
> +
> +		opp-100M {
> +			opp-hz = /bits/ 64 <100000000>;
> +		};
> +
> +		opp-600M {
> +			opp-hz = /bits/ 64 <600000000>;
> +		};
> +	};

I'm trying to understand how this ddrc_opp_table is determined.  It's
defined by SoC/DDR controller or board/DDR chip?

> +};
> +
> +&gpmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
> +	status = "okay";

Please put 'status' at end of property list.

> +	nand-on-flash-bbt;
> +};
> +
> +&iomuxc {
> +	pinctrl_gpmi_nand_1: gpmi-nand-1 {

The suffix "1" isn't really needed, is it?

Shawn

> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_ALE_RAWNAND_ALE		0x00000096
> +			MX8MM_IOMUXC_NAND_CE0_B_RAWNAND_CE0_B		0x00000096
> +			MX8MM_IOMUXC_NAND_CE1_B_RAWNAND_CE1_B		0x00000096
> +			MX8MM_IOMUXC_NAND_CLE_RAWNAND_CLE		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA00_RAWNAND_DATA00		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA01_RAWNAND_DATA01		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA02_RAWNAND_DATA02		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA03_RAWNAND_DATA03		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA04_RAWNAND_DATA04		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA05_RAWNAND_DATA05		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA06_RAWNAND_DATA06		0x00000096
> +			MX8MM_IOMUXC_NAND_DATA07_RAWNAND_DATA07		0x00000096
> +			MX8MM_IOMUXC_NAND_RE_B_RAWNAND_RE_B		0x00000096
> +			MX8MM_IOMUXC_NAND_READY_B_RAWNAND_READY_B	0x00000056
> +			MX8MM_IOMUXC_NAND_WE_B_RAWNAND_WE_B		0x00000096
> +			MX8MM_IOMUXC_NAND_WP_B_RAWNAND_WP_B		0x00000096
> +		>;
> +	};
> +
> +	pinctrl_gpio_led_2: gpioled2grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_CE3_B_GPIO3_IO4	0x19
> +		>;
> +	};
> +};
> -- 
> 2.26.2
> 
