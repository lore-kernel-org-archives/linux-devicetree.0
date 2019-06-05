From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog node
 into scu node
Date: Wed, 5 Jun 2019 06:09:12 +0000
Message-ID: <DB3PR0402MB39161D679A11B05ADCA8A28BF5160@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
 <1557655528-12816-2-git-send-email-Anson.Huang@nxp.com>
 <DB3PR0402MB39162F3811484D90546B4CC2F5150@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190605060000.GA29853@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190605060000.GA29853@dragon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "festevam@gmail.com" <festevam@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Wednesday, June 5, 2019 2:00 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; wim@linux-watchdog.org;
> linux@roeck-us.net; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; Aisheng Dong <aisheng.dong@nxp.com>;
> ulf.hansson@linaro.org; Daniel Baluta <daniel.baluta@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog
> node into scu node
> 
> On Tue, Jun 04, 2019 at 09:06:28AM +0000, Anson Huang wrote:
> > Hi, Shawn
> > 	The driver and binding doc are already reviewed and waiting for DT
> patch, will you help review this DT patch?
> 
> I'm fine with it.  Should I just pick this patch up, or is there any dependency
> we need to handle?

No dependency, it just makes more sense to move the node into SCU node as it is NOW depending on SCU
driver. Once you pick up this patch (and maybe the dt-binding patch as well?), I will notify the watchdog
maintainer to pick up the watchdog patch in this series.

Thanks,
Anson

> 
> Shawn
> 
> >
> > Thanks,
> > Anson
> >
> > > -----Original Message-----
> > > From: Anson Huang
> > > Sent: Sunday, May 12, 2019 6:11 PM
> > > To: robh+dt@kernel.org; mark.rutland@arm.com;
> > > wim@linux-watchdog.org; linux@roeck-us.net; shawnguo@kernel.org;
> > > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > > Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
> > > Baluta <daniel.baluta@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > > watchdog@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > > Cc: dl-linux-imx <linux-imx@nxp.com>
> > > Subject: [PATCH RESEND V4 2/3] arm64: dts: imx8qxp: Move watchdog
> > > node into scu node
> > >
> > > i.MX system controller watchdog has pretimeout function which
> > > depends on i.MX SCU driver, so it should be a subnode of SCU.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > > No change, just resend patch with correct encoding.
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > index 0683ee2..b17c22e 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > > @@ -149,6 +149,11 @@
> > >  		rtc: rtc {
> > >  			compatible = "fsl,imx8qxp-sc-rtc";
> > >  		};
> > > +
> > > +		watchdog {
> > > +			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> > > +			timeout-sec = <60>;
> > > +		};
> > >  	};
> > >
> > >  	timer {
> > > @@ -517,9 +522,4 @@
> > >  			power-domains = <&pd IMX_SC_R_GPIO_7>;
> > >  		};
> > >  	};
> > > -
> > > -	watchdog {
> > > -		compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
> > > -		timeout-sec = <60>;
> > > -	};
> > >  };
> > > --
> > > 2.7.4
> >
