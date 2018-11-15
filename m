Return-Path: <SRS0=9lQL=N2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:32326
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728950AbeKOWlv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 15 Nov 2018 17:41:51 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Thu, 15 Nov 2018 12:34:04 +0000
Message-ID: <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda=1B$B$5$s=1B(B

> From: Yoshihiro Shimoda
> Sent: Thursday, November 15, 2018 4:20 AM

> > Host does NOT work:
> > 	//else
> > 	//	/* No otg, so default to host mode */
> > 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> I got it. However, I have a concern how to set the mode to peripheral on
> RZ/A2
> if we applied this code. If someone would like to use the USB as
> peripheral
> on his board, this code is not suitable.

But USB peripheral is a different driver. So, this code will not run. So
USB2_COMMCTRL will keep the default value 0x80000000.

Correct?

> So, I have an idea to set the default mode by using "dr_mode" property,
> instead of hardcoded. Since the driver already has such a function,
> we can reuse rcar_gen3_device_recognition() to set the default value.
> To achieve that, we need to modify the following though.
>  - Don't enable "is_otg_channel".
>  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
>    because RZ/A2 doesn't have it.
>  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
>    because RZ/A2 doesn't seem to need the setting on host mode.
>=20
> What do you think?

If a board is designed for USB peripheral, why would they enable a EHCI=20
host driver for the same USB channel?
I am confused.

> > > (In other words, if we use the port as peripheral with the reset valu=
e
> > > 0x80000000, does it work?)
> >
> > We have not been able to get USB peripheral working on RZ/A2 yet.
> > For peripheral, RZ/A2 has HS-USB.
> > After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D
> "0110").
> > It should go to Configured state (DVSQ =3D "0011")
>=20
> I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
> because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?

Today for RZ/A1, we tell people to use USB0 first in their board design,
then use USB1 if they need a second USB channel. USB pins are dedicated
(no other function) so there should be no design conflicts.

If only USB1 is used, USB0 must also be enabled in DT as a dummy driver=20
(so SYSCFG.UPLLE can get set for USB1).


> > According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000
> when
> > using HS-USB.
> >
> > There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)
>=20
> I got it. So, I guess someone wants to use 1 host and 1 peripheral :)

Yes.

Chris
