Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:40166 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751223Ab3HSLPz (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Mon, 19 Aug 2013 07:15:55 -0400
Date: Mon, 19 Aug 2013 12:15:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v7 2/2] ASoC: fsl: Add S/PDIF machine driver
Message-ID: <20130819111552.GK3719@e106331-lin.cambridge.arm.com>
References: <cover.1376901081.git.b42378@freescale.com>
 <e7ceef74714bb4ead624b333ee3969225b4c5cb5.1376901081.git.b42378@freescale.com>
 <20130819092458.GE3719@e106331-lin.cambridge.arm.com>
 <20130819095042.GA11402@MrMyself>
 <20130819100143.GH3719@e106331-lin.cambridge.arm.com>
 <20130819102105.GC11402@MrMyself>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130819102105.GC11402@MrMyself>
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "timur@tabi.org" <timur@tabi.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "R65777@freescale.com" <R65777@freescale.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Aug 19, 2013 at 11:21:06AM +0100, Nicolin Chen wrote:
> On Mon, Aug 19, 2013 at 11:01:43AM +0100, Mark Rutland wrote:
> > > At least they are separate drivers as I mentioned in the commit comments.
> > 
> > I'm not sure that the boundary of Linux drivers should necessarily
> > determine the way we carve up the description of IP blocks, though
> > presumably it's a pretty sensible way of carving it up or we wouldn't
> > have done it.
> 
> I'm not sure if I understand your point correctly. But in fact the IP driver
> is not being carved up. The spdif-transmitter and spdif-receiver are basically
> dummy codec drivers. All the IP-related codes are implemented in fsl_spdif.c,
> the PATCH 1/2 you just reviewed.

I see. Sorry for the noise there, that's an artifact of my not full
understanding of the ASoC bindings.

> 
> > Is there any public documentation on the i.MX S/PDIF hardware block(s)?
> 
> http://cache.freescale.com/files/32bit/doc/ref_manual/IMX6DQRM.pdf
> 

Cheers!

Mark.
