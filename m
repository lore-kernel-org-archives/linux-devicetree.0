From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: dts: da850: add usb device node
Date: Sun, 20 Nov 2016 20:42:29 -0600
Message-ID: <48d0c158-f7c8-0d1e-f06e-b7b28d6f2b93@lechnology.com>
References: <20161107203948.28324-1-ahaslam@baylibre.com>
 <20161107203948.28324-11-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161107203948.28324-11-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/07/2016 02:39 PM, Axel Haslam wrote:
> This adds the ohci device node for the da850 soc.
> It also enables it for the omapl138 hawk board.
>
> Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850-lcdk.dts | 8 ++++++++
>  arch/arm/boot/dts/da850.dtsi     | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
> index 7b8ab21..aaf533e 100644
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
> +&ohci {
> +	status = "okay";
> +};
> +
>  &serial2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&serial2_rxtx_pins>;
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 2534aab..50e86da 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -405,6 +405,14 @@
>  					>;
>  			status = "disabled";
>  		};
> +		ohci: usb@0225000 {

In commit 2957e36e76c836b167e5e0c1edb578d8a9bd7af6 in the linux-davinci 
tree, the alias for the musb device is usb0. So, I think we should use 
usb1 here instead of ohci - or change the usb0 alias to musb.

https://git.kernel.org/cgit/linux/kernel/git/nsekhar/linux-davinci.git/commit/?h=v4.10/dt&id=2957e36e76c836b167e5e0c1edb578d8a9bd7af6

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
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
