From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 2/4] rtc: add i.MX system controller RTC support
Date: Wed, 19 Dec 2018 09:48:25 +0000
Message-ID: <AM0PR04MB42119CF2FB98AEDE02DC0FB980BE0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1543455856-18021-1-git-send-email-Anson.Huang@nxp.com>
 <1543455856-18021-3-git-send-email-Anson.Huang@nxp.com>
 <20181219085429.GJ19816@piout.net>
 <DB3PR0402MB39167296BD1302130B537FD7F5BE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39167296BD1302130B537FD7F5BE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, linux-rt
List-Id: devicetree@vger.kernel.org

[...]
> >
> > I applied it on my test branch and this makes sparc64-allyesconfig
> > fail
> > with:
> >
> >    drivers/rtc/rtc-imx-sc.o: In function `imx_sc_rtc_read_time':
> >    rtc-imx-sc.c:(.text+0x34): undefined reference to `imx_scu_call_rpc'
> >    drivers/rtc/rtc-imx-sc.o: In function `imx_sc_rtc_probe':
> >    rtc-imx-sc.c:(.text+0x90): undefined reference to `imx_scu_get_handl=
e'
>=20
> Maybe there are some changes on basic support of imx scu driver, I will r=
esend
> a patch set later, thanks.
>=20

This driver should depend on IMX_SCU which seems not got compiled.

Regards
Dong Aisheng

> Anson.
>=20
> >
> >
> >
> > --
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbo=
o
> > tl
> in.com&amp;data=3D02%7C01%7Canson.huang%40nxp.com%7C72b147643a3f
> >
> 44c258c208d6658f9cce%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > %7C636808064818797711&amp;sdata=3D%2Bl5jGXX6wBYbOg5Zalg4CyxyZKj
> Ue
> > uzRSQEKO9TJnRI%3D&amp;reserved=3D0
