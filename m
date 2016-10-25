From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH/RFT v2 17/17] ARM: dts: da850: add usb device node
Date: Mon, 24 Oct 2016 19:48:08 -0500
Message-ID: <59ca6a1f-6db9-eed2-8e8a-77657c7febac@lechnology.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-18-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024164634.4330-18-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/24/2016 11:46 AM, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> This adds the usb (ohci) device node for the da850 soc.
> Also it enables it for the lcdk board
>
> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850-lcdk.dts | 8 ++++++++
>  arch/arm/boot/dts/da850.dtsi     | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
> index 7b8ab21..fa91339 100644
> --- a/arch/arm/boot/dts/da850-lcdk.dts
> +++ b/arch/arm/boot/dts/da850-lcdk.dts
> @@ -86,6 +86,14 @@
>  	};
>  };
>
> +&usb_phy {
> +	status = "okay";
> +};
> +
> +&usb {
> +	status = "okay";

Don't you need to specify a regulator here using the vbus-supply property?

> +};
> +
>  &serial2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&serial2_rxtx_pins>;
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 33fcdce..ec2cec3 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -381,6 +381,14 @@
>  			#phy-cells = <1>;
>  			status = "disabled";
>  		};
> +		usb: usb@0225000 {

Don't need the leading 0 on usb@225000

The alias (usb:) might need to be more specific since there is a second 
usb device that will be added later for musb. (The comments in the 
previous review only referred to the "usb" in "usb@", not the alias.)

> +			compatible = "ti,da830-ohci";
> +			reg = <0x225000 0x1000>;
> +			interrupts = <59>;
> +			phys = <&usb_phy 1>;
> +			phy-names = "usb-phy";
> +			status = "disabled";
> +		};
>  		gpio: gpio@226000 {
>  			compatible = "ti,dm6441-gpio";
>  			gpio-controller;
>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
