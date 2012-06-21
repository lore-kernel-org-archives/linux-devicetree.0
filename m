From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Thu, 21 Jun 2012 21:03:29 +0000
Message-ID: <201206212103.29517.arnd@arndb.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <201206211717.46142.arnd@arndb.de> <4FE35A78.60003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FE35A78.60003@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 21 June 2012, Stephen Warren wrote:
> > It should never be necessary to add board-specific properties in the
> > nodes that describe the SoC specific bits. What I was referring to
> > is just moving the data that currently resides in the regulator
> > driver into DT.
> 
> I guess I must be misunderstanding that comment - there are many many
> examples of boards adding properties to nodes that describe the SoC. For
> example, the GPIOs used by SDHCI controllers, board-specific max clock
> rates for SDHCI or I2C controllers, pinmux configuration properties, to
> name just a few.

The difference is that configuration is board specific, but capabilities
of the hardware are soc specific. The regulator-compatible property
identifies just the capabilities and the location of one regulator:

Look at struct ab8500_regulator_info, everything in there describes
the soc: min/max voltages, register banks, startup delay. Those are
all things that we could in theory have in the .dtsi file describing
the soc.

The board specific settings on the other hand are about what to
put into those registers and what voltage to use. From all I can
tell, those settings belong into the node that actually uses the
regulator, not the node that defines it.

	Arnd
