Return-Path: <SRS0=rl0j=YT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB33CA9EB9
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 09:34:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B866020867
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572082462;
	bh=2GM/vr83TDptuw4EegZ6u0dgwEbiANy/h4KZkkZPVmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UM9DhLK1vRfzzEPBNbpLcksZzwiWjo620bf9qKCq6OP+ukFEju43SyRROAhB7/Zc8
	 ydmqdKbKc+E88eU0ODKngMAp1x/8lktnVAQbf2hjPbX4A6Vxk92z3ptLsL26xczniL
	 i37Q+oM+S3poMvKnwvglBENohXZAjLe4bHaQxs20=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfJZJeW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 26 Oct 2019 05:34:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:42934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfJZJeV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 26 Oct 2019 05:34:21 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 976442070B;
        Sat, 26 Oct 2019 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572082460;
        bh=2GM/vr83TDptuw4EegZ6u0dgwEbiANy/h4KZkkZPVmo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nDn5F2cChOkWWTpXTLlVR7TkusQ73WYhB6LVnNdmoXWMm6MlviJ6fgtyT4Q2AP4U+
         DotDAuV1FScOZcq45i5jCPEPwRQ8vTqTnh4xQC0mWJuiKAEy3q8FgWiqLDdhJixLSe
         ODmDO6Z6699MWu0boeJgg4l6BZ2A60QO3Im6/Rr0=
Date:   Sat, 26 Oct 2019 17:34:00 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Markus Niebel <Markus.Niebel@tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: imx6qdl: add TQMa6{S,Q,QP} SoM
Message-ID: <20191026093356.GE14401@dragon>
References: <20191011143651.6424-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011143651.6424-1-p.zabel@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 11, 2019 at 04:36:49PM +0200, Philipp Zabel wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> Add device trees for TQMa6S, TQMa6Q, and TQMa6QP embedded modules.
> The A and B SoM variants are for hardware revisions that differ in
> how the I2C devices are connected. For details, see [1].

It looks like a perfect case to be handled by DT overlay.  Did you
consider of using that?

