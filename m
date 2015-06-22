From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 12/12] MIPS: Add basic support for the TL-WR1043ND
 version 1
Date: Mon, 22 Jun 2015 18:11:12 +0300
Message-ID: <20150622181112.ab7a4c6764b0aa2236e43ab4@gmail.com>
References: <1433029955-7346-1-git-send-email-albeu@free.fr>
	<1433031506-7984-5-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433031506-7984-5-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 31 May 2015 02:18:26 +0200
Alban Bedel <albeu-GANU6spQydw@public.gmane.org> wrote:

> Add a DTS for TL-WR1043ND version 1 and allow to have it built in the
> kernel to circumvent the broken u-boot found on these boards.
> Currently only the UART, LEDs and buttons are supported.
>=20
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
> v2: * Rebased for the new vendor directory structure
>     * Merged the 2 separate patch for SoC dtsi and board DTS in a
>       single one
>     * Fixed the node names to use ePAPR standardized names
> v3: * Moved adding the Kconfig Builtin devicetree menu to this patch
>     * Set the Kconfig builtin DTB menu as optional, removed config
>       DTB_ATH79_NONE and slightly improved the menu name and help
>       message.
> v4: * Always build the DTB to improve testing coverage
>     * Added the SPI controller as the binding has been accepted in
>       the SPI tree.
> ---
>  arch/mips/ath79/Kconfig                          |  12 ++
>  arch/mips/boot/dts/Makefile                      |   1 +
>  arch/mips/boot/dts/qca/Makefile                  |  11 ++
>  arch/mips/boot/dts/qca/ar9132.dtsi               | 133 +++++++++++++=
++++++++++
>  arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 112 +++++++++++++=
++++++
>  5 files changed, 269 insertions(+)
>  create mode 100644 arch/mips/boot/dts/qca/Makefile
>  create mode 100644 arch/mips/boot/dts/qca/ar9132.dtsi
>  create mode 100644 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
>=20
> diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
> index dfc6020..13c04cf 100644
> --- a/arch/mips/ath79/Kconfig
> +++ b/arch/mips/ath79/Kconfig
> @@ -71,6 +71,18 @@ config ATH79_MACH_UBNT_XM
>  	  Say 'Y' here if you want your kernel to support the
>  	  Ubiquiti Networks XM (rev 1.0) board.
> =20
> +choice
> +	prompt "Build a DTB in the kernel"
> +	optional
> +	help
> +	  Select a devicetree that should be built into the kernel.
> +
> +	config DTB_TL_WR1043ND_V1
> +		bool "TL-WR1043ND Version 1"
> +		select BUILTIN_DTB
> +		select SOC_AR913X
> +endchoice
> +
>  endmenu
> =20
>  config SOC_AR71XX
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefil=
e
> index 5d95e4b..9975485 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -3,6 +3,7 @@ dts-dirs	+=3D cavium-octeon
>  dts-dirs	+=3D lantiq
>  dts-dirs	+=3D mti
>  dts-dirs	+=3D netlogic
> +dts-dirs	+=3D qca
>  dts-dirs	+=3D ralink
> =20
>  obj-y		:=3D $(addsuffix /, $(dts-dirs))
> diff --git a/arch/mips/boot/dts/qca/Makefile b/arch/mips/boot/dts/qca=
/Makefile
> new file mode 100644
> index 0000000..2d61455d
> --- /dev/null
> +++ b/arch/mips/boot/dts/qca/Makefile
> @@ -0,0 +1,11 @@
> +# All DTBs
> +dtb-$(CONFIG_ATH79)			+=3D ar9132_tl_wr1043nd_v1.dtb
> +
> +# Select a DTB to build in the kernel
> +obj-$(CONFIG_DTB_TL_WR1043ND_V1)	+=3D ar9132_tl_wr1043nd_v1.dtb.o
> +
> +# Force kbuild to make empty built-in.o if necessary
> +obj-				+=3D dummy.o
> +
> +always				:=3D $(dtb-y)
> +clean-files			:=3D *.dtb *.dtb.S
> diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/=
qca/ar9132.dtsi
> new file mode 100644
> index 0000000..4759cff
> --- /dev/null
> +++ b/arch/mips/boot/dts/qca/ar9132.dtsi
> @@ -0,0 +1,133 @@
> +/ {
> +	compatible =3D "qca,ar9132";
> +
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "mips,mips24Kc";
> +			reg =3D <0>;
> +		};
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		compatible =3D "qca,ar9132-cpu-intc", "qca,ar7100-cpu-intc";
> +
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		qca,ddr-wb-channel-interrupts =3D <2>, <3>, <4>, <5>;
> +		qca,ddr-wb-channels =3D <&ddr_ctrl 3>, <&ddr_ctrl 2>,
> +					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
> +	};
> +
> +	ahb {
> +		compatible =3D "simple-bus";
> +		ranges;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		interrupt-parent =3D <&cpuintc>;
> +
> +		apb {
> +			compatible =3D "simple-bus";
> +			ranges;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			interrupt-parent =3D <&miscintc>;
> +
> +			ddr_ctrl: memory-controller@18000000 {
> +				compatible =3D "qca,ar9132-ddr-controller",
> +						"qca,ar7240-ddr-controller";
> +				reg =3D <0x18000000 0x100>;
> +
> +				#qca,ddr-wb-channel-cells =3D <1>;
> +			};
> +
> +			uart@18020000 {
> +				compatible =3D "ns8250";
> +				reg =3D <0x18020000 0x20>;
> +				interrupts =3D <3>;
> +
> +				clocks =3D <&pll 2>;
> +				clock-names =3D "uart";
> +
> +				reg-io-width =3D <4>;
> +				reg-shift =3D <2>;
> +				no-loopback-test;
> +
> +				status =3D "disabled";
> +			};
> +
> +			gpio: gpio@18040000 {
> +				compatible =3D "qca,ar9132-gpio",
> +						"qca,ar7100-gpio";
> +				reg =3D <0x18040000 0x30>;
> +				interrupts =3D <2>;
> +
> +				ngpios =3D <22>;
> +
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +			};
> +
> +			pll: pll-controller@18050000 {
> +				compatible =3D "qca,ar9132-ppl",
> +						"qca,ar9130-pll";
> +				reg =3D <0x18050000 0x20>;
> +
> +				clock-names =3D "ref";
> +				/* The board must provides the ref clock */
> +
> +				#clock-cells =3D <1>;
> +				clock-output-names =3D "cpu", "ddr", "ahb";
> +			};
> +
> +			wdt@18060008 {
> +				compatible =3D "qca,ar7130-wdt";
> +				reg =3D <0x18060008 0x8>;
> +
> +				interrupts =3D <4>;
> +
> +				clocks =3D <&pll 2>;
> +				clock-names =3D "wdt";
> +			};
> +
> +			miscintc: interrupt-controller@18060010 {
> +				compatible =3D "qca,ar9132-misc-intc",
> +					   "qca,ar7100-misc-intc";
> +				reg =3D <0x18060010 0x4>;
> +
> +				interrupt-parent =3D <&cpuintc>;
> +				interrupts =3D <6>;
> +
> +				interrupt-controller;
> +				#interrupt-cells =3D <1>;
> +			};
> +		};
> +
> +		spi@1f000000 {

Could we add an alias here? E.g.

		spi: spi@1f000000 {

So we can use the alias in the board dts file with zero indent. E.g=20

&spi {
	status =3D "okay";
	num-cs =3D <1>;

	flash@0 {
=2E..


Just the same change can be used with uart@18020000.

> diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/=
mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> new file mode 100644
> index 0000000..003015a
> --- /dev/null
> +++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
> @@ -0,0 +1,112 @@
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +#include "ar9132.dtsi"
> +
> +/ {
> +	compatible =3D "tplink,tl-wr1043nd-v1", "qca,ar9132";
> +	model =3D "TP-Link TL-WR1043ND Version 1";
> +
> +	alias {
> +		serial0 =3D "/ahb/apb/uart@18020000";
> +	};
> +
> +	memory@0 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x2000000>;
> +	};
> +
> +	extosc: oscillator {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <40000000>;
> +	};
> +
> +	ahb {
> +		apb {
> +			uart@18020000 {
> +				status =3D "okay";
> +			};
> +
> +			pll-controller@18050000 {
> +				clocks =3D <&extosc>;
> +			};
> +		};
> +
> +		spi@1f000000 {
> +			status =3D "okay";
> +			num-cs =3D <1>;
> +
> +			flash@0 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <1>;
> +				compatible =3D "s25sl064a";
> +				reg =3D <0>;
> +				spi-max-frequency =3D <25000000>;
> +
> +				partition@0 {
> +					label =3D "u-boot";
> +					reg =3D <0x000000 0x020000>;
> +				};
> +
> +				partition@1 {
> +					label =3D "firmware";
> +					reg =3D <0x020000 0x7D0000>;
> +				};
> +
> +				partition@2 {
> +					label =3D "art";
> +					reg =3D <0x7F0000 0x010000>;
> +					read-only;
> +				};
> +			};
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys-polled";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		poll-interval =3D <20>;
> +		button@0 {
> +			label =3D "reset";
> +			linux,code =3D <KEY_RESTART>;
> +			gpios =3D <&gpio 3 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <60>;
> +		};
> +
> +		button@1 {
> +			label =3D "qss";
> +			linux,code =3D <KEY_WPS_BUTTON>;
> +			gpios =3D <&gpio 7 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <60>;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		led@0 {
> +			label =3D "tp-link:green:usb";
> +			gpios =3D <&gpio 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led@1 {
> +			label =3D "tp-link:green:system";
> +			gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		led@2 {
> +			label =3D "tp-link:green:qss";
> +			gpios =3D <&gpio 5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led@3 {
> +			label =3D "tp-link:green:wlan";
> +			gpios =3D <&gpio 9 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> --=20
> 2.0.0
>=20
>=20


--=20
--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
