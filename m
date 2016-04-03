From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 04/16] arm64: dts: Add Hi6220 gpio configuration nodes
Date: Sun, 3 Apr 2016 21:28:48 +0200
Message-ID: <CACRpkdb8x1EVMDgrV36+neGk1O+rGnSpj9F0A5stHN_d6B-EAA@mail.gmail.com>
References: <1459589383-16914-1-git-send-email-guodong.xu@linaro.org>
	<1459589383-16914-5-git-send-email-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459589383-16914-5-git-send-email-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, XinWei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 2, 2016 at 11:29 AM, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> From: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>
> Add Hi6220 gpio configuration nodes
>
> Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Kong Xinwei <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>

Get rid of that blank line.

> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -249,5 +249,264 @@
>                         clocks = <&ao_ctrl 27>;
>                         clock-names = "apb_pclk";
>                 };
> +
> +               gpio0: gpio@f8011000 {
> +                       compatible = "arm,pl061", "arm,primecell";
> +                       reg = <0x0 0xf8011000 0x0 0x1000>;
> +                       interrupts = <0 52 0x4>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +                       clocks = <&ao_ctrl 2>;
> +                       clock-names = "apb_pclk";
> +                       status = "ok";
> +               };

This part with all GPIO controllers looks nice.

> new file mode 100644
> index 0000000..09242f0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi
> @@ -0,0 +1,607 @@
> +/ {
> +       gpio_rstout_n:gpio_rstout_n {
> +               gpios;
> +       };
> +       gpio_pmu_peri_en:gpio_pmu_peri_en {
> +               gpios;
> +       };
> +       gpio_sysclk0_en:gpio_sysclk0_en {
> +               gpios;
> +       };
> +       gpio_jtag_tdo:gpio_jtag_tdo {
> +               gpios;
> +       };
> +       /* LCB: PWR_HOLD_GPIO0_0 */
> +       gpio_pwr_hold:gpio_pwr_hold {
> +               gpios = <&gpio0 0 0>;
> +       };

(...)

I don't understand any stuff in this hikey-gpio.dtsi file.

What does all this mean?

If it has any practical use whatsoever then explain it in the
commit message, but right now it just looks like a big list
of placeholders with no use, but you can copy-paste them
into device nodes the day you need them?

If they are unused, just drop this file please.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
