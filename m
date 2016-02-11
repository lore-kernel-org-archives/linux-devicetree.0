From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/8] arm: Add Artpec-6 SoC
Date: Thu, 11 Feb 2016 15:17:30 +0100
Message-ID: <13460858.PmVpFaRWcp@wuerfel>
References: <cover.1455198819.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455198819.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Thursday 11 February 2016 15:04:34 Lars Persson wrote:
> Basic support for the Axis Artpec-6 ARM SoC. Timers, interrupts, UARTs and
> ethernet are wired up.
> 
> Changes since v1:
> - Corrected bindings for axis,artpec6-pll1-clock.
> - Moved the uart aliases to the board dts.
> - Kconfig cleanup.
> - Added a device tree binding for the dma configuration.
> - Added CONFIG_SYNOPSYS_DWC_ETH_QOS to multi_v7_defconfig.
> - Added binding documentation for axis,artpec6-dev-board.
> 
> Lars Persson (8):
>   clk: add device tree binding for artpec-6 pll1 clock
>   clk: add artpec-6 pll1 clock driver
>   arm: add device-tree SoC bindings for Axis Artpec-6
>   arm: dts: add Artpec-6 SoC dtsi file
>   arm: dts: add Artpec-6 development board dts
>   arm: initial machine port for artpec-6 SoC
>   arm: multi_v7_defconfig: add MACH_ARTPEC6
>   arm: mach-artpec: add entry to MAINTAINERS

Looks good except for the one issue I pointed out in patch 3 (and also 6).
Once that is resolved, please submit the new platform for inclusion by sending
it to arm@kernel.org.

The first two patches should get merged through the drivers/clk maintainer tree,
please submit them separately there.

	Arnd
