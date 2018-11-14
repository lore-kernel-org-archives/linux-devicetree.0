Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:54880
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727663AbeKNW1g (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 17:27:36 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Wed, 14 Nov 2018 12:24:25 +0000
Message-ID: <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

> From: Chris Brandt, Sent: Wednesday, November 14, 2018 8:18 PM
>=20
> Hi Shimoda-san,
>=20
> > From: Yoshihiro Shimoda
> > Sent: Wednesday, November 14, 2018 5:50 AM
> > >  config PHY_RCAR_GEN3_USB2
> > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > >  	depends on ARCH_RENESAS
> > > -	depends on EXTCON
> > > +	depends on EXTCON || ARCH_R7S9210
> >
> > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?
>=20
> EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON
> un-selected (save flash space).

I got it.
I added the depend on EXTCON, but R-Car Gen3 environment can build EXTCON=
=3Dn.
However, I realized that build error happens if EXTCON=3Dm.
So, I think we have to revise this line as following at first:

 "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in"
like drivers/phy/qualcomm/Kconfig.

> > >  	/* Initialize otg part */
> > >  	if (channel->is_otg_channel)
> > >  		rcar_gen3_init_otg(channel);
> > > +	else
> > > +		/* No otg, so default to host mode */
> > > +		writel(0x00000000, usb2_base + USB2_COMMCTRL);
> >
> > This "else" code will run on R-Car H3 USB port1(host only) for instance=
.
> > I think adding this code is possible, but I'd like to separate patch fr=
om
> > this adding R7S9210 support. What do you think?
>=20
> This code is required for RZ/A2.
> The reason is the reset value for COMMCTRL in RZ/A2 is 0x80000000 (Periph=
eral mode).

This value is the same as all R-Car Gen3 hardware.
However, host only ports don't seem to use this value...

> The reset value in R-Car H3 is 0x00000000 (Host mode).

No. R-Car H3's reset value is also 0x80000000 (Peripheral mode).
# Note that R-Car H3 can select the mode by HS-USB / UGCTRL2 register thoug=
h...

> Without this code, RZ/A2 will not work.

I'd like to clarify this. Does this mean RZ/A2 will not work as host mode?
(In other words, if we use the port as peripheral with the reset value 0x80=
000000, does it work?)

Best regards,
Yoshihiro Shimoda

>=20
> Chris
