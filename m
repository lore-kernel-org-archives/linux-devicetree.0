Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Sep 2018 13:24:23 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add R7S9210 support
Message-ID: <20180910182423.GA18862@bogus>
References: <20180907165849.106182-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180907165849.106182-1-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 07, 2018 at 11:58:49AM -0500, Chris Brandt wrote:
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.
> 
> The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> for how the registers are laid out.
> The MSTP registers are only 8-bits wide, there is no status registers
> (MSTPSR), and the register offsets are a little different. Since the RZ/A
> hardware manuals refer to these registers as the Standby Control Registers,
> we'll use that name to distinguish the RZ/A type from the R-Car type.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v4:
>  * Preserved sort order of SoC listings
>  * Removed R7S9210_CLK_PLL from dt-binding since it's an internal clock
>  * ratio_tab is now a struct making it look a little nicer
>  * Removed CLK_I,...CLK_P0 because they are already defined in dt-bindings
>  * Sorted mod_clks by ascending MSTP number
>  * Removed cast from clk_get_rate(parent)
>  * Corrected register index of stbcr[1]
>  * Don't use MOD_CLK_PACK_10 for non priv->stbyctrl devices (bug fix)
> v3:
>  * Use actual register bit names and numbers from manual for both DT and
>    tables ("36" instead of "306")
>  * Do not register reset controller for stbyctrl (RZ/A) SoCs
>  * Changed SPDX from "GPL-2.0+" to "GPL-2.0"
> v2:
>  * num_hw_mod_clks was wrong
>  * added ethernet clocks
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   5 +-
>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/r7s9210-cpg-mssr.c             | 189 +++++++++++++++++++++
>  drivers/clk/renesas/renesas-cpg-mssr.c             |  81 +++++++--
>  drivers/clk/renesas/renesas-cpg-mssr.h             |  13 ++
>  include/dt-bindings/clock/r7s9210-cpg-mssr.h       |  20 +++

For DT bits,

Acked-by: Rob Herring <robh@kernel.org>

>  7 files changed, 300 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/clk/renesas/r7s9210-cpg-mssr.c
>  create mode 100644 include/dt-bindings/clock/r7s9210-cpg-mssr.h
