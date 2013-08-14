Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db9lp0250.outbound.messaging.microsoft.com ([213.199.154.250]:20861
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759502Ab3HNI4i (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 04:56:38 -0400
Date: Wed, 14 Aug 2013 16:48:02 +0800
From: Nicolin Chen <b42378@freescale.com>
Subject: Re: [PATCH v4 resent 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Message-ID: <20130814084801.GH31651@MrMyself>
References: <cover.1376309076.git.b42378@freescale.com>
 <51808310dd97d2a35a28766ed7309f269521cafd.1376309076.git.b42378@freescale.com>
 <20130814075017.GE2324@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20130814075017.GE2324@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com
List-ID: <devicetree@vger.kernel.org>

Hi Sascha,

On Wed, Aug 14, 2013 at 09:50:17AM +0200, Sascha Hauer wrote:
> > +  - tx-clksrc-names : The names for all available clock sources for tx, which
> > +  is also being listed in SoC reference manual, ClkSrc_Sel bit of SPDIF_SRPC.
> > +  And the name list would be different between different SoC. Use 'null' for
> > +  those unlisted names, and the max number of tx-clksrc-names should be 8.
> > +
> > +  - rx-clksrc-names : The names for all available clock sources for rx, which
> > +  is also being listed in SoC reference manual, TxClk_Source bit of SPDIF_STC.
> > +  And the name list would be different between different SoC. Use 'null' for
> > +  those unlisted names, and the max number of rx-clksrc-names should be 16.
> > +
> > +Optional properties:
> > +
> > +  - rx-clksrc-lock: This is a boolean property. If present, ClkSrc_Sel bit
> > +  of SPDIF_SRPC would be set a clock source that cares DPLL locked condition.
> > +
> > +Example1:
> > +
> > +spdif: spdif@02004000 {
> > +	clocks = <&clks 197>;
> > +	clock-names = "core";
> > +	rx-clksrc-lock;
> > +	rx-clksrc-names =
> > +		"lock.ext", "lock.spdif", "lock.asrc",
> > +		"lock.spdif_ext", "lock.esai", "ext",
> > +		"spdif", "asrc", "spdif_ext", "esai",
> > +		"lock.mlb", "lock.mlb_phy", "mlb",
> > +		"mlb_phy";
> > +	tx-clksrc-names =
> > +		"xtal", "spdif", "asrc", "spdif_ext",
> > +		"esai", "ipg", "mlb", "mlb_phy";
> 
> I had a hard time understanding what you are doing here.
> 
> With this the clk names in arch/arm/mach-imx/clk-imx6q.c become an API
> between the Kernel and the devicetree. Don't do that.
> 
> There is a standardized devicetree binding for clocks. Use it.
 
I think I should first explain to you what this part is doing:
The driver needs to set Clk_source bit for TX/RX to select the 
clock from a clock mux. The names listed above are those of the 
clocks connecting to the mux, while they are not only internal 
clocks which're included in clk-imx6q.c but also external ones,
an on-board external osc for example.

The driver does get the clock by using the standard DT binding,
see the 'clocks = <&clks 197>' above, and then compare this
obtained clock->name with the name list to decide which value
should be set to the Clk_source bit.

==================================================================
ClkSrc_Sel from i.MX6Q reference manual:

Clock source selection, all other settings not shown are reserved:
0000 if (DPLL Locked) SPDIF_RxClk else extal
0001 if (DPLL Locked) SPDIF_RxClk else spdif_clk
0010 if (DPLL Locked) SPDIF_RxClk else asrc_clk
0011 if (DPLL Locked) SPDIF_RxClk else spdif_extclk
0100 if (DPLL Locked) SPDIF_Rxclk else esai_hckt
0101 extal_clk
0110 spdif_clk
0111 asrc_clk
1000 spdif_extclk
1001 esai_hckt
1010 if (DPLL Locked) SPDIF_RxClk else mlb_clk
==================================================================

So the name list here basically is not being used to obtain a
clock like what standardized DT binding does but to provide the
driver a full list to look up which value should be exactly used
according to the obtained clock.

I think I should revise the binding doc for these two lists. It 
might be hard to explain within that kinda short paragraph. 

Surely, if I misunderstand your point, please correct me. And
if you have any sage idea, please guide me.

Thank you,
Nicolin Chen



