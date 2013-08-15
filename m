Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]:6892
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751375Ab3HOJYT (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Thu, 15 Aug 2013 05:24:19 -0400
Date: Thu, 15 Aug 2013 17:24:30 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130815092428.GI16915@S2101-09.ap.freescale.net>
References: <1376308870-14232-1-git-send-email-b42378@freescale.com>
 <1376308870-14232-2-git-send-email-b42378@freescale.com>
 <CAOMZO5A7noEb98yuCPY6o2mf-FikFcMYiDLpg3huPKHMO7Fwdw@mail.gmail.com>
 <20130814032658.GA16915@S2101-09.ap.freescale.net>
 <20130814053016.GF31651@MrMyself>
 <20130814063931.GB31141@S2101-09.ap.freescale.net>
 <20130814063444.GG31651@MrMyself>
 <20130814081445.GC31141@S2101-09.ap.freescale.net>
 <520BA687.4030905@wwwdotorg.org>
 <20130815021823.GA1846@MrMyself>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130815021823.GA1846@MrMyself>
Sender: devicetree-owner@vger.kernel.org
To: Nicolin Chen <b42378@freescale.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Fabio Estevam <festevam@gmail.com>, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 15, 2013 at 10:18:23AM +0800, Nicolin Chen wrote:
> Hi Stephen,
> 
> On Wed, Aug 14, 2013 at 09:47:19AM -0600, Stephen Warren wrote:
> > If the clock source name list is different, then it needs a different
> > compatible value, so that each compatible value can specify which clock
> > names are required.
> > 
> > Also, the compatible value itself should always include the exact HW
> > that's present (most specific HW version), as well as any other HW it's
> > compatible with.
>  
> Thank you for the comments. Yes, I did so in v1-v3, but after rethinking
> about the situation (Actually both the HW version and the clock mux itself
> are same, just the clock sources connecting to the mux might be different),
> so I decided to do this by abstracting the driver from those source info
> and letting DT binding to pass such information. Because I think putting 
> the clock sources into the driver differed by compatible value would make
> the driver more like SoC-specified, not the ideal way -- SoC-independent,
> since the clock sources are based on SoC design, not on itself.

+1

It's pretty much the differences at SoC integration level not the IP
itself, and it just happens to be handled in a register of the IP.

Shawn

