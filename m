From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V9 1/4] dt-bindings: watchdog: add i.MX system controller
 watchdog
Date: Fri, 29 Mar 2019 09:49:05 -0700
Message-ID: <20190329164905.GA7537@roeck-us.net>
References: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
 <1553134884-1720-2-git-send-email-Anson.Huang@nxp.com>
 <20190325203727.GA27661@bogus>
 <DB3PR0402MB39161467D49348DC550CA28AF55A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39161467D49348DC550CA28AF55A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 29, 2019 at 07:44:21AM +0000, Anson Huang wrote:
> Hi, Guenter/Shawn
> 	Since DT has been acked, would you pick up this patch series if no additional comments?
> 

I added patch 1 and 2 of the series to my watchdog-next tree.
Wim usually picks it up from there.

Guenter

> Best Regards!
> Anson Huang
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: 2019年3月26日 4:37
> > To: Anson Huang <anson.huang@nxp.com>
> > Cc: wim@linux-watchdog.org; linux@roeck-us.net; mark.rutland@arm.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; catalin.marinas@arm.com; will.deacon@arm.com;
> > Aisheng Dong <aisheng.dong@nxp.com>; Daniel Baluta
> > <daniel.baluta@nxp.com>; horms+renesas@verge.net.au; heiko@sntech.de;
> > maxime.ripard@bootlin.com; Andy Gross <andy.gross@linaro.org>;
> > jagan@amarulasolutions.com; bjorn.andersson@linaro.org;
> > enric.balletbo@collabora.com; ezequiel@collabora.com;
> > stefan.wahren@i2se.com; marc.w.gonzalez@free.fr; olof@lixom.net; linux-
> > watchdog@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>
> > Subject: Re: [PATCH V9 1/4] dt-bindings: watchdog: add i.MX system
> > controller watchdog
> > 
> > On Thu, Mar 21, 2019 at 02:26:38AM +0000, Anson Huang wrote:
> > > Add i.MX system controller watchdog binding doc.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > > Changes since V8:
> > > 	- add optional property "timeout-sec" according to driver change.
> > > ---
> > >  .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24
> > ++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-
> > imx-sc-wdt.txt
> > 
> > I still think what's in ATF should be discoverable, but:
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
