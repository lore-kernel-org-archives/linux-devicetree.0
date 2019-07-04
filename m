From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 2/2] arm64: dts: imx8mm: Assign highest opp as suspend opp
Date: Thu, 4 Jul 2019 08:00:24 +0000
Message-ID: <DB3PR0402MB39165D27F23501EE358DE607F5FA0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190704061403.8249-1-Anson.Huang@nxp.com>
 <20190704061403.8249-2-Anson.Huang@nxp.com>
 <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB7PR04MB50519C02D90675070F21501DEEFA0@DB7PR04MB5051.eurprd04.prod.outlook.com>
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
To: Leonard Crestez <leonard.crestez@nxp.com>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "angus@akkea.ca" <angus@akkea.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi, Leonard

> On 7/4/2019 9:23 AM, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > Assign highest OPP as suspend OPP to reduce suspend/resume latency on
> > i.MX8MM.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >   arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
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
> What if the highest OPP is unavailable due to speed grading? Ideally we
> should find a way to suspend at the highest *supported* OPP.
> 
> Maybe the opp-suspend marking could be assigned from imx-cpufreq-dt
> driver code?

Yes, this is also my concern, the current OPP driver does NOT handle it well, and
I was thinking to assigne it from imx-cpufreq-dt driver, 1 option is to runtime add
"suspend-opp" property into DT OPP node after parsing the speed grading fuse and
OPP table, but I do NOT like that very much, as we need to manually create a property,
the other option is to change cpu freq policy inside imx-cpufreq-dt driver in suspend/resume
callback? Which one do you prefer?

Thanks,
Anson

> 
> --
> Regards,
> Leonard
