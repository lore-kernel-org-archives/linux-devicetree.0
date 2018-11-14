Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:35866
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732932AbeKNXGA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 18:06:00 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Wed, 14 Nov 2018 13:02:42 +0000
Message-ID: <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

> From: Yoshihiro Shimoda
> Sent: Wednesday, November 14, 2018 7:24 AM
> > > >  config PHY_RCAR_GEN3_USB2
> > > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > > >  	depends on ARCH_RENESAS
> > > > -	depends on EXTCON
> > > > +	depends on EXTCON || ARCH_R7S9210
> > >
> > > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?
> >
> > EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON
> > un-selected (save flash space).
>=20
> I got it.
> I added the depend on EXTCON, but R-Car Gen3 environment can build
> EXTCON=3Dn.
> However, I realized that build error happens if EXTCON=3Dm.
> So, I think we have to revise this line as following at first:
>=20
>  "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in"
> like drivers/phy/qualcomm/Kconfig.

OK. I will change it.

   (should this be a separate patch?)


> > Without this code, RZ/A2 will not work.
>=20
> I'd like to clarify this. Does this mean RZ/A2 will not work as host mode=
?

Correct. If I remove 'else' code, RZ/A2 host mode does not work.
I just tested again now.

Host works:
	else
		/* No otg, so default to host mode */
		writel(0x00000000, usb2_base + USB2_COMMCTRL);

Host does NOT work:
	//else
	//	/* No otg, so default to host mode */
	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);


> (In other words, if we use the port as peripheral with the reset value
> 0x80000000, does it work?)

We have not been able to get USB peripheral working on RZ/A2 yet.
For peripheral, RZ/A2 has HS-USB.
After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D "0110"=
).
It should go to Configured state (DVSQ =3D "0011")


According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000 when
using HS-USB.

There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)

Chris
