From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 1/2] arm64: dts: imx8mq: Correct OPP table according to
 latest datasheet
Date: Fri, 28 Jun 2019 06:16:00 +0000
Message-ID: <DB3PR0402MB39161C60DC780B693933F9EAF5FC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190628032800.8428-1-Anson.Huang@nxp.com>
 <VI1PR04MB50553915C0D978A8019BDC5CEEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB50553915C0D978A8019BDC5CEEFC0@VI1PR04MB5055.eurprd04.prod.outlook.com>
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
To: Leonard Crestez <leonard.crestez@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Leonard

> -----Original Message-----
> From: Leonard Crestez
> Sent: Friday, June 28, 2019 1:59 PM
> To: Anson Huang <anson.huang@nxp.com>; shawnguo@kernel.org; Jacky
> Bai <ping.bai@nxp.com>; l.stach@pengutronix.de
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; viresh.kumar@linaro.org;
> Daniel Baluta <daniel.baluta@nxp.com>; Abel Vesa <abel.vesa@nxp.com>;
> andrew.smirnov@gmail.com; ccaione@baylibre.com; angus@akkea.ca;
> agx@sigxcpu.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct OPP table according to
> latest datasheet
> 
> On 28.06.2019 06:37, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > According to latest datasheet (Rev.1, 10/2018) from below links, in
> > the consumer datasheet, 1.5GHz is mentioned as highest opp but depends
> > on speed grading fuse, and in the industrial datasheet, 1.3GHz is
> > mentioned as highest opp but depends on speed grading fuse. 1.5GHz and
> > 1.3GHz opp use same voltage, so no need for consumer part to support
> > 1.3GHz opp, with same voltage, CPU should run at highest frequency in
> > order to go into idle as quick as possible, this can save power.
> 
> I looked at the same datasheets and it's not clear to me that 1.3 Ghz should
> be disallowed for consumer parts. Power consumption increases with both
> voltage and frequency so having two OPPs with same voltage does make
> sense.

The consumer part datasheet does NOT mention 1.3GHz at all, so consumer part ONLY
support 1GHz/1.5GHz, and industrial part ONLY support 800MHz/1.3GHz, this is what
we did in our internal tree and NPI release, so better to make them aligned, otherwise,
we have to change it when kernel upgrade.

And normally, with same voltage, i.MX SoCs always run at highest frequency, so it is better
to keep the rule, otherwise customer may ask, how about using same voltage to run at 1.2GHz or
1.1GHz?

> 
> >   			opp-hz = /bits/ 64 <1300000000>;
> >   			opp-microvolt = <1000000>;
> > -			opp-supported-hw = <0xc>, <0x7>;
> > +			/* Industrial only but rely on speed grading */
> > +			opp-supported-hw = <0xc>, <0x4>;
> 
> Comment is false, you're explicitly excluding consumer parts via the second
> element.

Yes, that is what I meant to do, as we no need to support 1.3GHz for consumer
part, with 1.0V, consumer part can run up to 1.5GHz.

> 
> >   			opp-hz = /bits/ 64 <1500000000>;
> >   			opp-microvolt = <1000000>;
> >   			/* Consumer only but rely on speed grading */
> > -			opp-supported-hw = <0x8>, <0x7>;
> > +			opp-supported-hw = <0x8>, <0x3>;
> 
> If you don't want to rely on the fact that only consumer parts should be
> fused for 1.5 Ghz then please delete the comment.

Don't quite understand, 1.5GHz is indeed consumer ONLY, but if the consumer
part is fused to 1GHz, then 1.5GHz is also NOT available, so it also rely on speed
grading. So keep the comment there is OK?

Thanks,
Anson.
