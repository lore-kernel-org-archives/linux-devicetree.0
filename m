From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Wed, 25 Apr 2018 10:21:14 -0500
Message-ID: <20180425152114.pzklc5uqva3nil5v@rob-hp-laptop>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com>
 <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 19, 2018 at 08:03:38PM +0900, Masahiro Yamada wrote:
> Historically, the clocks and resets are handled on the glue layer
> side instead of the DWC3 core.  For simple cases, dwc3-of-simple.c
> takes care of arbitrary number of clocks and resets.  The DT node
> structure typically looks like as follows:
> 
>   dwc3-glue {
>           compatible = "foo,dwc3";
>           clocks = ...;
>           resets = ...;
>           ...
> 
>           dwc3 {
>                   compatible = "snps,dwc3";
>                   ...
>           };
>   }
> 
> By supporting the clocks and the reset in the dwc3/core.c, it will
> be turned into a single node:
> 
>   dwc3 {
>           compatible = "foo,dwc3", "snps,dwc3";
>           clocks = ...;
>           resets = ...;
>           ...
>   }
> 
> This commit adds the binding of clocks and resets specific to this IP.
> The number of clocks should generally be the same across SoCs, it is
> just some SoCs either tie clocks together or do not provide software
> control of some of the clocks.
> 
> I took the clock names from the Synopsys datasheet: "ref" (ref_clk),
> "bus_early" (bus_clk_early), and "suspend" (suspend_clk).
> 
> I found only one reset line in the datasheet, hence the reset-names
> property is omitted.
> 
> Supporting those clocks and resets is the requirement for new platforms.
> Enforcing the new binding breaks existing platforms since they specify
> clocks and resets in their glue layer node, but nothing in the core
> node.  I listed such exceptional cases in the DT binding.  The driver
> code is loosened up to accept no clock/reset.  This change is based
> on the discussion [1].
> 
> I inserted reset_control_deassert() and clk_bulk_enable() before the
> first register access, i.e. dwc3_cache_hwparams().
> 
> [1] https://patchwork.kernel.org/patch/10284265/
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - Make clocks specific to this IP based on Synopsys datasheet
>   - Use clk_bulk API
>   - Add description to struct header
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 21 ++++++
>  drivers/usb/dwc3/core.c                        | 89 +++++++++++++++++++++++++-
>  drivers/usb/dwc3/core.h                        |  8 +++
>  3 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 0dbd308..feb1cc33 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -7,6 +7,27 @@ Required properties:
>   - compatible: must be "snps,dwc3"
>   - reg : Address and length of the register set for the device
>   - interrupts: Interrupts used by the dwc3 controller.
> + - clock-names: should contain "ref", "bus_early", "suspend"
> + - clocks: list of phandle and clock specifier pairs corresponding to
> +           entries in the clock-names property.
> + - resets: a single pair of phandle and reset specifier

This should be optional as some SoCs don't have separate, s/w controlled 
resets of modules.

Otherise, for the DT binding:

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
