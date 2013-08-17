Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:62071 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917Ab3HQM2K (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 08:28:10 -0400
Received: by mail-bk0-f54.google.com with SMTP id mz12so965158bkb.27
        for <devicetree@vger.kernel.org>; Sat, 17 Aug 2013 05:28:09 -0700 (PDT)
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Date: Sat, 17 Aug 2013 14:28:04 +0200
Message-ID: <2805432.jMVhHxhr1m@flatron>
In-Reply-To: <20130816101151.GQ26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com> <20130816095357.GA4694@MrMyself> <20130816101151.GQ26614@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Friday 16 of August 2013 12:11:51 Sascha Hauer wrote:
> On Fri, Aug 16, 2013 at 05:53:58PM +0800, Nicolin Chen wrote:
> > On Fri, Aug 16, 2013 at 10:56:32AM +0200, Sascha Hauer wrote:
> > > > "tx<0-8>"	Optional	Tx clock source for spdif 
playback.
> > > > 
> > > > 				If absent, will use core clock.
> > > > 				The index from 0 to 8 is identical
> > > > 				to the clock source list described
> > > > 				in TxClk_Source bit of register 
STC.
> > > > 				Multiple clock source are allowed
> > > > 				for this tx clock source. The 
driver
> > > > 				will select one source from them 
for
> > > > 				each supported sample rate 
according
> > > > 				to the clock rates of these 
provided
> > > > 				clock sources.
> > > 
> > > You mean tx<0-7>
> > 
> > Yes. Thank you.
> > 
> > > Also I would make this option required. Use a dummy clock for mux
> > > inputs that are grounded for a specific SoC.
> > 
> > Some clocks are not from CCM and we haven't defined in imx6q-clk.txt,
> > so in most cases we can't provide a phandle for them, eg: spdif_ext.
> > I think it's a bit hard to force it to be 'required'. An 'optional'
> > looks more flexible to me and a default one is ensured even if it's
> > missing.
> 
> <&clks 0> is the dummy clock. This can be used for all input clocks not
> defined by the SoC.

Where does this assumption come from? Is it documented anywhere? What 
about cases when you have full description of clocks in device tree, with 
one node per clock and #clock-cells = <0>?

Best regards,
Tomasz

