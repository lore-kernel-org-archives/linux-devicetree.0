From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Assign highest opp as suspend opp
Date: Mon, 8 Jul 2019 13:55:11 +0530
Message-ID: <20190708082511.py7gnjbqyp7bnhqx@vireshk-i7>
References: <20190704061403.8249-1-Anson.Huang@nxp.com>
 <20190704061403.8249-2-Anson.Huang@nxp.com>
 <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists>
List-Id: devicetree@vger.kernel.org

On 04-07-19, 07:49, Leonard Crestez wrote:
> On 7/4/2019 9:23 AM, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> > 
> > Assign highest OPP as suspend OPP to reduce suspend/resume
> > latency on i.MX8MM.
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >   arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index b11fc5e..3a62407 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -136,6 +136,7 @@
> >   			opp-microvolt = <1000000>;
> >   			opp-supported-hw = <0x8>, <0x3>;
> >   			clock-latency-ns = <150000>;
> > +			opp-suspend;
> >   		};
> >   	};
> 
> What if the highest OPP is unavailable due to speed grading?

What does this exactly mean ? How is the OPP made unavailable in your
case ?

What will dev_pm_opp_get_suspend_opp_freq() return in this case ?

> Ideally we 
> should find a way to suspend at the highest *supported* OPP.
> 
> Maybe the opp-suspend marking could be assigned from imx-cpufreq-dt 
> driver code?

Sorry for jumping in late, the latest patch from Anson drew my
attention to this topic :)

-- 
viresh
