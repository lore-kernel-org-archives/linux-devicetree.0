From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Remove incorrect fallback
 compatible for ocotp
Date: Wed, 11 Sep 2019 11:17:28 +0200
Message-ID: <20190911091728.GA10331@linaro.org>
References: <1568211887-19318-1-git-send-email-Anson.Huang@nxp.com>
 <749f8dc6-dbf9-127c-9924-33432b8af00a@linaro.org>
 <DB3PR0402MB3916E0F566E35DD30275A8E9F5B10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB3916E0F566E35DD30275A8E9F5B10@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Jun Li <jun.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 11, 2019 at 09:05:49AM +0000, Anson Huang wrote:
> Hi, Daniel
> 
> > On 11/09/2019 16:24, Anson Huang wrote:
> > > Compared to i.MX7D, i.MX8MM has different ocotp layout, so it should
> > > NOT use "fsl,imx7d-ocotp" as ocotp's fallback compatible, remove it.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > index 5f9d0da..7c4dcce 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > @@ -426,7 +426,7 @@
> > >  			};
> > >
> > >  			ocotp: ocotp-ctrl@30350000 {
> > > -				compatible = "fsl,imx8mm-ocotp", "fsl,imx7d-
> > ocotp", "syscon";
> > > +				compatible = "fsl,imx8mm-ocotp", "syscon";
> > >  				reg = <0x30350000 0x10000>;
> > >  				clocks = <&clk IMX8MM_CLK_OCOTP_ROOT>;
> > >  				/* For nvmem subnodes */
> > 
> > Why not fold the two patches?
> 
> For i.MX8MM, it just removes the incorrect fallback compatible, for i.MX8MN, it needs
> to replace the incorrect fallback compatible in order to support SoC UID read, so I think
> this should be 2 separate patch?

Oh, yes, there is a subtle difference in the file name :) m|n. I understand
now why you splitted it.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
