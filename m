Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F037C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E44A21774
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 16:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1QfX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 11:35:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39081 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfK1QfX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 11:35:23 -0500
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iaMlA-0001pe-Ss; Thu, 28 Nov 2019 17:35:16 +0100
Message-ID: <ca111d6b252078357341363b7fb07adfb8e216ef.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] arm64: dts: zii-ultra: add sound support
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Daniel Baluta <daniel.baluta@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc:     "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Date:   Thu, 28 Nov 2019 17:35:15 +0100
In-Reply-To: <0909b60cb5943007e1c3db31e3f6c91f289c85f9.camel@nxp.com>
References: <20191127182127.1204-1-l.stach@pengutronix.de>
         <20191127182127.1204-2-l.stach@pengutronix.de>
         <0909b60cb5943007e1c3db31e3f6c91f289c85f9.camel@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Daniel,

On Do, 2019-11-28 at 11:10 +0000, Daniel Baluta wrote:
> Few comments inline about the naming:
> 
> On Wed, 2019-11-27 at 19:21 +0100, Lucas Stach wrote:
> > This adds all the necessary device nodes to get audio support on both
> > the
> > RMB3 and Zest boards.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  .../dts/freescale/imx8mq-zii-ultra-rmb3.dts   | 87 ++++++++++++++++
> >  .../dts/freescale/imx8mq-zii-ultra-zest.dts   | 30 ++++++
> >  .../boot/dts/freescale/imx8mq-zii-ultra.dtsi  | 98
> > +++++++++++++++++++
> >  3 files changed, 215 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
> > b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
> > index 6b3581366d67..d5e06885c683 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dts
> > @@ -10,6 +10,56 @@
> >  / {
> >  	model = "ZII Ultra RMB3 Board";
> >  	compatible = "zii,imx8mq-ultra-rmb3", "zii,imx8mq-ultra",
> > "fsl,imx8mq";
> > +
> > +	sound1 {
> 
> I find sound1 / sound2 pretty generic. Perhaps we can go with something
> like sound-<codec_name>
> 
They are pretty generic, but I don't really see a reason to
differentiate them more. Both sound paths are using a similar codec/hpa
setup, the only difference is the SAI. If I name them after the SAI,
will this really help much?

> 
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,name = "RMB3 audio front";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,bitclock-master = <&sound1_codec>;
> > +		simple-audio-card,frame-master = <&sound1_codec>;
> > +		simple-audio-card,widgets =
> > +			"Headphone", "Headphone Jack Front";
> > +		simple-audio-card,routing =
> > +			"Headphone Jack Front", "HPA1 HPLEFT",
> > +			"Headphone Jack Front", "HPA1 HPRIGHT",
> > +			"HPA1 LEFTIN", "HPL",
> > +			"HPA1 RIGHTIN", "HPR";
> > +		simple-audio-card,aux-devs = <&hpa1>;
> > +
> > +		sound1_cpu: simple-audio-card,cpu {
> > +			sound-dai = <&sai2>;
> > +		};
> > +
> > +		sound1_codec: simple-audio-card,codec {
> > +			sound-dai = <&codec1>;
> 
> Codec1 here is too generic. Perpahs we can add real code name.

I agree that this might seem like thoughtless generic naming from the
outside, but actually it lines up pretty well with the naming used in
the schematics. I'm really reluctant to change the naming here, as any
change will inevitably make it harder to match up the DTS with the
schematics.

Regards,
Lucas

> > +			clocks = <&cs2000>;
> > +		};
> > +	};
> > +
> > +	sound2 {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,name = "RMB3 audio back";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,bitclock-master = <&sound2_codec>;
> > +		simple-audio-card,frame-master = <&sound2_codec>;
> > +		simple-audio-card,widgets =
> > +			"Headphone", "Headphone Jack Back";
> > +		simple-audio-card,routing =
> > +			"Headphone Jack Back", "HPA2 HPLEFT",
> > +			"Headphone Jack Back", "HPA2 HPRIGHT",
> > +			"HPA2 LEFTIN", "HPL",
> > +			"HPA2 RIGHTIN", "HPR";
> > +		simple-audio-card,aux-devs = <&hpa2>;
> > +
> > +		sound2_cpu: simple-audio-card,cpu {
> > +			sound-dai = <&sai3>;
> > +		};
> > +
> > +		sound2_codec: simple-audio-card,codec {
> > +			sound-dai = <&codec2>;
> Ditto.
> 
> > +			clocks = <&cs2000>;
> > +		};
> > +	};
> >  };
> >  
> >  &ecspi1 {
> > @@ -27,6 +77,23 @@
> >  	};
> >  };
> >  
> > +&i2c1 {
> > +	codec2: codec@18 {
> 
> Here we might go with something like: 
> 
> tlv320dac3100: codec@18
> 
> 
> > +		compatible = "ti,tlv320dac3100";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_codec2>;
> > +		reg = <0x18>;
> > +		#sound-dai-cells = <0>;
> > +		HPVDD-supply = <&reg_3p3v>;
> > +		SPRVDD-supply = <&reg_3p3v>;
> > +		SPLVDD-supply = <&reg_3p3v>;
> > +		AVDD-supply = <&reg_3p3v>;
> > +		IOVDD-supply = <&reg_3p3v>;
> > +		DVDD-supply = <&vgen4_reg>;
> > +		gpio-reset = <&gpio3 4 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> > 
> 
> This is just a thought, naming is hard. But it should help with
> readability.

