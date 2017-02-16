From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: add STM32 LTDC driver
Date: Wed, 15 Feb 2017 21:15:05 -0600
Message-ID: <20170216031505.x7gbqivnv7pvdzei@rob-hp-laptop>
References: <1486740274-25958-1-git-send-email-yannick.fertre@st.com>
 <1486740274-25958-2-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486740274-25958-2-git-send-email-yannick.fertre-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 04:24:28PM +0100, Yannick Fertre wrote:
> Signed-off-by: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.txt  | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> new file mode 100644
> index 0000000..b93e1c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.txt
> @@ -0,0 +1,37 @@
> +* STMicroelectronics STM32 lcd-tft display controller
> +
> +- ltdc: lcd-tft display controller host
> +  must be a sub-node of st-display-subsystem
> +  Required properties:
> +  - compatible: "st,stm32-ltdc"

Kind of generic. There's only one version for all stm32 parts?

> +  - reg: Physical base address of the IP registers and length of memory mapped region.
> +  - clocks: A list of phandle + clock-specifier pairs, one for each
> +    entry in 'clock-names'.
> +  - clock-names: A list of clock names. For ltdc it should contain:
> +      - "clk-lcd" for the clock feeding the output pixel clock & IP clock.
> +  - resets: reset to be used by the device (defined by use of RCC macro).
> +  Required nodes:
> +    - Video port for RGB output.
> +
> +Example:
> +
> +/ {
> +	...
> +	soc {
> +	...
> +		ltdc: stm32-ltdc@40016800 {

display-controller@...

> +			compatible = "st,stm32-ltdc";
> +			reg = <0x40016800 0x200>;
> +			interrupts = <88>, <89>;
> +			resets = <&rcc STM32F4_APB2_RESET(LTDC)>;
> +			clocks = <&rcc 1 CLK_LCD>;
> +			clock-names = "lcd";
> +			status = "disabled";

Don't need to show status in examples.

> +
> +			port {
> +				ltdc_out_rgb: endpoint {
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
