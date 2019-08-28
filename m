Return-Path: <SRS0=7E25=WY=intel.com=rui.zhang@kernel.org>
Message-ID: <ff3fd0ab2ba659e98070760be8e7c0f223e921f9.camel@intel.com>
Subject: Re: [PATCH V15 1/5] dt-bindings: fsl: scu: add thermal binding
From: Zhang Rui <rui.zhang@intel.com>
Date: Wed, 28 Aug 2019 17:14:09 +0800
In-Reply-To: <DB3PR0402MB39162EB555CD7AE75D58C582F5C60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190618021820.14885-1-Anson.Huang@nxp.com>
	 <DB3PR0402MB39162C5B5AF828B127DD871EF5E00@DB3PR0402MB3916.eurprd04.prod.outlook.com>
	 <DB3PR0402MB39162EB555CD7AE75D58C582F5C60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "corbet@lwn.net" <corbet@lwn.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi, Anson,

We're missing ACK from the maintainers for patch 4/5 and 5/5, if we
want to shipped the patch via thermal tree.

For patch 2/5, as it introduces a new API for OF_THERMAL, I'd like to
get Eduardo' feedback before taking them.

thanks,
rui

On Wed, 2019-07-24 at 03:16 +0000, Anson Huang wrote:
> Ping...
> 
> > Hi, Daniel/Rui/Eduardo
> > 	Could you please take a look at this patch series?
> > 
> > Anson
> > 
> > > From: Anson Huang <Anson.Huang@nxp.com>
> > > 
> > > NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> > > system
> > > controller, the system controller is in charge of system power,
> > > clock
> > > and thermal sensors etc. management, Linux kernel has to
> > > communicate
> > > with system controller via MU (message unit) IPC to get
> > > temperature
> > > from thermal sensors, this patch adds binding doc for i.MX system
> > > controller thermal driver.
> > > 
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > No change.
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt        | 16
> > 
> > ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index a575e42..fc3844e 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -155,6 +155,17 @@ Required properties:
> > >  Optional properties:
> > >  - timeout-sec: contains the watchdog timeout in seconds.
> > > 
> > > +Thermal bindings based on SCU Message Protocol
> > > +------------------------------------------------------------
> > > +
> > > +Required properties:
> > > +- compatible:			Should be :
> > > +				  "fsl,imx8qxp-sc-thermal"
> > > +				followed by "fsl,imx-sc-thermal";
> > > +
> > > +- #thermal-sensor-cells:	See
> > > Documentation/devicetree/bindings/thermal/thermal.txt
> > > +				for a description.
> > > +
> > >  Example (imx8qxp):
> > >  -------------
> > >  aliases {
> > > @@ -222,6 +233,11 @@ firmware {
> > >  			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-
> > > wdt";
> > >  			timeout-sec = <60>;
> > >  		};
> > > +
> > > +		tsens: thermal-sensor {
> > > +			compatible = "fsl,imx8qxp-sc-thermal",
> > > "fsl,imx-sc-
> > > thermal";
> > > +			#thermal-sensor-cells = <1>;
> > > +		};
> > >  	};
> > >  };
> > > 
> > > --
> > > 2.7.4
> 
> 
