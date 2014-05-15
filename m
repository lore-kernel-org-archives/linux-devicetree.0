From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: kirkwood: add kirkwood-km_fixedeth DTS
 file
Date: Thu, 15 May 2014 12:43:16 +0200
Message-ID: <53749A44.800@gmail.com>
References: <1400147335-20947-1-git-send-email-valentin.longchamp@keymile.com> <1400147335-20947-4-git-send-email-valentin.longchamp@keymile.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400147335-20947-4-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/15/2014 11:48 AM, Valentin Longchamp wrote:
> Besides our Kirkwood Reference design, there is another group of board
> on which the eth interface is not connected to a phy but to a swtich for

s/swtich/switch/

> some board internal communication.
>
> The configuration of the switch is handled by an EEPROM or by the
> bootloader, but on the kirkwood side, the port is always configured as
> 1000 Mbits, full duplex.

Hmm, if it is another variant of the Keymile board we already have,
it should probably go like this:

+ kirkwood.dtsi
+ kirkwood-98dx4122.dtsi
+--> kirkwood_km_common.dtsi
      +--> kirkwood_km_kirkwood.dts
      +--> kirkwood_km_fixedeth.dts

Andrew did some great series for the various NAS vendor boards, where
you can look at.

> Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
>
> ---
>
>   arch/arm/boot/dts/kirkwood-km_fixedeth.dts | 70 ++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
>   create mode 100644 arch/arm/boot/dts/kirkwood-km_fixedeth.dts
>
> diff --git a/arch/arm/boot/dts/kirkwood-km_fixedeth.dts b/arch/arm/boot/dts/kirkwood-km_fixedeth.dts
> new file mode 100644
> index 0000000..3d54d9b
> --- /dev/null
> +++ b/arch/arm/boot/dts/kirkwood-km_fixedeth.dts
> @@ -0,0 +1,70 @@
> +/dts-v1/;
> +
> +#include "kirkwood.dtsi"
> +#include "kirkwood-98dx4122.dtsi"
> +
> +/ {
> +	model = "Keymile Kirkwood Fixed Eth";
> +	compatible = "keymile,km_fixedeth", "marvell,kirkwood-98DX4122", "marvell,kirkwood";
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x08000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlyprintk";
> +		stdout-path = &uart0;
> +	};
> +
> +	mbus {
> +		pcie-controller {
> +			status = "okay";
> +
> +			pcie@1,0 {
> +				status = "okay";
> +			};
> +		};
> +	};
> +
> +	ocp@f1000000 {
> +		pinctrl: pin-controller@10000 {
> +			pinctrl-0 = < &pmx_i2c_gpio_sda &pmx_i2c_gpio_scl >;
> +			pinctrl-names = "default";
> +
> +			pmx_i2c_gpio_sda: pmx-gpio-sda {
> +				marvell,pins = "mpp8";
> +				marvell,function = "gpio";
> +			};
> +			pmx_i2c_gpio_scl: pmx-gpio-scl {
> +				marvell,pins = "mpp9";
> +				marvell,function = "gpio";
> +			};
> +		};
> +
> +		serial@12000 {
> +			status = "ok";
> +		};
> +	};
> +
> +	i2c@0 {
> +		compatible = "i2c-gpio";
> +		gpios = < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
> +			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
> +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> +	};
> +};
> +
> +&nand {
> +	status = "okay";
> +	chip-delay = <25>;
> +};
> +
> +&eth0 {
> +	status = "okay";
> +	ethernet0-port@0 {
> +		phy-handle = <>;

Is that empty phy-handle required? If so, we should probably fix
it in mv643xx_eth instead.

> +		speed = <1000>;  /* <SPEED_1000> */
> +		duplex = <0x01>; /* <DUPLEX_FULL> */

s/0x01/1/

Sebastian

> +	};
> +};
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
