Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbfDKCP4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 10 Apr 2019 22:15:56 -0400
Date: Thu, 11 Apr 2019 10:15:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: ls1028a: Add properties for Mali DP500
 node
Message-ID: <20190411021542.GI26817@dragon>
References: <20190328035309.18703-1-wen.he_1@nxp.com>
 <20190403101409.GH7932@X250>
 <AM6PR0402MB3382FEA0EC535DCD0A94635EE2570@AM6PR0402MB3382.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR0402MB3382FEA0EC535DCD0A94635EE2570@AM6PR0402MB3382.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 03, 2019 at 01:03:17PM +0000, Wen He wrote:
> 
> 
> > -----Original Message-----
> > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > Sent: 2019年4月3日 18:14
> > To: Wen He <wen.he_1@nxp.com>
> > Cc: devicetree@vger.kernel.org; Leo Li <leoyang.li@nxp.com>;
> > liviu.dudau@arm.com; brian.starkey@arm.com
> > Subject: Re: [PATCH 1/2] arm64: dts: ls1028a: Add properties for Mali DP500
> > node
> > 
> > On Thu, Mar 28, 2019 at 03:51:46AM +0000, Wen He wrote:
> > > The LS1028A has a LCD controller and Displayport interface that
> > > connects to eDP and Displayport connectors on the LS1028A board.
> > >
> > > This patch enables the LCD controller driver on the LS1028A.
> > >
> > > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > > Signed-off-by: Wen He <wen.he_1@nxp.com>
> > > ---
> > >  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 37
> > > +++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > index 8dd3501b1333..0d5963bb46c5 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > > @@ -70,6 +70,27 @@
> > >  		clock-output-names = "sysclk";
> > >  	};
> > >
> > > +	dpclk: dpclk {
> > 
> > Please follow the naming convention "clock-xxx".
> > 
> > > +		compatible = "fixed-clock";
> > > +		#clock-cells = <0>;
> > > +		clock-frequency = <27000000>;
> > > +		clock-output-names= "dpclk";
> > > +	};
> > > +
> > > +	aclk: aclk {
> > > +		compatible = "fixed-clock";
> > > +		#clock-cells = <0>;
> > > +		clock-frequency = <650000000>;
> > > +		clock-output-names= "aclk";
> > > +	};
> > > +
> > > +	pclk: pclk {
> > > +		compatible = "fixed-clock";
> > > +		#clock-cells = <0>;
> > > +		clock-frequency = <650000000>;
> > > +		clock-output-names= "pclk";
> > > +	};
> > > +
> > >  	reboot {
> > >  		compatible ="syscon-reboot";
> > >  		regmap = <&dcfg>;
> > > @@ -433,4 +454,20 @@
> > >  			};
> > >  		};
> > >  	};
> > > +
> > > +	dp0: malidp@f080000 {
> > 
> > The node name should be something generic.  The recommendation from
> > Devicetree Specification is 'display'.
> > 
> 
> That definition following by malidp Devicetree bindings file.
> If use name is 'display', how to define display port controller? this only is LCD controller dts node.

We can use some sort of suffix to define multiple nodes:

 - display-0, display-1 ...
 - display-dp, display-lcd, ...

Whatever suffix works for you, but begin with a generic name.

> 
> > > +		compatible = "arm,mali-dp500";
> > > +		reg = <0x0 0xf080000 0x0 0x10000>;
> > > +		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
> > > +			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
> > > +		interrupt-names = "DE", "SE";
> > > +		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
> > > +		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> > > +		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> > 
> > Please have a newline between properties and child node.
> > 
> > Shawn
> > 
> 
> Sure, but I see the mail devicetree binding doesn't have a blank line. So I removed it.
> Is need to add a newline?

Different bindings use different conventions, but we have a set of
conventions for devicetree sources I maintain.

Shawn
