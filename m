From: Priit Laes <plaes@plaes.org>
Subject: Re: [linux-sunxi] [PATCH 0/8] This is a second edition of a series
 that implements voltage
Date: Tue, 11 Dec 2018 07:11:37 +0000
Message-ID: <20181211071137.k3rqwctnibg6tyc2@plaes.org>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olliver Schinagl <oliver@schinagl.nl>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 08:42:11PM +0200, Priit Laes wrote:
> ramping for AXP209 DCDC2 and LDO3 regulators and software
> based soft-start for AXP209 LDO3 regulator.

Ugh.. managed to botch this series. I'll send a fixed one
today.

> 
> Both features are needed to work around a PMIC shutdown when
> toggling LDO3 on certain boards with high capacitance on the
> LDO3 output.
> 
> Similar features (or workarounds) have been also implemented
> on u-boot side [1].
> 
> Changes since v1:
> - Rebased on top of next and dropped already merged patches.
> - Dropped LDO4 full range devicetree change for Lime2 (prev patch 9)
>   in favor of general pin-bank regulator dependency [2].
> - Fixed paths in devicetree bindings (patch 3)
> - Added note about software based soft-start for LDO3 (patch 5)
> 
> [1] https://lists.denx.de/pipermail/u-boot/2018-November/348612.html
> [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-December/618459.html
> 
> Olliver Schinagl (8):
>   mfd: axp20x: name voltage ramping define properly
>   regulator: axp20x: add support for set_ramp_delay for AXP209
>   dt-bindings: mfd: axp20x: add support for regulator-ramp-delay for AXP209
>   regulator: axp20x: add software based soft_start for AXP209 LDO3
>   dt-bindings: mfd: axp20x: Add software based soft_start for AXP209 LDO3
>   regulator: dts: enable soft-start and ramp delay for the OLinuXino Lime2
>   mfd: axp20x: Clean up included headers
>   mfd: axp20x: use explicit bit defines
> 
>  Documentation/devicetree/bindings/mfd/axp20x.txt |   9 +-
>  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts  |   2 +-
>  drivers/mfd/axp20x.c                             |  13 +-
>  drivers/regulator/axp20x-regulator.c             | 142 +++++++++++++++-
>  include/linux/mfd/axp20x.h                       |   4 +-
>  5 files changed, 161 insertions(+), 9 deletions(-)
> 
> base-commit: 14cf8c1d5b90a0cf6a8ba51ef59db8da8c7a2622
> -- 
> git-series 0.9.1
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
