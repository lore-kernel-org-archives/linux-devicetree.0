From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: display: add STM32 LTDC driver
Date: Thu, 19 Jan 2017 10:29:40 -0600
Message-ID: <20170119162940.jh762nuhrbtqkboo@rob-hp-laptop>
References: <1484573344-11609-1-git-send-email-yannick.fertre@st.com>
 <1484573344-11609-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484573344-11609-2-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 16, 2017 at 02:28:58PM +0100, Yannick Fertre wrote:
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>

Changelog?

> ---
>  .../devicetree/bindings/display/st,ltdc.txt        | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,ltdc.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/st,ltdc.txt b/Documentation/devicetree/bindings/display/st,ltdc.txt
> new file mode 100644
> index 0000000..20e89da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,ltdc.txt
> @@ -0,0 +1,57 @@
> +* STMicroelectronics STM32 lcd-tft display controller
> +
> +- st-display-subsystem: Master device for DRM sub-components
> +  This device must be the parent of all the sub-components and is responsible
> +  of bind them.
> +  Required properties:
> +  - compatible: "st,display-subsystem"
> +  - ranges: to allow probing of subdevices

You have a single sub device. There is no need for this node.


> +- ltdc_host: lcd-tft display controller host
> +  must be a sub-node of st-display-subsystem
> +  Required properties:
> +  - compatible: "st,ltdc"

Too generic. Needs to be SoC specific.

> +  - reg: Physical base address of the IP registers and length of memory mapped region.
> +  - clocks: from common clock binding: handle hardware IP needed clocks, the
> +    number of clocks may depend of the SoC type.

No. You must be explicit on how many clocks and their order.

> +    See ../clocks/clock-bindings.txt for details.
> +  - clock-names: names of the clocks listed in clocks property in the same
> +    order.
> +  - resets: resets to be used by the device

ditto.

> +    See ../reset/reset.txt for details.
> +  - reset-names: names of the resets listed in resets property in the same
> +    order.

You are missing this in the example. However, for a single entry, -names 
is pointless.

> +  Required nodes:
> +    - Video port for RGB output.
> +
> +Example:
> +
> +/ {
> +	...
> +	soc {
> +	...
> +		st-display-subsystem {
> +			compatible = "st,display-subsystem";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			dma-ranges;
> +
> +			ltdc_host: stm32-ltdc@40016800 {
> +				compatible = "st,ltdc";
> +				reg = <0x40016800 0x200>;
> +				interrupts = <88>, <89>;
> +				resets = <&rcc 314>;
> +				clocks = <&rcc 1 8>;
> +				clock-names = "clk-lcd";

The 'clk-' part is redundant.

> +				status = "disabled";
> +
> +				port {
> +					ltdc_out_rgb: endpoint {
> +					};
> +				};
> +			};
> +		};
> +	...
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
