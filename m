Return-Path: <SRS0=9lQL=N2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:27904
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbeKOT1G (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Nov 2018 14:27:06 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Thu, 15 Nov 2018 09:19:59 +0000
Message-ID: <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

> From: Chris Brandt, Sent: Wednesday, November 14, 2018 10:03 PM
>=20
> Hi Shimoda-san,
>=20
> > From: Yoshihiro Shimoda
> > Sent: Wednesday, November 14, 2018 7:24 AM
> > > > >  config PHY_RCAR_GEN3_USB2
> > > > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > > > >  	depends on ARCH_RENESAS
> > > > > -	depends on EXTCON
> > > > > +	depends on EXTCON || ARCH_R7S9210
> > > >
> > > > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3D=
y?
> > >
> > > EXTCON is not required for RZ/A2. So, I want to be able to leave EXTC=
ON
> > > un-selected (save flash space).
> >
> > I got it.
> > I added the depend on EXTCON, but R-Car Gen3 environment can build
> > EXTCON=3Dn.
> > However, I realized that build error happens if EXTCON=3Dm.
> > So, I think we have to revise this line as following at first:
> >
> >  "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in=
"
> > like drivers/phy/qualcomm/Kconfig.
>=20
> OK. I will change it.
>=20
>    (should this be a separate patch?)

Yes, this should be a separate patch.

> > > Without this code, RZ/A2 will not work.
> >
> > I'd like to clarify this. Does this mean RZ/A2 will not work as host mo=
de?
>=20
> Correct. If I remove 'else' code, RZ/A2 host mode does not work.
> I just tested again now.
>=20
> Host works:
> 	else
> 		/* No otg, so default to host mode */
> 		writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> Host does NOT work:
> 	//else
> 	//	/* No otg, so default to host mode */
> 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);

I got it. However, I have a concern how to set the mode to peripheral on RZ=
/A2
if we applied this code. If someone would like to use the USB as peripheral
on his board, this code is not suitable.

So, I have an idea to set the default mode by using "dr_mode" property,
instead of hardcoded. Since the driver already has such a function,
we can reuse rcar_gen3_device_recognition() to set the default value.
To achieve that, we need to modify the following though.
 - Don't enable "is_otg_channel".
 - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
   because RZ/A2 doesn't have it.
 - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
   because RZ/A2 doesn't seem to need the setting on host mode.

What do you think?

> > (In other words, if we use the port as peripheral with the reset value
> > 0x80000000, does it work?)
>=20
> We have not been able to get USB peripheral working on RZ/A2 yet.
> For peripheral, RZ/A2 has HS-USB.
> After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D "011=
0").
> It should go to Configured state (DVSQ =3D "0011")

I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?

> According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000 whe=
n
> using HS-USB.
>=20
> There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)

I got it. So, I guess someone wants to use 1 host and 1 peripheral :)

Best regards,
Yoshihiro Shimoda

> Chris
