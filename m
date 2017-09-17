From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5 3/5] dt-bindings: document the CEC GPIO bindings
Date: Sun, 17 Sep 2017 11:47:51 +0200
Message-ID: <CACRpkdbApdos=mKJQZq8xfOM6O3hDS20gOc+0hGEkD7WqtQh5w@mail.gmail.com>
References: <20170916142827.5878-1-hverkuil@xs4all.nl> <20170916142827.5878-4-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916142827.5878-4-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 4:28 PM, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>
> Document the bindings for the cec-gpio module for hardware where the
> CEC line and optionally the HPD line are connected to GPIO lines.
>
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Just to make things explicit:

> +Required properties:
> +  - compatible: value must be "cec-gpio".
> +  - cec-gpios: gpio that the CEC line is connected to.

Add "The line should be tagged as open drain."

> +Example for the Raspberry Pi 3 where the CEC line is connected to
> +pin 26 aka BCM7 aka CE1 on the GPIO pin header and the HPD line is
> +connected to pin 11 aka BCM17:
> +

#include <dt-bindings/gpio/gpio.h>

> +cec-gpio {
> +       compatible = "cec-gpio";
> +       cec-gpio = <&gpio 7 GPIO_OPEN_DRAIN>;

cec-gpios = <&gpio 7 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

> +       hpd-gpio = <&gpio 17 GPIO_ACTIVE_HIGH>;

hpd-gpios = ..

With these fixups:
Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
