From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH V4 2/4] rtc: add i.MX system controller RTC support
Date: Wed, 19 Dec 2018 11:17:49 +0100
Message-ID: <20181219101749.GK19816@piout.net>
References: <1543455856-18021-1-git-send-email-Anson.Huang@nxp.com>
 <1543455856-18021-3-git-send-email-Anson.Huang@nxp.com>
 <20181219085429.GJ19816@piout.net>
 <DB3PR0402MB39167296BD1302130B537FD7F5BE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <AM0PR04MB42119CF2FB98AEDE02DC0FB980BE0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42119CF2FB98AEDE02DC0FB980BE0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Anson Huang <anson.huang@nxp.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, shawnguo@kernel.or
List-Id: devicetree@vger.kernel.org

On 19/12/2018 09:48:25+0000, Aisheng Dong wrote:
> [...]
> > >
> > > I applied it on my test branch and this makes sparc64-allyesconfig
> > > fail
> > > with:
> > >
> > >    drivers/rtc/rtc-imx-sc.o: In function `imx_sc_rtc_read_time':
> > >    rtc-imx-sc.c:(.text+0x34): undefined reference to `imx_scu_call_rpc'
> > >    drivers/rtc/rtc-imx-sc.o: In function `imx_sc_rtc_probe':
> > >    rtc-imx-sc.c:(.text+0x90): undefined reference to `imx_scu_get_handle'
> > 
> > Maybe there are some changes on basic support of imx scu driver, I will resend
> > a patch set later, thanks.
> > 
> 
> This driver should depend on IMX_SCU which seems not got compiled.
> 

Yes, this seems to be the straightforward solution.

> Regards
> Dong Aisheng
> 
> > Anson.
> > 
> > >
> > >
> > >
> > > --
> > > Alexandre Belloni, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fboo
> > > tl
> > in.com&amp;data=02%7C01%7Canson.huang%40nxp.com%7C72b147643a3f
> > >
> > 44c258c208d6658f9cce%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > > %7C636808064818797711&amp;sdata=%2Bl5jGXX6wBYbOg5Zalg4CyxyZKj
> > Ue
> > > uzRSQEKO9TJnRI%3D&amp;reserved=0

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
