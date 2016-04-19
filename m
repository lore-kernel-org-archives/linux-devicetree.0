From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6: Add dts for Embest MarS Board
Date: Tue, 19 Apr 2016 08:30:07 -0300
Message-ID: <CAOMZO5Atp7okpmC8ir20BNrthh=M8ENp3ewx-Xqyt1HR_CNjNg@mail.gmail.com>
References: <1460420743-30883-1-git-send-email-sergio.prado@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460420743-30883-1-git-send-email-sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 11, 2016 at 9:25 PM, Sergio Prado
<sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org> wrote:

> +/dts-v1/;
> +#include "imx6q.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "Embest MarS Board i.MX6Dual";
> +       compatible = "embest,imx6q-marsboard", "fsl,imx6dl";

This should be "fsl,imx6q".

> +
> +       memory {
> +               reg = <0x10000000 0x40000000>;
> +       };
> +
> +       regulators {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <0>;

Please remove the "simple-bus". Please check this commit:
https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/arch/arm/boot/dts/imx6q-tbs2910.dts?h=for-next&id=ddcc6cad715319fff53968db7110a287dbc4a77e

> +
> +               reg_3p3v: regulator@1 {
> +                       compatible = "regulator-fixed";
> +                       reg = <1>;
> +                       regulator-name = "3P3V";
> +                       regulator-min-microvolt = <3300000>;
> +                       regulator-max-microvolt = <3300000>;
> +               };
> +
> +               reg_usb_otg_vbus: regulator@2 {
> +                       compatible = "regulator-fixed";
> +                       reg = <2>;
> +                       regulator-name = "usb_otg_vbus";
> +                       regulator-min-microvolt = <5000000>;
> +                       regulator-max-microvolt = <5000000>;
> +                       gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;

You missed the 'enable-active-high' property.


> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_led>;
> +
> +               led@1 {

There is no need for @1.


> +                       label = "imx6:green:user1";
> +                       gpios = <&gpio5 2 GPIO_ACTIVE_LOW>;
> +                       default-state = "off";
> +                       linux,default-trigger = "heartbeat";
> +               };
> +
> +               led@2 {

There is no need for @2.

> +
> +&iomuxc {
> +       imx6-riotboard {
> +               pinctrl_uart1: uart1grp {

You can simplify the iomuxc node by doing like this:
https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/arch/arm/boot/dts/imx6q-tbs2910.dts?h=for-next&id=aa7871b53bc3c36b4adefe67f728143e2deeec93
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
