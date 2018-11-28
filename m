From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC
 support
Date: Wed, 28 Nov 2018 10:33:45 +0100
Message-ID: <20181128093345.GC8952@piout.net>
References: <1543311334-8807-1-git-send-email-Anson.Huang@nxp.com>
 <1543311334-8807-5-git-send-email-Anson.Huang@nxp.com>
 <20181128100420.0c9a721a@karo-electronics.de>
 <DB3PR0402MB3916FFD700313BF684CF32AAF5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20181128091943.GB8952@piout.net>
 <DB3PR0402MB39168AC8DB69B81C51CE63C2F5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39168AC8DB69B81C51CE63C2F5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Lothar =?utf-8?B?V2Hvv73vv71tYW5u?= <LW@KARO-electronics.de>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, shawn
List-Id: devicetree@vger.kernel.org

On 28/11/2018 09:21:56+0000, Anson Huang wrote:
> > > This module is NOT depending on any board design, should it be enabled by
> > default in soc dtsi?
> > > Like wdog etc..
> > >
> > 
> > I guess the point is that you may not want it enabled, even if it should always
> > be working. enabling it by default would affect the RTC ordering for example.
> 
> i.MX SoCs ONLY have 1 RTC. And RTC are always enabled by default for all i.MX
> SoCs, so do we have to disable it here and enable it in board dts?
> 

I would say that most of the i.MX based boards include another RTC
because the SoC one consumes way too much power.

Note that I don't care too much whether it is enabled by default, I
was simply explaining why you may want to disable it by default.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
