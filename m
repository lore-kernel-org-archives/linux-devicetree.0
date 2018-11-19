Return-Path: <SRS0=vVjH=N6=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Mon, 19 Nov 2018 18:45:06 +0000
Message-ID: 
 <OSAPR01MB1553577EA2508275D59810808AD80@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda=1B$B$5$s=1B(B

From: Yoshihiro Shimoda
Sent: Monday, November 19, 2018 3:58 AM
> And I read Figure 32.1 of the RZ/A2 documentation and I wonder if we need
> to release
> USBCTR.PLL_RST even if we use USB peripheral mode.

I will ask the RZ/A2 design team to confirm.

If this setting is required, I think we should use your suggestion:

From: Yoshihiro Shimoda
Sent: Thursday, November 15, 2018 4:20 AM
> So, I have an idea to set the default mode by using "dr_mode" property,
> instead of hardcoded. Since the driver already has such a function,
> we can reuse rcar_gen3_device_recognition() to set the default value.
> To achieve that, we need to modify the following though.
>  - Don't enable "is_otg_channel".
>  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
>    because RZ/A2 doesn't have it.
>  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
>    because RZ/A2 doesn't seem to need the setting on host mode.


Chris
