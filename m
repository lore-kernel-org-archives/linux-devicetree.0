From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] clk: meson: meson8b: register the built-in reset
 controller
Date: Mon, 17 Jul 2017 12:13:29 -0500
Message-ID: <20170717171329.nddlcslge6u33noc@rob-hp-laptop>
References: <20170711224939.26267-1-martin.blumenstingl@googlemail.com>
 <20170711224939.26267-2-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170711224939.26267-2-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org, narmstrong@baylibre.com, jbrunet@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 12, 2017 at 12:49:38AM +0200, Martin Blumenstingl wrote:
> The clock controller has a reset controller embedded. A large part of
> the HHI_SYS_CPU_CLK_CNTL0 register contains reset bits. However, most of
> them are only used by u-boot (as these are probably dangerous to use
> when Linux is running).

u-boot reads DT's. The DT should be defined for the h/w, not what you 
want for Linux today.

> Bits 27:24 are interesting though: these are the CPUx core soft reset
> bits (bit 24 = CPU0 soft reset, bit 25 = CPU1 ...).
> 
> This patch implements a reset controller for these bits. The reset
> controller itself is registered early (through CLK_OF_DECLARE_DRIVER)
> because it is neede very early in the boot process (to start the
> secondary CPU cores).
> 
> Other reset bits in the HHI_SYS_CPU_CLK_CNTL0 register, which are not
> implemented by this patch (as these may never be used from within the
> Linux kernel - and I don't want to add dead code):
> - bit 30: L2 cache soft reset
> - bit 29: AXI64to128 bridge (A5-to-MMC) soft reset (A5 interface)
> - bit 28: SCU soft reset
> - bit 18: A5 Global Reset
> - bit 17: A5 AXI Soft Reset
> - bit 16: A5 APB Soft Reset
> - bit 15: GEN_DIV_SOFT_RESET
> - bit 14: SOFT_RESET
> 
> All information was taken from the public S805 Datasheet and Amlogic's
> vendor GPL kernel sources. This patch is based on an earlier version
> submitted by Carlo Caione.
> 
> Suggested-by: Carlo Caione <carlo@endlessm.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/clock/amlogic,meson8b-clkc.txt        |   7 +-

It's preferred to split bindings to a separate patch. Given all the 
commentary about Linux, I'd suggest you do that here (so the Linux 
details are gone from the binding patch).

>  drivers/clk/meson/Kconfig                          |   1 +
>  drivers/clk/meson/meson8b.c                        | 109 ++++++++++++++++++---
>  drivers/clk/meson/meson8b.h                        |   1 +
>  4 files changed, 105 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> index 606da38c0959..6f444e3867a0 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> @@ -16,18 +16,23 @@ Required Properties:
>  	   mapped region.
>  
>  - #clock-cells: should be 1.
> +- #reset-cells: should be 1.
>  
>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
>  preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
>  used in device tree sources.
>  
> +The clock controller provides a (soft) reset line for each CPU core. Valid
> +reset lines are 0, 1, 2 and 3 (one for each CPU core).

I suspect you would have different numbering if you enumerate all the 
possible resets. Is it just this one register that has reset bits? If 
so, I'd suggest using the bit position as the cell values. If not, well, 
just enumerate them all.

> +
>  Example: Clock controller node:
>  
>  	clkc: clock-controller@c1104000 {
> -		#clock-cells = <1>;
>  		compatible = "amlogic,meson8b-clkc";
>  		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
>  	};
>  
>  