> 
> This is a combination of the patches
>   "arm: dt: imx6qdl: add tqma6[qdl] som on mba6 mainboard",
>   "arm: dt: tqma6: add spi with spi nor flash on SOM",
>   "arm: dt: add basic support for tqma6qp on mba6", and
>   "arm: dt: imx6qdl-tqma6: use generic jedec,spi-nor"
> from the TQMa6x BSP, with the MBa6 specific parts removed.
> 
> [1] https://support.tq-group.com/en/arm/tqma6x/linux/ptxdist/overview
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> [p.zabel@pengutronix.de: merged patches from TQMa6x BSP REV.0114,
>  separated MBa6 DTs, fixed checkpatch and dtbs_check warnings,
>  added no-sd(io) properties to eMMC, added SPDX license identifiers
>  and commit message]
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6dl-tqma6a.dtsi  |  17 +++
>  arch/arm/boot/dts/imx6dl-tqma6b.dtsi  |  17 +++
>  arch/arm/boot/dts/imx6q-tqma6a.dtsi   |  17 +++
>  arch/arm/boot/dts/imx6q-tqma6b.dtsi   |  16 ++
>  arch/arm/boot/dts/imx6qdl-tqma6.dtsi  | 202 ++++++++++++++++++++++++++
>  arch/arm/boot/dts/imx6qdl-tqma6a.dtsi |  29 ++++
>  arch/arm/boot/dts/imx6qdl-tqma6b.dtsi |  29 ++++
>  arch/arm/boot/dts/imx6qp-tqma6b.dtsi  |  17 +++
>  8 files changed, 344 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-tqma6a.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6dl-tqma6b.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6q-tqma6a.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6q-tqma6b.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
>  create mode 100644 arch/arm/boot/dts/imx6qp-tqma6b.dtsi
> 
> diff --git a/arch/arm/boot/dts/imx6dl-tqma6a.dtsi b/arch/arm/boot/dts/imx6dl-tqma6a.dtsi
> new file mode 100644
> index 000000000000..b45ab3325dc4
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-tqma6a.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-tqma6a.dtsi"
> +#include "imx6qdl-tqma6.dtsi"
> +
> +/ {
> +	memory@10000000 {
> +		device_type = "memory";
> +		reg = <0x10000000 0x20000000>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6dl-tqma6b.dtsi b/arch/arm/boot/dts/imx6dl-tqma6b.dtsi
> new file mode 100644
> index 000000000000..4b0e6b22466a
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-tqma6b.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-tqma6b.dtsi"
> +#include "imx6qdl-tqma6.dtsi"
> +
> +/ {
> +	memory@10000000 {
> +		device_type = "memory";
> +		reg = <0x10000000 0x20000000>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6q-tqma6a.dtsi b/arch/arm/boot/dts/imx6q-tqma6a.dtsi
> new file mode 100644
> index 000000000000..d22eaeda9863
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-tqma6a.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +#include "imx6q.dtsi"
> +#include "imx6qdl-tqma6a.dtsi"
> +#include "imx6qdl-tqma6.dtsi"
> +
> +/ {
> +	memory@10000000 {
> +		device_type = "memory";
> +		reg = <0x10000000 0x40000000>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6q-tqma6b.dtsi b/arch/arm/boot/dts/imx6q-tqma6b.dtsi
> new file mode 100644
> index 000000000000..da6d406b5e89
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-tqma6b.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + */
> +
> +#include "imx6q.dtsi"
> +#include "imx6qdl-tqma6b.dtsi"
> +#include "imx6qdl-tqma6.dtsi"
> +
> +/ {
> +	memory@10000000 {
> +		device_type = "memory";
> +		reg = <0x10000000 0x40000000>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6.dtsi
> new file mode 100644
> index 000000000000..c0e2a03624f9
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-tqma6.dtsi
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +/ {
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "supply-3p3v";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	fsl,spi-num-chipselects = <1>;

Obsolete property.

> +	cs-gpios = <&gpio3 19 0>;

GPIO_ACTIVE_HIGH

> +	status = "okay";
> +
> +	flash: m25p80@0 {

Node name should be generic, while label can be specific.

> +		status = "okay";

Not really needed.

> +		compatible = "jedec,spi-nor";
> +		spi-max-frequency = <50000000>;
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		m25p,fast-read;
> +	};
> +};
> +
> +&iomuxc {
> +	tqma6 {

Drop this container node.

> +		pinctrl_ecspi1: ecspi1grp {
> +			fsl,pins = <
> +				/* HYS, SPEED = MED, 100k up, DSE = 011, SRE_FAST */
> +				MX6QDL_PAD_EIM_D17__ECSPI1_MISO 0x1b099
> +				MX6QDL_PAD_EIM_D18__ECSPI1_MOSI 0xb099
> +				MX6QDL_PAD_EIM_D16__ECSPI1_SCLK 0xb099
> +				 /* eCSPI1 SS1 */
> +				MX6QDL_PAD_EIM_D19__GPIO3_IO19 0xb099
> +			>;
> +		};
> +
> +		pinctrl_i2c1_tqma6: i2c1-tqma6grp {

The '_tqma6' suffix isn't really useful.

> +			fsl,pins = <
> +				MX6QDL_PAD_CSI0_DAT8__I2C1_SDA 0x4001b899
> +				MX6QDL_PAD_CSI0_DAT9__I2C1_SCL 0x4001b899
> +			>;
> +		};
> +
> +		pinctrl_i2c3_tqma6: i2c3-tqma6grp {
> +			fsl,pins = <
> +				MX6QDL_PAD_GPIO_5__I2C3_SCL 0x4001b899
> +				MX6QDL_PAD_GPIO_6__I2C3_SDA 0x4001b899
> +			>;
> +		};
> +
> +		pinctrl_pmic: pmicgrp {
> +			fsl,pins = <
> +				MX6QDL_PAD_NANDF_RB0__GPIO6_IO10 0x1b099 /* PMIC irq */
> +			>;
> +		};
> +
> +		pinctrl_usdhc3: usdhc3grp {
> +			fsl,pins = <
> +				MX6QDL_PAD_SD3_CMD__SD3_CMD    0x17059
> +				MX6QDL_PAD_SD3_CLK__SD3_CLK    0x10059
> +				MX6QDL_PAD_SD3_DAT0__SD3_DATA0 0x17059
> +				MX6QDL_PAD_SD3_DAT1__SD3_DATA1 0x17059
> +				MX6QDL_PAD_SD3_DAT2__SD3_DATA2 0x17059
> +				MX6QDL_PAD_SD3_DAT3__SD3_DATA3 0x17059
> +				MX6QDL_PAD_SD3_DAT4__SD3_DATA4 0x17059
> +				MX6QDL_PAD_SD3_DAT5__SD3_DATA5 0x17059
> +				MX6QDL_PAD_SD3_DAT6__SD3_DATA6 0x17059
> +				MX6QDL_PAD_SD3_DAT7__SD3_DATA7 0x17059
> +			>;
> +		};
> +	};
> +};
> +
> +&pmic {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <10 8>;

IRQ_TYPE_LEVEL_LOW

> +
> +		regulators {
> +			reg_vddcore: sw1ab {
> +				regulator-min-microvolt = <300000>;
> +				regulator-max-microvolt = <1875000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vddsoc: sw1c {
> +				regulator-min-microvolt = <300000>;
> +				regulator-max-microvolt = <1875000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_gen_3v3: sw2 {
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_ddr_1v5a: sw3a {
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1975000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_ddr_1v5b: sw3b {
> +				regulator-min-microvolt = <400000>;
> +				regulator-max-microvolt = <1975000>;
> +				regulator-always-on;
> +			};
> +
> +			sw4_reg: sw4 {
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_5v_600mA: swbst {
> +				regulator-min-microvolt = <5000000>;
> +				regulator-max-microvolt = <5150000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_snvs_3v: vsnvs {
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vrefddr: vrefddr {
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			reg_vgen1_1v5: vgen1 {
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1550000>;
> +				/* not used */
> +			};
> +
> +			reg_vgen2_1v2_eth: vgen2 {
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <1550000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vgen3_2v8: vgen3 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vgen4_1v8: vgen4 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vgen5_1v8_eth: vgen5 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +
> +			reg_vgen6_3v3: vgen6 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +			};
> +		};
> +};
> +
> +/* eMMC */
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	vmmc-supply = <&reg_3p3v>;
> +	non-removable;
> +	disable-wp;
> +	no-sd;
> +	no-sdio;
> +	bus-width = <8>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	mmccard: mmccard@0 {
> +		reg = <0>;
> +		compatible = "mmc-card";
> +		broken-hpi;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
> new file mode 100644
> index 000000000000..a31bf04884d2
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-tqma6a.dtsi
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1_tqma6>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	pmic: pf0100@8 {

Node name should be generic, while label can be specific.

> +		compatible = "fsl,pfuze100";
> +		reg = <0x08>;
> +	};
> +
> +	sensor0: lm75@48 {

Ditto

> +		compatible = "lm75";
> +		reg = <0x48>;
> +	};
> +
> +	eeprom0: m24c64@50 {

Ditto

Shawn

> +		compatible = "st,24c64", "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
> new file mode 100644
> index 000000000000..9a7c8d21cec2
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qdl-tqma6b.dtsi
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + * Copyright 2013-2017 Markus Niebel <Markus.Niebel@tq-group.com>
> + */
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3_tqma6>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	pmic: pf0100@8 {
> +		compatible = "fsl,pfuze100";
> +		reg = <0x08>;
> +	};
> +
> +	sensor0: lm75@48 {
> +		compatible = "lm75";
> +		reg = <0x48>;
> +	};
> +
> +	eeprom0: m24c64@50 {
> +		compatible = "st,24c64", "atmel,24c64";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +};
> +
> diff --git a/arch/arm/boot/dts/imx6qp-tqma6b.dtsi b/arch/arm/boot/dts/imx6qp-tqma6b.dtsi
> new file mode 100644
> index 000000000000..4e7e7050da43
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6qp-tqma6b.dtsi
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2013 Sascha Hauer, Pengutronix
> + */
> +
> +#include "imx6q.dtsi"
> +#include "imx6qp.dtsi"
> +#include "imx6qdl-tqma6b.dtsi"
> +#include "imx6qdl-tqma6.dtsi"
> +
> +/ {
> +	memory@10000000 {
> +		device_type = "memory";
> +		reg = <0x10000000 0x40000000>;
> +	};
> +};
> +
> -- 
> 2.20.1
> 
