From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] added sun7i-a20-inet-k970.dts
Date: Mon, 19 Jan 2015 19:50:43 +0100
Message-ID: <54BD5203.90000@redhat.com>
References: <3184462.M90eiSWZKq@x64.localnet>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDRZXY4CYYORBENE6WSQKGQEEJT75KQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <3184462.M90eiSWZKq-01DtBWzyqXQXpj0+iOhflA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 19-01-15 18:53, Lars Doelle wrote:
> Hi everyone,
>
> this patch adds the DT for the [[Inet-K970] tablet.
>
> Note that the wiki page has been renamed from [[Tristan-Auron-Planet-1]]
> after identifying the mainboard. Earlier patches concerning U-Boot and
> FEX have been filed under original name to this list and are now somewhat
> in limbo. FEX is checked in, U-Boot on hold to the best of my knowledge.
>
> Should I post a rename patch for the FEX and repost the unchanged U-boot
> patch for the device under the new name or how to proceed best?
>
> Kind regards, Lars

Thanks, we've recently moved over from using a full node
hierarchy to using label references in board dts files, see e.g. :

https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/commit/?h=3D=
sunxi/dt-for-3.20&id=3D327f121fea91fd79d6b71f47a8e1bc62a7fd86e5

Can you please respin this to follow that style (the nodes should
be sorted alphabetically).

Also like with the u-boot patch, when submitting patches for upstream
they should not be send to the linux-sunxi list, sunxi dts patches
should go to Maxime Ripard (added to the Cc) with the linux-arm and
devicetree lists both in the Cc (also added to the Cc) note you do
not need to be subscribed to these lists.

This makes me realize that we should probably write a manual on
how to add a new sunxi board to upstream u-boot / a dts to the
kernel. Since you've just gone through the process, could you
perhaps write a manual for this on linux-sunxi.org, it is a wiki
so you should be able to add an account and create a new page,
note I've also asked Aleksei Mamlin (also added to the Cc) to
create a manual for this, so if you do please coordinate with
him to avoid doing double work. Also note that me asking you
both is not an excuse for the both of you to look at the other
for doing this, but rather me hoping that at least one of you
will do it :)

Thanks & Regards,

Hans


