From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7] ARM: dts: sun8i: Add leds and switches
 on Orangepi Plus boards
Date: Mon, 21 Mar 2016 08:59:30 +0100
Message-ID: <20160321075930.GA30977@lukather>
References: <1458500102-11071-1-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k7W93gQNhKgsYkEv"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBY6TX23QKGQEURSSEQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1458500102-11071-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Krzysztof Adamski <k@japko.eu>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--k7W93gQNhKgsYkEv
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sun, Mar 20, 2016 at 07:55:02PM +0100, Hans de Goede wrote:
> From: Krzysztof Adamski <k@japko.eu>
> 
> OrangePi Plus board has two leds - green ("pwr") and red ("status")
> and two switches ("sw4" and "sw2"). This patch describes them in
> devicetree.
> 
> Signed-off-by: Krzysztof Adamski <k@japko.eu>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

An earlier version has already been sent for 4.6, please base your
changes on top of this one.

And there's a bunch of things I didn't catch at that time :/

> ---
> Changes in v6 (hdegoede):
> -Merge leds and r_leds nodes into one
> -Fix led labels to be in <board>:<colour>:<role> form
> -Alphabetically sort the added nodes
> -Add support for sw2 (this is the small reset-like button)
> Changes in v7 (hdegoede):
> -Use PL3 / PL4 in the pinctrl node, not PL03 / PL04
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 63 ++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> index a680b1f..9d8c038 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> @@ -45,6 +45,7 @@
>  #include "sunxi-common-regulators.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
>  / {
> @@ -59,6 +60,43 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +		input-name = "sw4";

This is an undocumented (and apparently unused) property

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sw_r_opc>;
> +
> +		sw2@0 {

You shouldn't have a unit-address here

> +			label = "sw2";
> +			linux,code = <BTN_1>;
> +			gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		sw4@0 {

Ditto.

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--k7W93gQNhKgsYkEv--
