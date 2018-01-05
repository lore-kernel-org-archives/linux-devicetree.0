From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM64: dts: meson-axg: uart: drop legacy compatible
 name from EE UART
Date: Fri, 05 Jan 2018 11:30:28 +0100
Message-ID: <1515148228.5048.25.camel@baylibre.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
         <20180105095621.196472-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105095621.196472-2-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-01-05 at 17:56 +0800, Yixun Lan wrote:
> For the UART controller in EE domain, they require 'pclk' to work.

they ? "the driver" maybe ?

> Current logic of the code will force to go for legacy clock probe
> if it found current compatible string match to 'amlogic,meson-ao-uart'.

did you mean "amlogic,meson-uart" instead ?

Apart from that

Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> 
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index e2b8a9c8bf0b..1c6002b3fe34 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -142,14 +142,14 @@
>  			};
>  
>  			uart_A: serial@24000 {
> -				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
> +				compatible = "amlogic,meson-gx-uart";
>  				reg = <0x0 0x24000 0x0 0x14>;
>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";
>  			};
>  
>  			uart_B: serial@23000 {
> -				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
> +				compatible = "amlogic,meson-gx-uart";
>  				reg = <0x0 0x23000 0x0 0x14>;
>  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>  				status = "disabled";

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
