From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH] [V2] ARM: dts: sun7i: Add dts file for
 Bananapi M1 Plus board
Date: Thu, 2 Jun 2016 12:55:23 +1000
Message-ID: <CAGRGNgUiGaxoVxtq=k8NG5mCqEXS9fd-ry1vvVJfzb+R2ATMTA@mail.gmail.com>
References: <20160602023623.5761-1-luoyi.ly@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160602023623.5761-1-luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Luo yi,

On Thu, Jun 2, 2016 at 12:36 PM,  <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Add support for the Bananapi M1 Plus A20 development board from
> sinovoip.com.cn . This board is nearly a clone of the Lemaker's
> Bananapro, but differ with the wlan chipset connection and i2s pinout.
> And I also enable the integrated audio codec on default.

No signed-off-by.

> ---
>  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 72 ++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> new file mode 100644
> index 0000000..6fd55d7
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
> @@ -0,0 +1,72 @@
> +/*
> + * Copyright 2016 Luo Yi <luoyi.ly-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
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
> +#include "sun7i-a20-bananapro.dts"
> +
> +/ {
> +       model = "Banana Pi BPI-M1-Plus";
> +       compatible = "sinovoip,bpi-m1-plus", "allwinner,sun7i-a20";
> +};
> +
> +

Extra line.

> +&codec {
> +       status = "okay";
> +};

Does anyone know if this should be enabled on the bananapro too?

> +
> +&mmc3 {
> +       enable-sdio-wakeup;
> +
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +               interrupt-parent = <&pio>;
> +               interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-names = "host-wake";
> +       };
> +

Extra line.

> +};
> +
> +&mmc3_pins_a {
> +    /* AP6210 requires pull-up */

Should this be indented the same as the following line?

> +       allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +};
> +

Extra line.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
