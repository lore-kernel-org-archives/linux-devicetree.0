From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv1 3/6] ARM: dts: imx6q-bx50v3: Add internal switch
Date: Wed, 3 Jan 2018 17:48:42 +0300
Message-ID: <5c87f610-4927-faca-40a7-3f83e7f00ff7@cogentembedded.com>
References: <20180103122609.5482-1-sebastian.reichel@collabora.co.uk>
 <20180103122609.5482-4-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180103122609.5482-4-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello!

On 01/03/2018 03:26 PM, Sebastian Reichel wrote:

> B850v3, B650v3 and B450v3 all have a GPIO bit banged MDIO bus to
> communicate with a Marvell switch. On all devices the switch is
> connected to a PCI based network card, which needs to be referenced
> by DT, so this also adds the common PCI root node.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/imx6q-bx50v3.dtsi | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> index b915837bbb5f..689981e90e68 100644
> --- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> +++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
> @@ -92,6 +92,31 @@
>   		mux-int-port = <1>;
>   		mux-ext-port = <4>;
>   	};
> +
> +	aliases {
> +		mdio-gpio0 = &mdio0;
> +	};
> +
> +	mdio0: mdio-gpio {
> +		compatible = "virtual,mdio-gpio";
> +		gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>, /* mdc */
> +			<&gpio2 7 GPIO_ACTIVE_HIGH>; /* mdio */
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		switch@0 {
> +				compatible = "marvell,mv88e6240";

    Why suddenly 2 extra tabs instead of 1?

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;
> +
> +				switch_ports: ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +				};
> +		};
> +	};
>   };
>   
>   &ecspi5 {
[...]

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
