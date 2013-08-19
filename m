Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]:8792
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750852Ab3HSJe7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 19 Aug 2013 05:34:59 -0400
Date: Mon, 19 Aug 2013 17:34:24 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [PATCH v7 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130819093423.GB10950@MrMyself>
References: <cover.1376901081.git.b42378@freescale.com>
 <43416f3617951161b6e779277b4719438f844e49.1376901081.git.b42378@freescale.com>
 <20130819091809.GD3719@e106331-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130819091809.GD3719@e106331-lin.cambridge.arm.com>
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>

Hi Mark,

   Thank you for the commenst. I'll Fix them in v8.

   Here are some remaining question:

On Mon, Aug 19, 2013 at 10:18:09AM +0100, Mark Rutland wrote:
> > +Required properties:
> > +
> > +  - compatible : Compatible list, contains "fsl,<chip>-spdif".
> 
> What are valid values for <chip>? The binding should mention this. There
> are bindings that don't, but they need to be fixed. Undocumented ABIs
> are a bad idea.

I see, so 'Compatible list, must contains "fsl,imx35-spdif"' would be okay?

> > +  - interrupts : Contains spdif interrupt.
> 
> Is that the only interrupt the device generates?

Yes, how could I improve this description?


> > +       "core"          The core clock of spdif controller
> > +       "rxtx<0-7>"     Clock source list for tx and rx clock.
> > +                       This clock list should be identical to
> > +                       the source list connecting to the spdif
> > +                       clock mux in "SPDIF Transceiver Clock
> > +                       Diagram" of SoC reference manual. It
> > +                       can also be referred to TxClk_Source
> > +                       bit of register SPDIF_STC.
> 
> Could you elaborate on the last sentence? I'm not sure exactly what you
> meant.

The list is also identical to the TxClk_Source bit value list of
register SPDIF_STC.

> 
> > +
> > +Example:
> > +
> > +spdif: spdif@02004000 {
> > +       compatible = "fsl,imx6q-spdif",
> > +               "fsl,imx35-spdif";
> 
> Is "fsl,imx35-spdif" necessary in the list, or is it not the case all
> "fsl,<chip>-spdif" variants are compatible with it?
> 
> That should be mentioned along with the list of valid compatible
> strings.

I guess it's better to drop the 'imx6q-spdif' here?


Thank you,
Nicolin



