Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:51375 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516Ab3HQPRX (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 11:17:23 -0400
Received: by mail-bk0-f50.google.com with SMTP id mz11so943447bkb.37
        for <devicetree@vger.kernel.org>; Sat, 17 Aug 2013 08:17:22 -0700 (PDT)
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Date: Sat, 17 Aug 2013 17:17:18 +0200
Message-ID: <8770601.066pCcRnTh@flatron>
In-Reply-To: <20130817145316.GT26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com> <2805432.jMVhHxhr1m@flatron> <20130817145316.GT26614@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com, mturquette@linaro.org
List-ID: <devicetree@vger.kernel.org>

On Saturday 17 of August 2013 16:53:16 Sascha Hauer wrote:
> On Sat, Aug 17, 2013 at 02:28:04PM +0200, Tomasz Figa wrote:
> > > > > Also I would make this option required. Use a dummy clock for
> > > > > mux
> > > > > inputs that are grounded for a specific SoC.
> > > > 
> > > > Some clocks are not from CCM and we haven't defined in
> > > > imx6q-clk.txt,
> > > > so in most cases we can't provide a phandle for them, eg:
> > > > spdif_ext.
> > > > I think it's a bit hard to force it to be 'required'. An
> > > > 'optional'
> > > > looks more flexible to me and a default one is ensured even if
> > > > it's
> > > > missing.
> > > 
> > > <&clks 0> is the dummy clock. This can be used for all input clocks
> > > not
> > > defined by the SoC.
> > 
> > Where does this assumption come from? Is it documented anywhere?
> 
> This is how all i.MX clock bindings currently are. See
> Documentation/devicetree/bindings/clock/imx*-clock.txt

OK, thanks.

I guess we need some discussion on dummy clocks vs skipped clocks. I think 
we want some consistency on this, don't we?

If we really need a dummy clock, then we might also want a generic way to 
specify it.

Best regards,
Tomasz

