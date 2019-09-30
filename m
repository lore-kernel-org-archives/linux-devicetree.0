From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/3] ARM: dts: add Netronix E60K02 board common file
Date: Mon, 30 Sep 2019 13:02:22 +0200
Message-ID: <20190930130222.4e1cdf64@aktux>
References: <20190927061423.17278-1-andreas@kemnade.info>
        <20190927061423.17278-2-andreas@kemnade.info>
        <20190927094721.w26ggnli4f5a64uv@pengutronix.de>
        <20190927210807.26439a94@aktux>
        <20190930082715.mplf5ra35ikqmbyr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930082715.mplf5ra35ikqmbyr@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Mon, 30 Sep 2019 10:27:15 +0200
Marco Felsch <m.felsch@pengutronix.de> wrote:

[..]
> > so you disagree with this pattern:
> > in .dtsi
> >  some_device {
> >    pinctrl-0 = <&pinctrl_some_device>;
> >  };
> > 
> > and in .dts (one I sent with this patch series and the tolino/mx6sl one
> > is not ready-cooked yet, will be part of a later series)
> > &iomuxc {
> >    pinctrl_some_device: some_devicegrp {
> >    	fsl,pins = <...>;
> >    };
> > };
> > 
> > ?  
> 
> Yes, because IMHO a dtsi is self contained as well as a dts. If it is
> common for all boards you can move the muxing into the dtsi else it
> should be done within the dts.
> 
well, since imx6sll-pinfunc.h is different than imx6sl-pinfunc.h,
we agree that this belongs to the dts.

> > > > +&snvs_rtc {
> > > > +	status = "disabled";    
> > > 
> > > Same applies here.
> > >   
> > 
> > No, seems to be an exception, it does not have a status = "disabled" in
> > imx6sll.dtsi.  
> 
> Did you mean 6sll or 6ull?
> 
> Okay, is this baseboard only used with a 6ull?
> 

MCIMX6V7DVN10AB and MCIMX6L8DVN10AB
So it is 6sll and 6sl (6sl support will be added in a follow-up patch
series). 

I will send a v2 this evening, so we can all look at better-sorted
things.

Regards,
Andreas
