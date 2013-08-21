Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:34664 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628Ab3HUSyj (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 14:54:39 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so328882bkb.34
        for <devicetree@vger.kernel.org>; Wed, 21 Aug 2013 11:54:38 -0700 (PDT)
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v10 2/2] ASoC: fsl: Add S/PDIF machine driver
Date: Wed, 21 Aug 2013 20:54:33 +0200
Message-ID: <2125663.4przPy426h@flatron>
In-Reply-To: <52150763.8020707@wwwdotorg.org>
References: <cover.1377054540.git.b42378@freescale.com> <e9cf5e37f858dea78319720f007f66c8c063885f.1377054540.git.b42378@freescale.com> <52150763.8020707@wwwdotorg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Nicolin Chen <b42378@freescale.com>, broonie@kernel.org, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, mark.rutland@arm.com, R65777@freescale.com
List-ID: <devicetree@vger.kernel.org>

On Wednesday 21 of August 2013 12:30:59 Stephen Warren wrote:
> On 08/20/2013 09:13 PM, Nicolin Chen wrote:
> > This patch implements a device-tree-only machine driver for Freescale
> > i.MX series Soc. It works with spdif_transmitter/spdif_receiver and
> > fsl_spdif.c drivers.
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt
> > b/Documentation/devicetree/bindings/sound/imx-audio-spdif.txt
> > 
> > +Optional properties:
> > +
> > +  - spdif-transmitter : The phandle of the spdif-transmitter codec
> > +
> > +  - spdif-receiver : The phandle of the spdif-receiver codec
> > +
> > +* Note: At least one of these two properties should be set in the DT
> > binding.
> I still don't think those two properties are correct.
> 
> Exactly what node will those phandles point at?

Imagine following setup:

  ________              ________________
 |        |     RX     | Microphone DSP |   Analog mic input
 | S/PDIF | <--------< |________________| <-------------------
 |        |             ________________
 |  DAI   | >--------> | Amplifier      | >-------------------
 |________|     TX     |________________|   Speakers output

As you see in the diagram, the S/PDIF interface of the SoC can be 
connected to some external devices that can perform sound processing or 
simply handle the physical layer.

I'd say that normally both RX and TX lines would be connected to a single 
codec chip that has multiple blocks inside, like sound processing, 
amplifier, mixer, etc., but nothing stops you from making a crazy setup, 
when RX and TX lines are connected to different chips.

> There definitely should not be a DT node for any "dummy CODEC",
> irrespective of whether this binding calls the other node a "CODEC" or a
> "dummy CODEC".

I agree. Instead if no chip connected to particular line is specified in 
device tree, it's responsibility of Linux sound core to handle this 
properly by adding a dummy codec or whatever.

> If these properties are to contain phandles, it would be acceptable for
> the referenced node to be:
> 
> * A node representing the physical connector/jack on the board.
> 
> * A node representing some other IP block on the board, such as an HDMI
> encoder/display-controller
> 
> I think those options are unlikely in general

Why? You usually codec SoC DAIs to some external chips.

Best regards,
Tomasz

