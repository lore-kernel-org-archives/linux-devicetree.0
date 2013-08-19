Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:38584 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750929Ab3HSKBq (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 19 Aug 2013 06:01:46 -0400
Date: Mon, 19 Aug 2013 11:01:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 2/2] ASoC: fsl: Add S/PDIF machine driver
Message-ID: <20130819100143.GH3719@e106331-lin.cambridge.arm.com>
References: <cover.1376901081.git.b42378@freescale.com>
 <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
 <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
 <20130819095042.GA11402@MrMyself>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130819095042.GA11402@MrMyself>
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>, "broonie@kernel.org" <broonie@kernel.org>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 19, 2013 at 10:50:43AM +0100, Nicolin Chen wrote:
> Hi,
> 
> On Mon, Aug 19, 2013 at 10:24:58AM +0100, Mark Rutland wrote:
> > Is this used semantically, or is it a completely arbitrary string?  In
> > either case I don't see why the compatible string doesn't give the
> > driver enough to have a sensible value.
> > 
> > I'm confused as to why we need this. The phrase "user-visible" in a
> > device description seems very odd.
> 
> The string would be in the ALSA device list:
> ALSA device list:
>   #0: imx-spdif
> 
> I think it can be a sort of arbitrary as long as users know which this 
> device exactly is when they catch the name by 'aplay -l' or 'arecord -l'
> 
> The phrase "user-visible" is being used in many current docs, I don't 
> dare to change it unless a sage gives me a suggestion.

I can see that there is entrenched usage, but this really seems to be
embedding Linux-specific implementation details into the dt. I don't see
why the driver cannot select a sensible name, but perhaps I'm missing
something.

Mark, is there any reason we need to handle the user-visible name of the
device this way?

> 
> > > +
> > > +  - spdif-controller : The phandle of the i.MX S/PDIF controller
> > > +
> > > +
> > > +Optional properties:
> > > +
> > > +  - spdif-transmitter : The phandle of the spdif-transmitter dummy codec
> > > +
> > > +  - spdif-receiver : The phandle of the spdif-receiver dummy codec
> > > +
> > > +* Note: At least one of these two properties should be set in the DT binding.
> > 
> > Are all four units (comlpex,controller,transmitter,receiver) really
> > separate blocks?
> 
> At least they are separate drivers as I mentioned in the commit comments.

I'm not sure that the boundary of Linux drivers should necessarily
determine the way we carve up the description of IP blocks, though
presumably it's a pretty sensible way of carving it up or we wouldn't
have done it.

Is there any public documentation on the i.MX S/PDIF hardware block(s)?

Thanks,
Mark.
