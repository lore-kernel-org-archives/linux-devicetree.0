From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/9] ARM: dts: sun8i: sinlinx-sina33: Add
 AXP223 PMIC device and regulator nodes
Date: Fri, 20 Nov 2015 12:12:38 +0100
Message-ID: <20151120111238.GV32142@lukather>
References: <1447691908-25456-1-git-send-email-wens@csie.org>
 <1447691908-25456-6-git-send-email-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YwTTlJgQ7QoYB9ta"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMUAXSZAKGQEG5QMIJY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447691908-25456-6-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--YwTTlJgQ7QoYB9ta
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Nov 17, 2015 at 12:38:24AM +0800, Chen-Yu Tsai wrote:
> This board has a X-Powers AXP223 PMIC connected via RSB. Its regulators
> provide power to various parts of the SoC and the board.
> 
> Also update the regulator supply phandles.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts | 79 +++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
> index 13ce68f06dd6..91a0fde47fdd 100644
> --- a/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
> +++ b/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
> @@ -68,7 +68,7 @@
>  };
>  
>  &lradc {
> -	vref-supply = <&reg_vcc3v0>;
> +	vref-supply = <&reg_dcdc1>;
>  	status = "okay";
>  
>  	button@200 {
> @@ -96,7 +96,7 @@
>  &mmc0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_sina33>;
> -	vmmc-supply = <&reg_vcc3v0>;
> +	vmmc-supply = <&reg_dcdc1>;
>  	bus-width = <4>;
>  	cd-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
>  	cd-inverted;
> @@ -106,7 +106,7 @@
>  &mmc2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc2_8bit_pins>;
> -	vmmc-supply = <&reg_vcc3v0>;
> +	vmmc-supply = <&reg_dcdc1>;
>  	bus-width = <8>;
>  	non-removable;
>  	status = "okay";
> @@ -132,6 +132,79 @@
>  
>  &r_rsb {
>  	status = "okay";
> +
> +	axp22x: pmic@3e3 {
> +		compatible = "x-powers,axp223";
> +		reg = <0x3e3>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		eldoin-supply = <&reg_dcdc1>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_aldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-io";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <2350000>;
> +	regulator-max-microvolt = <2650000>;
> +	regulator-name = "vdd-dll";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <2700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-pll-avcc";
> +};
> +
> +&reg_dc5ldo {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-cpus";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <900000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_rtc_ldo {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-rtc";
>  };

Isn't this supposed to be in the AXP DTSI?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--YwTTlJgQ7QoYB9ta--
