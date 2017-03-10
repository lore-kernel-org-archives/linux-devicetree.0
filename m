From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: add Gateworks Ventana GW5904 support
Date: Fri, 10 Mar 2017 12:43:43 -0800
Message-ID: <04584d61-f1e2-3722-1f13-ff133edc0c22@gmail.com>
References: <1489178411-6559-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489178411-6559-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/10/2017 12:40 PM, Tim Harvey wrote:
> The Gateworks Ventana GW5904 is a single-board computer based on the NXP
> IMX6 SoC with the following features:
>  * IMX6 DualLite Soc (supports IMX6S,IMX6DL,IMX6Q)
>  * 2048MB DDR3 DRAM (4x64bit) (options up to 4GiB)
>  * 8GB eMMC
>  * Gateworks System Controller:
>   - hardware watchdog
>   - hardware monitor
>   - pushbutton controller
>   - EEPROM storage
>   - power control
>  * JTAG programmable
>  * 1x miniPCIe socket (with PCIe, USB)
>  * 1x miniPCIe socket (USB)
>  * 1x M.2 socket (USB, 2x SIM)
>  * Inertial Module (LSM9DS1 9DOF: 3x acc, 3x rate, 3x mag)
>  * GPS (optional uBlox EVA-M8M)
>  * Application headers:
>   - 2x RS232 UART (TX/RX/CTS/RTS)
>   - 8x TTL GPIO (3x configurable as PWM)
>   - 1x LVDS display 3D+C with i2c touch and PWM backlight
>  * MV88E6176 GbE Switch (uplink to IMX FEC)
>  * Front panel connectors:
>   - 1x user programmable LED
>   - 1x configurable user pushbutton
>   - 1x USB OTG
>   - 4x GbE LAN
> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---

> +	dsa {
> +		compatible = "marvell,dsa";
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		dsa,ethernet = <&fec>;
> +		dsa,mii-bus = <&mdio>;
> +

Please consider using the new binding for DSA switches, see:

https://patchwork.kernel.org/patch/9493037/

> +		switch@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0 0>; /* MDIO address 0, switch 0 in tree */
> +
> +			port@0 {
> +				reg = <0>;
> +				label = "lan4";
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				label = "lan3";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				label = "lan2";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				label = "lan1";
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				label = "cpu";
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +				};
> +			};
> +		};
> +	};
> +};
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
