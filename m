Return-Path: <devicetree-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:51317 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753571Ab3HQPAM (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 11:00:12 -0400
Date: Sat, 17 Aug 2013 17:00:02 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130817150002.GU26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com>
 <20130816080124.GE1846@MrMyself>
 <20130816085632.GO26614@pengutronix.de>
 <137675716.iLf1T1CVZo@flatron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <137675716.iLf1T1CVZo@flatron>
Sender: devicetree-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 17, 2013 at 02:26:40PM +0200, Tomasz Figa wrote:
> > You mean tx<0-7>.
> > 
> > Also I would make this option required. Use a dummy clock for mux inputs
> > that are grounded for a specific SoC.
> 
> Why do you need a dummy clock?
> 
> The driver can simply try to grab all the possible clocks and discard 
> those that failed, so you can just keep those grounded clocks unspecified.

We don't need dummy clocks. My motivation saying this that I was afraid
people try to configure the driver by skipping the clocks they don't
want from the devicetree.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
