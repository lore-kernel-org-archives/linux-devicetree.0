Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:9394
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726289AbeKSTUy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Nov 2018 14:20:54 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Mon, 19 Nov 2018 08:57:45 +0000
Message-ID: <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

> From: Chris Brandt, Sent: Thursday, November 15, 2018 9:34 PM
>=20
> Hi Shimoda=1B$B$5$s=1B(B
>=20
> > From: Yoshihiro Shimoda
> > Sent: Thursday, November 15, 2018 4:20 AM
>=20
> > > Host does NOT work:
> > > 	//else
> > > 	//	/* No otg, so default to host mode */
> > > 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);
> >
> > I got it. However, I have a concern how to set the mode to peripheral o=
n
> > RZ/A2
> > if we applied this code. If someone would like to use the USB as
> > peripheral
> > on his board, this code is not suitable.
>=20
> But USB peripheral is a different driver. So, this code will not run. So
> USB2_COMMCTRL will keep the default value 0x80000000.
>=20
> Correct?

Ah, this is you're correct. R-Car Gen3 code (drivers/usb/renesas_usbhs/rcar=
3.c) doesn't
have phy control for now.

> > So, I have an idea to set the default mode by using "dr_mode" property,
> > instead of hardcoded. Since the driver already has such a function,
> > we can reuse rcar_gen3_device_recognition() to set the default value.
> > To achieve that, we need to modify the following though.
> >  - Don't enable "is_otg_channel".
> >  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
> >    because RZ/A2 doesn't have it.
> >  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 registe=
r
> >    because RZ/A2 doesn't seem to need the setting on host mode.
> >
> > What do you think?
>=20
> If a board is designed for USB peripheral, why would they enable a EHCI
> host driver for the same USB channel?
> I am confused.

I meant that USB peripheral of RZ/A2 need the phy driver, not a EHCI host d=
river.
And I read Figure 32.1 of the RZ/A2 documentation and I wonder if we need t=
o release
USBCTR.PLL_RST even if we use USB peripheral mode.

# Since the documentations doesn't mention the PHY area exactly, it's confu=
sable for us though.
# But, the phy driver assumed the driver handled "AHB Bridge", "Core" and "=
UCOM" registers.

> > > > (In other words, if we use the port as peripheral with the reset va=
lue
> > > > 0x80000000, does it work?)
> > >
> > > We have not been able to get USB peripheral working on RZ/A2 yet.
> > > For peripheral, RZ/A2 has HS-USB.
> > > After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D
> > "0110").
> > > It should go to Configured state (DVSQ =3D "0011")
> >
> > I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
> > because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?
>=20
> Today for RZ/A1, we tell people to use USB0 first in their board design,
> then use USB1 if they need a second USB channel. USB pins are dedicated
> (no other function) so there should be no design conflicts.
>=20
> If only USB1 is used, USB0 must also be enabled in DT as a dummy driver
> (so SYSCFG.UPLLE can get set for USB1).

Oh, I heard RZ/G1C also has such a hardware register [1].

[1] https://patchwork.kernel.org/patch/10655855/
RZ/G1C channel 0 only has UGCTRL register, but need to set for channel 1.

Best regards,
Yoshihiro Shimoda

> > > According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000
> > when
> > > using HS-USB.
> > >
> > > There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)
> >
> > I got it. So, I guess someone wants to use 1 host and 1 peripheral :)
>=20
> Yes.
>=20
> Chris
