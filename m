From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 11/14] DEVICETREE: Add bindings for PIC32 SDHCI host
 controller
Date: Tue, 15 Dec 2015 14:00:00 -0600
Message-ID: <20151215200000.GA26180@rob-hp-laptop>
References: <1450133093-7053-1-git-send-email-joshua.henderson@microchip.com>
 <1450133093-7053-12-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450133093-7053-12-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 03:42:13PM -0700, Joshua Henderson wrote:
> From: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> 
> Document the devicetree bindings for the SDHCI peripheral found on
> Microchip PIC32 class devices.
> 
> Signed-off-by: Andrei Pistirica <andrei.pistirica-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../bindings/mmc/microchip,sdhci-pic32.txt         |   29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
> 
> diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
> new file mode 100644
> index 0000000..71ad57e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
> @@ -0,0 +1,29 @@
> +* Microchip PIC32 SDHCI Controller
> +
> +This file documents differences between the core properties in mmc.txt
> +and the properties used by the sdhci-pic32 driver.
> +
> +Required properties:
> +- compatible: Should be "microchip,pic32mzda-sdhci"
> +- interrupts: Should contain interrupt
> +- clock-names: Should be "base_clk", "sys_clk".
> +               See: Documentation/devicetree/bindings/resource-names.txt
> +- clocks: Phandle to the clock.
> +          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- pinctrl-names: A pinctrl state names "default" must be defined.
> +- pinctrl-0: Phandle referencing pin configuration of the SDHCI controller.
> +             See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
> +
> +Example:
> +
> +	sdhci@1f8ec000 {
> +		compatible = "microchip,pic32mzda-sdhci";
> +		reg = <0x1f8ec000 0x100>;
> +		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&REFCLKO4>, <&PBCLK5>;
> +		clock-names = "base_clk", "sys_clk";
> +		bus-width = <4>;
> +		cap-sd-highspeed;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sdhc1>;
> +	};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
