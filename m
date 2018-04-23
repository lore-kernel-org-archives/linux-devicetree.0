From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Mon, 23 Apr 2018 19:44:27 +0200
Message-ID: <CAFBinCDwbyovMZ-qAKaMiBfz_YKMwxC1c4MjfNyLAvnXEfXtMw@mail.gmail.com>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com> <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@ti.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Apr 19, 2018 at 1:03 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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
looking at the code: this could mean that dwc3-exynos.c can be removed
mid-term (assuming the PHY and regulator handling can be
moved/removed/changed)

does the datasheet state anything about the clock speeds? from
Documentation/devicetree/bindings/usb/dwc3-xilinx.txt:
"bus_clk" Master/Core clock, have to be >= 125 MHz for SS operation
and >= 60MHz for HS operation

> I found only one reset line in the datasheet, hence the reset-names
> property is omitted.
does the datasheet state whether this is a level or a pulsed reset line?
on Amlogic Meson GXL, GXM and AXG SoCs we use a pulsed (and shared)
reset line (see ff0a632f08759e "usb: dwc3: of-simple: add support for
shared and pulsed reset lines") because the reset line is shared
between various components (USB2 PHY, USB3 PHY, dwc3 controller, ...)
your current approach (having a vendor-specific "foo,dwc3" binding
along with the generic "snps,dwc3") would allow having
per-"of_device_id" settings which could indicate whether the reset
lines are level or pulsed reset if these are "implementation specific"

> Supporting those clocks and resets is the requirement for new platforms.
just to confirm:
with this series your goal is to replace the wrapper node which is
needed due to dwc3-of-simple.c ?
would other drivers which currently create a wrapper node (like
dwc3-keystone.c) keep their wrapper node or do you have any plans for
removing it for the other "wrapper" drivers too?

> Enforcing the new binding breaks existing platforms since they specify
> clocks and resets in their glue layer node, but nothing in the core
> node.  I listed such exceptional cases in the DT binding.  The driver
> code is loosened up to accept no clock/reset.  This change is based
> on the discussion [1].
(snip)

Regards
Martin
