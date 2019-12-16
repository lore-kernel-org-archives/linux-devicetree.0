Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743EEC2D0BF
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 11:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C285206EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 11:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="i68W550X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfLPLBv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 06:01:51 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:37574 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfLPLBv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 06:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bXEmcbJ5HWebyg17awLQbb0cNmIv8CRl14uVXEsjuSg=; b=i68W550XJr+o0xcydhID2t2UO
        3k+0840lpCkJz/gxTRyT5kJC9Y9y1B96dNLUPN0g3M07hJv+6AZumTmv+Uy7UVWPPzxmEb6dqRL2e
        Jclu/TBX2Z5x/fnDJIawlb95RSR4zokaUXGnBZvWwpoxvlvkpJNmIhLJ2VBZY+iHLSupZGTO6Cv9q
        Zb+E7JoH6ZyRUpuu3KH2a7p3nfTEBhhYZgWoX1ATjEeVI05mdVQwSBNRpzQ3Z/M0R855bvfvhnTHB
        xxr0tG4W8iNhL2URxtfwsIA03m29W216GTYW9KYBOoawfyi9yOYuOa/P49152fVaPSNfDB1+JdWyF
        Z7q9VfTkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53730)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1igo8C-0006qJ-By; Mon, 16 Dec 2019 11:01:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1igo89-0002KT-Pc; Mon, 16 Dec 2019 11:01:37 +0000
Date:   Mon, 16 Dec 2019 11:01:37 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: lx2160a: add dts for CEX7 platforms
Message-ID: <20191216110137.GD25745@shell.armlinux.org.uk>
References: <20191209120010.GG25745@shell.armlinux.org.uk>
 <E1ieHiU-0004wa-83@rmk-PC.armlinux.org.uk>
 <20191211074006.GP15858@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211074006.GP15858@dragon>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 11, 2019 at 03:40:07PM +0800, Shawn Guo wrote:
