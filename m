From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 13/18] arm64: dts: meson-gxbb-nexbox-a95x: Fix node
 order
Date: Mon, 15 May 2017 10:17:08 +0200
Message-ID: <22302468-9c71-18f2-0e2f-1ab7764a8e91@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-14-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170513143337.14278-14-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> Sort nodes referenced by label alphabetically.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  v1 -> v2:
>  * Rebased (new nodes added)
>  
>  .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 52 +++++++++++-----------
>  1 file changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> index 87198eafb04b..a1078b3e1c76 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> @@ -165,10 +165,10 @@
>  	};
>  };
>  
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_ao_a_pins>;
> -	pinctrl-names = "default";
> +&cvbs_vdac_port {
> +	cvbs_vdac_out: endpoint {
> +		remote-endpoint = <&cvbs_connector_in>;
> +	};
>  };
>  
>  &ethmac {
> @@ -195,12 +195,32 @@
>  	};
>  };
>  
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
>  &ir {
>  	status = "okay";
>  	pinctrl-0 = <&remote_input_ao_pins>;
>  	pinctrl-names = "default";
>  };
>  
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&clkc CLKID_FCLK_DIV4>;
> +	clock-names = "clkin0";
> +};
> +
>  /* Wireless SDIO Module */
>  &sd_emmc_a {
>  	status = "okay";
> @@ -260,28 +280,8 @@
>  	vqmmc-supply = <&vddio_boot>;
>  };
>  
> -&pwm_ef {
> -	status = "okay";
> -	pinctrl-0 = <&pwm_e_pins>;
> -	pinctrl-names = "default";
> -	clocks = <&clkc CLKID_FCLK_DIV4>;
> -	clock-names = "clkin0";
> -};
> -
> -&cvbs_vdac_port {
> -	cvbs_vdac_out: endpoint {
> -		remote-endpoint = <&cvbs_connector_in>;
> -	};
> -};
> -
> -&hdmi_tx {
> +&uart_AO {
>  	status = "okay";
> -	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> +	pinctrl-0 = <&uart_ao_a_pins>;
>  	pinctrl-names = "default";
>  };
> -
> -&hdmi_tx_tmds_port {
> -	hdmi_tx_tmds_out: endpoint {
> -		remote-endpoint = <&hdmi_connector_in>;
> -	};
> -};
> 

Hi Andreas,

Like a previous attempt, I'm not OK with such rework since it will break bisect and add complexity for new patches handling.

The order is not alphabetically ordered, live with it.

Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
