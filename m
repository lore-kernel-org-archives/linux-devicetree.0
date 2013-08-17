Return-Path: <devicetree-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52654 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753576Ab3HQPOZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 11:14:25 -0400
Date: Sat, 17 Aug 2013 17:14:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130817151409.GW26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com>
 <2188999.03O3zirCAO@flatron>
 <20130816044330.GD1846@MrMyself>
 <2362958.X2QCBUPAyI@flatron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2362958.X2QCBUPAyI@flatron>
Sender: devicetree-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 17, 2013 at 02:56:11PM +0200, Tomasz Figa wrote:
> Hi Nicolin,
> > First, you are right that all the properties you just commented are
> > software configurations. And I got the point that device tree now
> > can't allow any software configuration even if the actual hardware
> > connection will depend on it.
> > 
> > If so, I would like to remove those abused clocks and also drop the
> > unused clocks in src<0-7>, then just remain those needed clocks src.
> > I think that can be plausible because there'll be no more clock abuse
> > and the driver will be able to get the source index from the name
> > 'src<num>'.
> 
> OK.
> 
> > And you are right about the 9 clock inputs, just there're not only 9
> > inputs but also an extra external clock from S/PDIF transmitter via
> > coaxial cable or optical fiber -- RxCLK. Please check the following
> > list:
> > 
> > 0000 if (DPLL Locked) SPDIF_RxClk else extal
> > 0001 if (DPLL Locked) SPDIF_RxClk else spdif_clk
> > 0010 if (DPLL Locked) SPDIF_RxClk else asrc_clk
> > 0011 if (DPLL Locked) SPDIF_RxClk else spdif_extclk
> > 0100 if (DPLL Locked) SPDIF_Rxclk else esai_hckt
> > 0101 extal_clk
> > 0110 spdif_clk
> > 0111 asrc_clk
> > 1000 spdif_extclk
> > 1001 esai_hckt
> > 1010 if (DPLL Locked) SPDIF_RxClk else mlb_clk
> > 1011 if (DPLL Locked) SPDIF_RxClk else mlb_phy_clk
> > 1100 mkb_clk
> > 1101 mlb_phy_clk
> 
> Could you explain what the above values are? If they are values written to 
> a 4-bit mux that selects RX clock source, then all the 16 clocks should be 
> specified from device tree, even if they are duplicated.

The S/PDIF core can recover the clock for the tx signal from the rx
signal. So if you have an S/PDIF input signal, then the DPLL will be
locked and the SPDIF_RxClk can be used for tx. So the above are really 8
clocks and one "If DPLL locked, use it" bit.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
