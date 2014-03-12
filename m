From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: document gpio-charger bindings
Date: Wed, 12 Mar 2014 09:28:46 -0500
Message-ID: <CAL_JsqKoOhHpJ_OL23WbitQbiJJKLpWrtezT824FP0qtZ2xrEg@mail.gmail.com>
References: <12569216.pGctOhkhxz@phil>
	<2194340.F9etmr5mIo@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2194340.F9etmr5mIo@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 8:46 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
>
> This documents the binding for the gpio-charger power-supply.

How does this relate to what's documented in power_supply.txt and
charger-manager.txt? Both have references to USB charging. Doesn't
this need some connection to a battery node?

Rob

>
> Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
> ---
>  .../bindings/power_supply/gpio-charger.txt         | 23 ++++++++++++=
++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power_supply/gp=
io-charger.txt
>
> diff --git a/Documentation/devicetree/bindings/power_supply/gpio-char=
ger.txt b/Documentation/devicetree/bindings/power_supply/gpio-charger.t=
xt
> new file mode 100644
> index 0000000..fad87a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> @@ -0,0 +1,23 @@
> +gpio-charger
> +
> +Required properties :
> + - compatible : "gpio-charger"
> + - gpios : GPIO indicating the charger presence.
> +   See GPIO binding in bindings/gpio/gpio.txt .
> + - charger-type : power supply type, one of
> +     unknown
> +     battery
> +     ups
> +     mains
> +     usb-sdp (USB standard downstream port)
> +     usb-dcp (USB dedicated charging port)
> +     usb-cdp (USB charging downstream port)
> +     usb-aca (USB accessory charger adapter)
> +
> +Example:
> +
> +       charger {
> +               compatible =3D "gpio-charger";
> +               charger-type =3D "usb-sdp";
> +               gpios =3D <&gpf0 2 0 0 0>;
> +       }
> --
> 1.8.5.3
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
