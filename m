From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson-axg: add new reset DT node
Date: Fri, 17 Nov 2017 14:08:35 +0100
Message-ID: <04b96767-2412-7242-780c-f3e1e610a62b@baylibre.com>
References: <20171110084659.31641-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171110084659.31641-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/11/2017 09:46, Yixun Lan wrote:
> Add reset DT node for Amlogic's Meson-AXG SoC.
> 
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index e0fb860e12c5..65945c6c8b65 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -123,6 +123,12 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
>  
> +			reset: reset-controller@1004 {
> +				compatible = "amlogic,meson-axg-reset";
> +				reg = <0x0 0x01004 0x0 0x9c>;
> +				#reset-cells = <1>;
> +			};
> +
>  			uart_A: serial@24000 {
>  				compatible = "amlogic,meson-gx-uart", "amlogic,meson-uart";
>  				reg = <0x0 0x24000 0x0 0x14>;
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