> On Mon, Dec 09, 2019 at 12:00:42PM +0000, Russell King wrote:
> > From: Rabeeh Khoury <rabeeh@solid-run.com>
> > 
> > The device tree enables the following features -
> > 1. dpmac17 RGMII MAC connected to Atheros AR8035 phy
> > 2. 2x MDIO busses
> > 3. 2x USB 3.0 controllers
> > 4. 4x SATA ports
> > 5. MT35X 512Mb SPI flash
> > 6. Temperature sensor on i2c0 channel 3
> > 7. AMC6821 temperature and PWM fan controller (not fitted)
> > 
> > The module supports AMC6821 PWM controller which is not currently
> > assembled on currently available Com Express 7 hardware.
> > 
> > This commit adds support for the Clearfog CX and Honeycomb variants,
> > which are indentical in this patch, but once QSFP support is finished,
> > only the Clearfog CX will have a QSFP description.
> > 
> > Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
> > [Add Makefile patch, split into clearfog-cx and honeycomb variants,
> > reworded commit -- rmk]
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> >  .../boot/dts/freescale/fsl-lx2160a-cex7.dtsi  | 123 ++++++++++++++++++
> >  .../dts/freescale/fsl-lx2160a-clearfog-cx.dts |  15 +++
> >  .../freescale/fsl-lx2160a-clearfog-itx.dtsi   |  57 ++++++++
> >  .../dts/freescale/fsl-lx2160a-honeycomb.dts   |  15 +++
> >  5 files changed, 212 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
> >  create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 93fce8f0c66d..b4d696e64625 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -18,6 +18,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-rdb.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
> > +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-clearfog-cx.dtb
> > +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
> >  
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> > new file mode 100644
> > index 000000000000..4761737e62e2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Device Tree file for LX2160A-CEx7
> > +//
> > +// Copyright 2019 SolidRun Ltd.
> > +
> > +/dts-v1/;
> > +
> > +#include "fsl-lx2160a.dtsi"
> > +
> > +/ {
> > +	model = "SolidRun LX2160A COM Express Type 7 module";
> > +	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
> 
> Any new compatible needs to be documented.

Grepping for "lx2160a-qds" and "lx2160a-rdb" in that tree shows no
matches.  Maybe all lx2160a boards should be documented together
when a place for such documentation is decided upon.  (In other
words, no, I'm not going to do as you requested until the existing
boards are given the same treatment you're requesting - otherwise
it's unfair.)

> > +
> > +	aliases {
> > +		crypto = &crypto;
> > +	};
> > +
> > +	sb_3v3: regulator-sb3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "RT7290";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +	};
> > +};
> > +
> > +&crypto {
> > +	status = "okay";
> > +};
> > +
> > +&esdhc1 {
> > +	mmc-hs200-1_8v;
> > +	mmc-hs400-1_8v;
> > +	bus-width = <8>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	i2c-switch@77 {
> > +		compatible = "nxp,pca9547";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		reg = <0x77>;
> > +
> > +		i2c@1 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <1>;
> 
> As an idiomatic practice, we have a newline between properties and child
> node ...
> 
> > +			fan-temperature-ctrlr@18 {
> > +				compatible = "ti,amc6821";
> > +				reg = <0x18>;
> > +				cooling-min-state = <0>;
> > +				cooling-max-state = <9>;
> > +				#cooling-cells = <2>;
> > +			};
> > +		};
> 
> ... and in between nodes.
> 
> > +		i2c@3 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			reg = <3>;
> > +
> > +			temperature-sensor@48 {
> > +				compatible = "nxp,sa56004";
> > +				reg = <0x48>;
> > +				vcc-supply = <&sb_3v3>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	status = "okay";
> > +};
> > +
> > +&i2c4 {
> > +	status = "okay";
> > +
> > +	rtc@51 {
> > +		compatible = "nxp,pcf2129";
> > +		reg = <0x51>;
> > +		// IRQ10_B
> > +		interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +};
> > +
> > +&fspi {
> > +	status = "okay";
> 
> Ditto
> 
> > +	flash@0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "micron,m25p80";
> > +		m25p,fast-read;
> > +		spi-max-frequency = <50000000>;
> > +		reg = <0>;
> > +		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
> > +		spi-rx-bus-width = <8>;
> > +		spi-tx-bus-width = <1>;
> > +	};
> > +};
> > +
> > +&usb0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb1 {
> > +	status = "okay";
> > +};
> > +
> > +&emdio1 {
> > +	status = "okay";
> 
> Ditto
> 
> > +	rgmii_phy1: ethernet-phy@1 {
> > +		reg = <1>;
> > +	};
> > +};
> > +
> > +&dpmac17 {
> 
> Instead of putting labeled nodes arbitrarily, we want to keep them
> sorted alphabetically.
> 
> Shawn
> 
> > +	phy-handle = <&rgmii_phy1>;
> > +	phy-connection-type = "rgmii-id";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> > new file mode 100644
> > index 000000000000..86a9b771428d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Device Tree file for LX2160A Clearfog CX board
> > +//
> > +// Copyright 2019 SolidRun Ltd.
> > +
> > +/dts-v1/;
> > +
> > +#include "fsl-lx2160a-clearfog-itx.dtsi"
> > +
> > +/ {
> > +	model = "SolidRun LX2160A Clearfog CX";
> > +	compatible = "solidrun,clearfog-cx",
> > +		"solidrun,lx2160a-cex7", "fsl,lx2160a";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
> > new file mode 100644
> > index 000000000000..10541f1345bf
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
> > @@ -0,0 +1,57 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Device Tree file for LX2160A Clearfog ITX board; this contains the
> > +// common parts shared between the Clearfog CX and Honeycomb builds.
> > +//
> > +// Copyright 2019 SolidRun Ltd.
> > +
> > +/dts-v1/;
> > +
> > +#include "fsl-lx2160a-cex7.dtsi"
> > +
> > +/ {
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +};
> > +
> > +&esdhc0 {
> > +	sd-uhs-sdr104;
> > +	sd-uhs-sdr50;
> > +	sd-uhs-sdr25;
> > +	sd-uhs-sdr12;
> > +	status = "okay";
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > +
> > +&uart1 {
> > +	status = "okay";
> > +};
> > +
> > +&emdio2 {
> > +	status = "okay";
> > +};
> > +
> > +&sata0 {
> > +	status = "okay";
> > +};
> > +
> > +&sata1 {
> > +	status = "okay";
> > +};
> > +
> > +&sata2 {
> > +	status = "okay";
> > +};
> > +
> > +&sata3 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
> > new file mode 100644
> > index 000000000000..fe19f3009ea5
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
> > @@ -0,0 +1,15 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Device Tree file for LX2160A Honeycomb board
> > +//
> > +// Copyright 2019 SolidRun Ltd.
> > +
> > +/dts-v1/;
> > +
> > +#include "fsl-lx2160a-clearfog-itx.dtsi"
> > +
> > +/ {
> > +	model = "SolidRun LX2160A Honeycomb";
> > +	compatible = "solidrun,honeycomb",
> > +		"solidrun,lx2160a-cex7", "fsl,lx2160a";
> > +};
> > -- 
> > 2.20.1
> > 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
