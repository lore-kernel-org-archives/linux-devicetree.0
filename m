From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Assign highest opp as suspend opp
Date: Mon, 8 Jul 2019 14:19:57 +0530
Message-ID: <20190708084957.waiwdun327pgvfv4@vireshk-i7>
References: <20190704061403.8249-1-Anson.Huang@nxp.com>
 <20190704061403.8249-2-Anson.Huang@nxp.com>
 <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
 <20190708082511.py7gnjbqyp7bnhqx@vireshk-i7>
 <DB3PR0402MB391622133CD116FDE26A4F9AF5F60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB391622133CD116FDE26A4F9AF5F60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Leonard Crestez <leonard.crestez@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

On 08-07-19, 08:43, Anson Huang wrote:
> Hi, Viresh
> 
> > On 04-07-19, 07:49, Leonard Crestez wrote:
> > > On 7/4/2019 9:23 AM, Anson.Huang@nxp.com wrote:
> > > > From: Anson Huang <Anson.Huang@nxp.com>
> > > >
> > > > Assign highest OPP as suspend OPP to reduce suspend/resume latency
> > > > on i.MX8MM.
> > > >
> > > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > > ---
> > > >   arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > index b11fc5e..3a62407 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > > @@ -136,6 +136,7 @@
> > > >   			opp-microvolt = <1000000>;
> > > >   			opp-supported-hw = <0x8>, <0x3>;
> > > >   			clock-latency-ns = <150000>;
> > > > +			opp-suspend;
> > > >   		};
> > > >   	};
> > >
> > > What if the highest OPP is unavailable due to speed grading?
> > 
> > What does this exactly mean ? How is the OPP made unavailable in your
> > case ?
> 
> That is because in i.MX8M series SoCs, the speed grading and market segment
> fuses settings could affect the OPP defined in DT, in a word, all possible OPPs
> are defined in DT, but each parts could ONLY select some of them to be working
> OPPs, so if the "opp-suspend" is added for 1 OPP in DT, if the part's speed grading or
> market segment fuse settings make that OPP as unavailable,  then that "opp-suspend"
> is NOT working at all.

How is this selection done ? You using some OPP helper or something
else ?

-- 
viresh
