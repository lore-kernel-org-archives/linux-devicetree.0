Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]:16187
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750702Ab3HSJwZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 19 Aug 2013 05:52:25 -0400
Date: Mon, 19 Aug 2013 17:50:43 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [PATCH v7 2/2] ASoC: fsl: Add S/PDIF machine driver
Message-ID: <20130819095042.GA11402@MrMyself>
References: <cover.1376901081.git.b42378@freescale.com>
 <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
 <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Mon, Aug 19, 2013 at 10:24:58AM +0100, Mark Rutland wrote:
> Is this used semantically, or is it a completely arbitrary string?  In
> either case I don't see why the compatible string doesn't give the
> driver enough to have a sensible value.
> 
> I'm confused as to why we need this. The phrase "user-visible" in a
> device description seems very odd.

The string would be in the ALSA device list:
ALSA device list:
  #0: imx-spdif

I think it can be a sort of arbitrary as long as users know which this 
device exactly is when they catch the name by 'aplay -l' or 'arecord -l'

The phrase "user-visible" is being used in many current docs, I don't 
dare to change it unless a sage gives me a suggestion.

> > +
> > +  - spdif-controller : The phandle of the i.MX S/PDIF controller
> > +
> > +
> > +Optional properties:
> > +
> > +  - spdif-transmitter : The phandle of the spdif-transmitter dummy codec
> > +
> > +  - spdif-receiver : The phandle of the spdif-receiver dummy codec
> > +
> > +* Note: At least one of these two properties should be set in the DT binding.
> 
> Are all four units (comlpex,controller,transmitter,receiver) really
> separate blocks?

At least they are separate drivers as I mentioned in the commit comments.

Thank you,
Nicolin



