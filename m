From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: display: Add STM32 DSI host driver
Date: Thu, 18 May 2017 16:42:00 -0500
Message-ID: <20170518214200.e2mmsqpvm3rqnh72@rob-hp-laptop>
References: <1494600989-13507-1-git-send-email-philippe.cornu@st.com>
 <1494600989-13507-3-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494600989-13507-3-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 12, 2017 at 04:56:28PM +0200, Philippe CORNU wrote:
> This patch adds documentation of device tree bindings for the STM32
> DSI host driver based on the Synopsys DW MIPI DSI driver from Rockchip.
> 
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 92 +++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> index 8e14769..a61381b 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> @@ -1,7 +1,6 @@
>  * STMicroelectronics STM32 lcd-tft display controller
>  
>  - ltdc: lcd-tft display controller host
> -  must be a sub-node of st-display-subsystem

Why is this removed? The "must" refers to the location, not whether 
present or not if that's what you were trying to change.

>    Required properties:
>    - compatible: "st,stm32-ltdc"
>    - reg: Physical base address of the IP registers and length of memory mapped region.
> @@ -13,8 +12,25 @@
>    Required nodes:
>      - Video port for RGB output.
>  
> -Example:
> +* STMicroelectronics STM32 specific extensions to Synopsys Designware MIPI DSI
> +(similar to "rockchip/dw_mipi_dsi_rockchip.txt")
>  
> +Required properties:
> +- #address-cells: Should be <1>.
> +- #size-cells: Should be <0>.
> +- compatible: "st,stm32-dsi_host".

Don't use '_' and this needs to be more specific than just "stm32".

> +- reg: Represent the physical address range of the controller.
> +- clocks, clock-names: Phandles to the controller's pll reference
> +  clock(ref) and APB clock(pclk). As described in [1].

Ideally these should be in a common binding (like the driver) as a given 
IP block doesn't have a varying number of clocks (typically).

> +- ports: contain a port node with endpoint definitions as defined in [2].

a single port? Need to be clear how many ports/endpoints and their 
function.

> +- resets: list of phandle + reset specifier pairs, as described in [3].
> +- reset-names: string reset name, must be "apb".
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +[2] Documentation/devicetree/bindings/media/video-interfaces.txt
> +[3] Documentation/devicetree/bindings/reset/reset.txt
> +
> +Example 1: RGB panel
>  / {
>  	...
>  	soc {
> @@ -34,3 +50,75 @@ Example:
>  		};
>  	};
>  };
> +
> +Example 2: DSI panel
> +
> +/ {
> +	...
> +	soc {
> +	...
> +		ltdc: display-controller@40016800 {
> +			compatible = "st,stm32-ltdc";
> +			reg = <0x40016800 0x200>;
> +			interrupts = <88>, <89>;
> +			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
> +			clocks = <&rcc 1 CLK_LCD>;
> +			clock-names = "lcd";
> +
> +			port {
> +				ltdc_out_dsi_host: endpoint {
> +					remote-endpoint = <&dsi_host_in>;
> +				};
> +			};
> +		};
> +
> +
> +		dsi_host: dsi_host@40016C00 {

dsi@...

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "st,stm32-dsi_host";
> +			reg = <0x40016C00 0x800>;
> +			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
> +			clock-names = "ref", "pclk";
> +			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
> +			reset-names = "apb";
> +			status = "okay";

Don't show status in examples.
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_host_in: endpoint {
> +						remote-endpoint = <&ltdc_out_dsi_host>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi_host_out_panel: endpoint {
> +						remote-endpoint = <&dsi_host_in_panel>;
> +					};
> +				};
> +
> +			};
> +
> +			panel-dsi@0 {
> +				reg = <0>; /* dsi virtual channel (0..3) */
> +				compatible = ...;
> +				enable-gpios = ...;
> +				status = "okay";
> +
> +				port {
> +					dsi_host_in_panel: endpoint {
> +						remote-endpoint = <&dsi_host_out_panel>;
> +					};
> +				};
> +
> +			};
> +
> +		};
> +
> +	};
> +};
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
