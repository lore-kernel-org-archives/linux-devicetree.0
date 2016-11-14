From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Documentation: dt: reset: Add TI SCI reset binding
Date: Mon, 14 Nov 2016 09:52:22 -0600
Message-ID: <20161114155222.l3l6kb5qttlmuzfa@rob-hp-laptop>
References: <20161104174240.9688-1-afd@ti.com>
 <20161104174240.9688-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161104174240.9688-2-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2016 at 12:42:39PM -0500, Andrew F. Davis wrote:
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
>  .../devicetree/bindings/reset/ti,sci-reset.txt     | 65 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/reset/k2g.h                    | 22 ++++++++
>  3 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/ti,sci-reset.txt
>  create mode 100644 include/dt-bindings/reset/k2g.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/ti,sci-reset.txt b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> new file mode 100644
> index 0000000..cb00679
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/ti,sci-reset.txt
> @@ -0,0 +1,65 @@
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

Needs to say must be a child of the SCI node somewhere in here.

> +
> +Required properties:
> +--------------------
> + - compatible	: Should be "ti,sci-reset"
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
> +Example:
> +--------
> +The following example demonstrates both a TI-SCI reset controller node and a
> +consumer (a DSP device) on the K2G SoC.
> +
> +#include <dt-bindings/genpd/k2g.h>
> +#include <dt-bindings/reset/k2g.h>
> +
> +pmmc: pmmc {
> +	compatible = "ti,k2g-sci";
> +
> +	k2g_reset: k2g_reset {

...: reset-controller {

> +		compatible = "ti,sci-reset";
> +		#reset-cells = <2>;
> +	};
> +};
> +
> +dsp0: dsp0 {
> +	...
> +	resets = <&k2g_reset K2G_DEV_CGEM0 K2G_DEV_CGEM0_DSP0_RESET>;
> +	...
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
