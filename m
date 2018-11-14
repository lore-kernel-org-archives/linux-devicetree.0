Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:13952
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727598AbeKNVUv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 16:20:51 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Wed, 14 Nov 2018 11:17:52 +0000
Message-ID: <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

> From: Yoshihiro Shimoda
> Sent: Wednesday, November 14, 2018 5:50 AM
> >  config PHY_RCAR_GEN3_USB2
> >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> >  	depends on ARCH_RENESAS
> > -	depends on EXTCON
> > +	depends on EXTCON || ARCH_R7S9210
>=20
> Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?

EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON=20
un-selected (save flash space).


> >  	/* Initialize otg part */
> >  	if (channel->is_otg_channel)
> >  		rcar_gen3_init_otg(channel);
> > +	else
> > +		/* No otg, so default to host mode */
> > +		writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> This "else" code will run on R-Car H3 USB port1(host only) for instance.
> I think adding this code is possible, but I'd like to separate patch from
> this adding R7S9210 support. What do you think?

This code is required for RZ/A2.
The reason is the reset value for COMMCTRL in RZ/A2 is 0x80000000 (Peripher=
al mode).
The reset value in R-Car H3 is 0x00000000 (Host mode).

Without this code, RZ/A2 will not work.


Chris
