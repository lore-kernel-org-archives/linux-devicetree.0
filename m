From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Date: Wed, 5 Jun 2019 14:00:02 +0800
Message-ID: <20190605060000.GA29853@dragon>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
 <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>dl-linux-imx <li>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 09:06:28AM +0000, Anson Huang wrote:
> Hi, Shawn
> 	The driver and binding doc are already reviewed and waiting for DT patch, will you help review this DT patch?

I'm fine with it.  Should I just pick this patch up, or is there any
dependency we need to handle?

Shawn

> 
> Thanks,
> Anson
> 
> > -----Original Message-----
> > From: Anson Huang
> > Sent: Sunday, May 12, 2019 6:11 PM
> > To: robh+dt@kernel.org; mark.rutland@arm.com; wim@linux-watchdog.org;
> > linux@roeck-us.net; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; Aisheng Dong
> > <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel Baluta
> > <daniel.baluta@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Cc: dl-linux-imx <linux-imx@nxp.com>
> > Subject: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
> > into scu node
> > 
> > i.MX system controller watchdog has pretimeout function which depends on
> > i.MX SCU driver, so it should be a subnode of SCU.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> > No change, just resend patch with correct encoding.
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 0683ee2..b17c22e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -149,6 +149,11 @@
> >  		rtc: rtc {
> >  			compatible = "fsl,imx8qxp-sc-rtc";
> >  		};
> > +
> > +		watchdog {
> > +			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> > +			timeout-sec = <60>;
> > +		};
> >  	};
> > 
> >  	timer {
> > @@ -517,9 +522,4 @@
> >  			power-domains = <&pd IMX_SC_R_GPIO_7>;
> >  		};
> >  	};
> > -
> > -	watchdog {
> > -		compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> > -		timeout-sec = <60>;
> > -	};
> >  };
> > --
> > 2.7.4
> 
