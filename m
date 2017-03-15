From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] MIPS: NI 169445 board support
Date: Wed, 15 Mar 2017 10:37:12 +0100
Message-ID: <CACRpkda0xsm+iN_Kxg4pB43LQ7i2MzfJgqibDAt3V5xCRinHEA@mail.gmail.com>
References: <1488830761-681-1-git-send-email-nathan.sullivan@ni.com> <1488830761-681-3-git-send-email-nathan.sullivan@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488830761-681-3-git-send-email-nathan.sullivan-acOepvfBmUk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 6, 2017 at 9:06 PM, Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org> wrote:

> Support the National Instruments 169445 board.
>
> Signed-off-by: Nathan Sullivan <nathan.sullivan-acOepvfBmUk@public.gmane.org>
(...)

> +               gpio1:gpio-controller@1f300010 {
> +                       compatible = "ni,169445-nand-gpio";
> +                       reg = <0x10 0x4>;
> +                       reg-names = "dat";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       ngpios = <5>;

Here I would add:

gpio-line-names = "NC", "NCE", "ALE", "CLE", "NWP";

(Dunno about the first one, maybe you have a schematic?)

> +               };
> +
> +               gpio2:gpio-controller@1f300014 {
> +                       compatible = "ni,169445-nand-gpio";
> +                       reg = <0x14 0x4>;
> +                       reg-names = "dat";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       ngpios = <1>;

gpio-line-names = "RDY";

> +               };
> +
> +               nand@1f300000 {
> +                       compatible = "gpio-control-nand";
> +                       nand-on-flash-bbt;
> +                       nand-ecc-mode = "soft_bch";
> +                       nand-ecc-step-size = <512>;
> +                       nand-ecc-strength = <4>;
> +                       reg = <0x0 4>;
> +                       gpios = <&gpio2 0 0>, /* rdy */
> +                               <&gpio1 1 0>, /* nce */
> +                               <&gpio1 2 0>, /* ale */
> +                               <&gpio1 3 0>, /* cle */
> +                               <&gpio1 4 0>; /* nwp */
> +               };

To reflect this. "lsgpio" gives better info after that.

Other than that:
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
