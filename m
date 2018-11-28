From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 4/4] ARM64: dts: imx: add i.MX8QXP system controller RTC
 support
Date: Wed, 28 Nov 2018 10:58:23 +0100
Message-ID: <20181128095823.GE8952@piout.net>
References: <1543311334-8807-1-git-send-email-Anson.Huang@nxp.com>
 <1543311334-8807-5-git-send-email-Anson.Huang@nxp.com>
 <20181128100420.0c9a721a@karo-electronics.de>
 <DB3PR0402MB3916FFD700313BF684CF32AAF5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20181128091943.GB8952@piout.net>
 <DB3PR0402MB39168AC8DB69B81C51CE63C2F5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20181128093345.GC8952@piout.net>
 <DB3PR0402MB3916DE94D437DC51435D00CEF5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916DE94D437DC51435D00CEF5D10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Lothar =?utf-8?B?V2Hvv73vv71tYW5u?= <LW@KARO-electronics.de>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, shawn
List-Id: devicetree@vger.kernel.org

On 28/11/2018 09:41:22+0000, Anson Huang wrote:
> > > i.MX SoCs ONLY have 1 RTC. And RTC are always enabled by default for
> > > all i.MX SoCs, so do we have to disable it here and enable it in board dts?
> > >
> > 
> > I would say that most of the i.MX based boards include another RTC because
> > the SoC one consumes way too much power.
> > 
> > Note that I don't care too much whether it is enabled by default, I was simply
> > explaining why you may want to disable it by default.
> 
> OK, this system controller RTC is a little different, it is controlled by system controller firmware,
> and system controller firmware will always select the best one for its user(Linux kernel) if there are other
> RTCs available, so I think we can keep it enabled by default for now. Thanks.
> 

Do you mean that the plan is to push support for the external RTCs (e.g.
the i2c ones) to the M4 firmware?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
