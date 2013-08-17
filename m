Return-Path: <devicetree-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:43404 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753415Ab3HQOxi (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 10:53:38 -0400
Date: Sat, 17 Aug 2013 16:53:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130817145316.GT26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com>
 <20130816095357.GA4694@MrMyself>
 <20130816101151.GQ26614@pengutronix.de>
 <2805432.jMVhHxhr1m@flatron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2805432.jMVhHxhr1m@flatron>
Sender: devicetree-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 17, 2013 at 02:28:04PM +0200, Tomasz Figa wrote:
> > > > Also I would make this option required. Use a dummy clock for mux
> > > > inputs that are grounded for a specific SoC.
> > > 
> > > Some clocks are not from CCM and we haven't defined in imx6q-clk.txt,
> > > so in most cases we can't provide a phandle for them, eg: spdif_ext.
> > > I think it's a bit hard to force it to be 'required'. An 'optional'
> > > looks more flexible to me and a default one is ensured even if it's
> > > missing.
> > 
> > <&clks 0> is the dummy clock. This can be used for all input clocks not
> > defined by the SoC.
> 
> Where does this assumption come from? Is it documented anywhere?

This is how all i.MX clock bindings currently are. See
Documentation/devicetree/bindings/clock/imx*-clock.txt

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
