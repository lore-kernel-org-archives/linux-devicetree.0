Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:49866 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757340Ab3GZPyT (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Fri, 26 Jul 2013 11:54:19 -0400
Date: Fri, 26 Jul 2013 16:54:09 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ASoC: wm8994: Add clock bindings to the device tree
Message-ID: <20130726155409.GC3528@e106331-lin.cambridge.arm.com>
References: <1374762668-5037-1-git-send-email-broonie@kernel.org>
 <20130725154627.GA22291@e106331-lin.cambridge.arm.com>
 <20130725175642.GJ9858@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130725175642.GJ9858@sirena.org.uk>
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "patches@opensource.wolfsonmicro.com" <patches@opensource.wolfsonmicro.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 25, 2013 at 06:56:42PM +0100, Mark Brown wrote:
> On Thu, Jul 25, 2013 at 04:46:27PM +0100, Mark Rutland wrote:
> 
> > Do these two clock inputs exist for all of wm1811, wm8994, and wm8958?
> 
> Yes.
> 
> > If I've read the context correctly, these are optional. Does this mean
> > that if not listed that an OS can assume they are already configured and
> > active? It would be nice to document that.
> 
> The clocks are both optional but even if they were assumed to be present
> they aren't usable without knowing the rate which can vary widely.  It
> is possible that the system may be able to infer their presence and
> rates from other information such as the audio system integration
> compatible string but that's out of scope for this and doesn't seem like
> a particularly good idea to encorage anyway.

Ok, that sounds sensible.

Thanks,
Mark.