>
> ---
>   arch/arm/boot/dts/sun7i-a20-inet-k970.dts | 249 +++++++++++++++++++++++=
+++++++
>   1 file changed, 249 insertions(+)
>   create mode 100644 arch/arm/boot/dts/sun7i-a20-inet-k970.dts
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-inet-k970.dts b/arch/arm/boot/dt=
s/sun7i-a20-inet-k970.dts
> new file mode 100644
> index 0000000..5a34082
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-inet-k970.dts
> @@ -0,0 +1,249 @@
> +/*
> + * Copyright 2014 - Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + * Copyright 2015 - Lars D=C3=B6lle <lars.doelle-RMqqONVpFt+ELgA04lAiVw@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of th=
e
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this file; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun7i-a20.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model =3D "Inet A20-Inet-K970";
> +
> +	compatible =3D "inet,a20-inet-k970", "allwinner,sun7i-a20";
> +
> +	soc@01c00000 {
> +		mmc0: mmc@01c0f000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> +			vmmc-supply =3D <&reg_vcc3v3>;
> +			bus-width =3D <4>;
> +			cd-gpios =3D <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> +			cd-inverted;
> +			status =3D "okay";
> +		};
> +
> +		usbphy: phy@01c13400 {
> +			usb1_vbus-supply =3D <&reg_usb1_vbus>;
> +			usb2_vbus-supply =3D <&reg_usb2_vbus>;
> +			status =3D "okay";
> +		};
> +
> +		ehci0: usb@01c14000 {
> +			status =3D "okay";
> +		};
> +
> +		ohci0: usb@01c14400 {
> +			status =3D "okay";
> +		};
> +
> +		ehci1: usb@01c1c000 {
> +			status =3D "okay";
> +		};
> +
> +		ohci1: usb@01c1c400 {
> +			status =3D "okay";
> +		};
> +
> +		uart0: serial@01c28000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart0_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		i2c0: i2c@01c2ac00 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&i2c0_pins_a>;
> +			status =3D "okay";
> +
> +			axp209: pmic@34 {
> +				compatible =3D "x-powers,axp209";
> +				reg =3D <0x34>;
> +				interrupt-parent =3D <&nmi_intc>;
> +				interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +
> +				acin-supply =3D <&reg_axp_ipsout>;
> +				vin2-supply =3D <&reg_axp_ipsout>;
> +				vin3-supply =3D <&reg_axp_ipsout>;
> +				ldo24in-supply =3D <&reg_axp_ipsout>;
> +				ldo3in-supply =3D <&reg_axp_ipsout>;
> +
> +				regulators {
> +					vdd_rtc: ldo1 {
> +						regulator-min-microvolt =3D <1300000>;
> +						regulator-max-microvolt =3D <1300000>;
> +						regulator-always-on;
> +					};
> +
> +					avcc: ldo2 {
> +						regulator-min-microvolt =3D <1800000>;
> +						regulator-max-microvolt =3D <3300000>;
> +						regulator-always-on;
> +					};
> +
> +					vcc_csi0: ldo3 {
> +						regulator-min-microvolt =3D <700000>;
> +						regulator-max-microvolt =3D <3500000>;
> +						regulator-always-on;
> +					};
> +
> +					vcc_csi1: ldo4 {
> +						regulator-min-microvolt =3D <1250000>;
> +						regulator-max-microvolt =3D <3300000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_cpu: dcdc2 {
> +						regulator-min-microvolt =3D <700000>;
> +						regulator-max-microvolt =3D <2275000>;
> +						regulator-always-on;
> +					};
> +
> +					vdd_int: dcdc3 {
> +						regulator-min-microvolt =3D <700000>;
> +						regulator-max-microvolt =3D <3500000>;
> +						regulator-always-on;
> +					};
> +				};
> +			};
> +		};
> +
> +                i2c1: i2c@01c2b000 {
> +                        pinctrl-names =3D "default";
> +                        pinctrl-0 =3D <&i2c1_pins_a>;
> +                        status =3D "okay";
> +
> +                        // accelerometer mma865x on 0x1d
> +                };
> +
> +		pio: pinctrl@01c20800 {
> +
> +			edt_ft5x06_pins_a: ft5@0 { // interrupt
> +				allwinner,pins     =3D "PH21";
> +				allwinner,function =3D "irq";
> +  				allwinner,drive    =3D <SUN4I_PINCTRL_20_MA>;
> +  				allwinner,pull     =3D <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +			edt_ft5x06_pins_b: ft5@1 { // power
> +				allwinner,pins     =3D "PH22";
> +  				allwinner,function =3D "gpio_out";
> +  				allwinner,drive    =3D <SUN4I_PINCTRL_20_MA>;
> +  				allwinner,pull     =3D <SUN4I_PINCTRL_NO_PULL>;
> +                                output_high;
> +			};
> +		};
> +
> +                i2c2: i2c@01c2b400 {
> +                        pinctrl-names =3D "default";
> +                        pinctrl-0 =3D <&i2c2_pins_a>;
> +                        status =3D "okay";
> +
> +			polytouch: edt-ft5x06@38 {
> +				compatible =3D "edt,edt-ft5x06";
> +				reg =3D <0x38>;
> +				pinctrl-names =3D "default";
> +  				pinctrl-0 =3D <&edt_ft5x06_pins_a &edt_ft5x06_pins_b>;
> +  				interrupt-parent =3D <&pio>;
> +  				interrupts =3D <21 IRQ_TYPE_EDGE_FALLING>;
> +                                // wakeup spelled in script.bin. not ope=
rational, here
> +			};
> +                };
> +
> +		lradc: lradc@01c22800 {
> +
> +			vref-supply =3D <&reg_vcc3v0>;
> +	              	status =3D "okay";
> +
> +                	// The driver picks the closest voltage.
> +
> +			button@158 {
> +				label =3D "Volume Up";
> +				linux,code =3D <KEY_VOLUMEUP>;
> +				channel =3D <0>;
> +				voltage =3D <158730>;
> +			};
> +
> +			button@952 {
> +				label =3D "Volume Down";
> +				linux,code =3D <KEY_VOLUMEDOWN>;
> +				channel =3D <0>;
> +				voltage =3D <952380>;
> +			};
> +
> +			button@1142 {
> +				label =3D "Menu"; // labeled ESC on the back cover
> +				linux,code =3D <KEY_MENU>;
> +				channel =3D <0>;
> +				voltage =3D <1142857>;
> +			};
> +		};
> +	};
> +
> +	reg_usb1_vbus: usb1-vbus {
> +		status =3D "okay";
> +	};
> +
> +	reg_usb2_vbus: usb2-vbus {
> +		status =3D "okay";
> +	};
> +
> +	reg_axp_ipsout: axp_ipsout {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "axp-ipsout";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +};
>

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
