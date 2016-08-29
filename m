From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: fix reference to a390 spi controller
Date: Mon, 29 Aug 2016 11:29:25 +0200
Message-ID: <87k2ezhqiy.fsf@free-electrons.com>
References: <20160826153925.863488-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160826153925.863488-1-arnd-r2nGTMty4D4@public.gmane.org> (Arnd Bergmann's message
        of "Fri, 26 Aug 2016 17:38:54 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,
 
 On ven., août 26 2016, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> The SPI controller in the arch/arm/boot/dts/armada-39x.dtsi file has moved
> to a different location in the hierarchy, which breaks the overrides
> in the board specific file:
>
> Warning (reg_format): "reg" property in /soc/internal-regs/spi@10680/spi-flash@1 has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
> Warning (avoid_default_addr_size): Relying on default #address-cells value for /soc/internal-regs/spi@10680/spi-flash@1
>
> This changes the board to reference the spi controller by its label
> (which has not changed) rather than the full path.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Fixes: 0160a4b68987 ("ARM: dts: mvebu: A37x/XP/38x/39x: Move SPI controller nodes into 'soc' node")

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/armada-390-db.dts | 60 ++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-390-db.dts b/arch/arm/boot/dts/armada-390-db.dts
> index 9d0d9b2e9bfc..34e279d973c8 100644
> --- a/arch/arm/boot/dts/armada-390-db.dts
> +++ b/arch/arm/boot/dts/armada-390-db.dts
> @@ -66,36 +66,6 @@
>  			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000>;
>  
>  		internal-regs {
> -			spi@10680 {
> -				status = "okay";
> -				pinctrl-0 = <&spi1_pins>;
> -				pinctrl-names = "default";
> -
> -				spi-flash@1 {
> -					#address-cells = <1>;
> -					#size-cells = <1>;
> -					compatible = "n25q128a13",
> -						     "jedec,spi-nor";
> -					reg = <0>; /* Chip select 0 */
> -					spi-max-frequency = <108000000>;
> -
> -					partitions {
> -						compatible = "fixed-partitions";
> -						#address-cells = <1>;
> -						#size-cells = <1>;
> -
> -						partition@0 {
> -							label = "U-Boot";
> -							reg = <0 0x400000>;
> -						};
> -						partition@400000 {
> -							label = "Filesystem";
> -							reg = <0x400000 0xc00000>;
> -						};
> -					};
> -				};
> -			};
> -
>  			i2c@11000 {
>  				status = "okay";
>  				clock-frequency = <100000>;
> @@ -173,3 +143,33 @@
>  		};
>  	};
>  };
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-0 = <&spi1_pins>;
> +	pinctrl-names = "default";
> +
> +	spi-flash@1 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "n25q128a13",
> +			     "jedec,spi-nor";
> +		reg = <0>; /* Chip select 0 */
> +		spi-max-frequency = <108000000>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "U-Boot";
> +				reg = <0 0x400000>;
> +			};
> +			partition@400000 {
> +				label = "Filesystem";
> +				reg = <0x400000 0xc00000>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.9.0
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
