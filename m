From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: reset: Add TI SCI reset binding
Date: Thu, 27 Oct 2016 12:07:13 -0500
Message-ID: <7a7907f6-e3bf-471b-cb56-1ff0d39802fb@ti.com>
References: <20161026193938.25093-1-afd@ti.com>
 <20161026193938.25093-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026193938.25093-2-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 10/26/2016 02:39 PM, Andrew F. Davis wrote:
> Add TI SCI reset controller binding. This describes the DT binding
> details for a reset controller node providing reset management services
> to hardware blocks (reset consumers) using the Texas Instrument's System
> Control Interface (TI SCI) protocol to communicate to a system controller
> block present on the SoC.
> 
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> [s-anna-l0cyMroinI0@public.gmane.org: revise the binding format]
> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/reset/ti,sci-reset.txt     | 68 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti,sci-reset.txt b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> new file mode 100644
> index 0000000..189e284
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> @@ -0,0 +1,68 @@
> +Texas Instruments System Control Interface (TI-SCI) Reset Controller
> +=====================================================================
> +
> +Some TI SoCs contain a system controller (like the Power Management Micro
> +Controller (PMMC) on Keystone K2G SoC) that are responsible for controlling
> +the state of the various hardware modules present on the SoC. Communication
> +between the host processor running an OS and the system controller happens
> +through a protocol called TI System Control Interface (TI-SCI protocol).
> +For TI SCI details, please refer to the document,
> +Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
> +
> +TI-SCI Reset Controller Node
> +============================
> +This reset controller node uses the TI SCI protocol to perform the reset
> +management of various hardware modules present on the SoC.
> +
> +Required properties:
> +--------------------
> + - compatible	: Should be "ti,sci-reset"
> + - ti,sci	: phandle to the TI SCI device to use for managing resets

This does not look correct. Looks like you may have posted an older
series. We should not be needing the ti,sci property anymore and this
node should be a child node of the pmmc. Look at Tero's ti-sci clock series.

> + - #reset-cells	: Should be 2. Please see the reset consumer node below for
> +		  usage details.
> +
> +TI-SCI Reset Consumer Nodes
> +===========================
> +Each of the reset consumer nodes should have the following properties,
> +in addition to their own properties.
> +
> +Required properties:
> +--------------------
> + - resets	: A phandle and reset specifier pair, one pair for each reset
> +		  signal that affects the device, or that the device manages.
> +		  The phandle should point to the TI-SCI reset controller node,
> +		  and the reset specifier should have 2 cell-values. The first
> +		  cell should contain the device ID, the values of which are
> +		  specified in the <dt-bindings/genpd/<soc>.h> include file.
> +		  The second cell should contain the reset mask value used by
> +		  system controller, the values of which are specified in the
> +		  include file <dt-bindings/reset/<soc>.h>, where <soc> is the
> +		  name of the SoC involved, for example 'k2g'.
> +
> +Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
> +common reset controller usage by consumers.
> +
> +
> +Example:
> +--------
> +The following example demonstrates both a TI-SCI reset controller node and a
> +consumer (a DSP device) on the K2G SoC.
> +
> +#include <dt-bindings/genpd/k2g.h>
> +#include <dt-bindings/reset/k2g.h>
> +
> +/ {
> +	soc {
> +		k2g_reset: k2g_reset {
> +			compatible = "ti,sci-reset";
> +			ti,sci = <&pmmc>;
> +			#reset-cells = <2>;
> +		};

This example is also wrong. Please update it to represent this node as a
child node of the pmmc.

regards
Suman

> +
> +		dsp0: dsp0 {
> +			...
> +			resets = <&k2g_reset K2G_DEV_CGEM0 K2G_DEV_CGEM0_DSP0_RESET>;
> +			...
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e93976..d8068df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11899,6 +11899,7 @@ F:	drivers/soc/ti/ti_sci_pm_domains.c
>  F:	Documentation/devicetree/bindings/clock/ti,sci-clk.txt
>  F:	include/dt-bindings/clock/k2g.h
>  F:	drivers/clk/keystone/sci-clk.c
> +F:	Documentation/devicetree/bindings/reset/ti,sci-reset.txt
>  
>  THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
>  M:	Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
