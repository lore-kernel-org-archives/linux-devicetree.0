From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Tue, 28 Jul 2015 14:21:55 -0700
Message-ID: <20150728212155.GA18137@roeck-us.net>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438115628-2819-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

On Tue, Jul 28, 2015 at 10:33:48PM +0200, Uwe Kleine-K=F6nig wrote:
> This is just a suggestion up to now, I don't have any code yet to sha=
re.
>=20
> Apart from minor rewording to make the document easier to understand =
and
> less ambiguous the relevant changes are:
>=20
>  - add an "enable-gpio" property.
>    I admit the device I'm currently working with doesn't have this.
>    Still I imagine this to be a common hardware property. I added it
>    mainly to demonstrate the shortcomings of the existing binding.
>  - rename "gpios" to "trigger-gpio"
>    This is more descriptive. And given there is "enable-gpio" now, to=
o,
>    using plain "gpios" seems wrong.
>  - deprecate always-running
>    Apart from the description describing the driver behaviour and not
>    the device property, always-running only seems to make sense in
>    combination with hw_algo =3D "level" and in reality should only
>    invalidate the sentence: "The watchdog timer is disabled when GPIO=
 is
>    left floating or connected to a three-state buffer."

always-running is meant to indicate that the watchdog can not be stoppe=
d
(meaning a timer has to be used to send keepalives while the watchdog
device is closed). The documentation specifically states that.

	"If the watchdog timer cannot be disabled ..."

How would you express that condition without always-running or a simila=
r
attribute ?  I am also not sure how that relates to hw_algo; I thought
those properties are orthogonal.

Of course, 'always-running' _may_ describe driver behavior, but that do=
esn't
have to be the case. There are lots of watchdogs out there which can no=
t be
stopped. Some of them run all the time, others can not be stopped once =
started.

That gets us into the rat-hole of arguing if property X describes drive=
r
behavior or the hardware, and of rejecting properties because they may
be driver descriptions in some use cases (because 'always-running' can
be set even if the hardware doesn't mandate it, making it driver behavi=
or).
I'd rather not go there.

>    With this semantic using a property "disable-on-tri-state" sounds
>    more sensible. And note that even the following would make sense
>    hardware-wise, while the device tree looks stupid:
>=20
> 	watchdog {
> 		compatible =3D "linux,wdt-gpio";
> 		trigger-gpio =3D ...;
> 		hw_algo =3D "toggle";
> 		always-running;
> 		enable-gpio =3D ...;
> 	};
>=20
>    (i.e. always-running, but disable possible by a dedicated gpio.)
>=20
It might also mean that _enable_ is possible with a dedicated gpio.
That doesn't mean it can be stopped once started. Again, there are lots
of watchdogs out there which can be enabled/started but not stopped.

> I'm aware that using ...-gpios is more common than ...-gpio. I don't
> feel strong here, but as only a single gpio makes sense here, having
> -gpios seems wrong.
>=20
Documentation/devicetree/bindings/gpio/gpio.txt states that gpio pin
references should be named <name>-gpios. It even lists examples such as

	enable-gpios =3D <&gpio2 2>;

I thought this was a hard rule, and I seem to recall requests to change
something-gpio to something-spios, but I may be wrong.

Thanks,
Guenter

> Also I considered renaming hw_margin_ms and hw_algo to use - instead =
of
> _. Doing this might even ease to implement the changes above in a
> compatible way. I.e. assume the watchdog can be disabled by tristatin=
g
> the gpio if the description uses underscores instead of hyphen.
>=20

> Feedback very welcome!
>=20
> Best regards
> Uwe
>=20
> ---
>  .../devicetree/bindings/watchdog/gpio-wdt.txt      | 37 ++++++++++++=
++--------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> index 198794963786..ceb1a5f95f44 100644
> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
> @@ -2,27 +2,36 @@
> =20
>  Required Properties:
>  - compatible: Should contain "linux,wdt-gpio".
> -- gpios: From common gpio binding; gpio connection to WDT reset pin.
> -- hw_algo: The algorithm used by the driver. Should be one of the
> +- trigger-gpio: reference to the gpio connected to watchdog's input =
pin
> +  (typically called WDI).
> +- hw_algo: The algorithm used by the device. Should be one of the
>    following values:
> -  - toggle: Either a high-to-low or a low-to-high transition clears
> -    the WDT counter. The watchdog timer is disabled when GPIO is
> -    left floating or connected to a three-state buffer.
> -  - level: Low or high level starts counting WDT timeout,
> -    the opposite level disables the WDT. Active level is determined
> -    by the GPIO flags.
> -- hw_margin_ms: Maximum time to reset watchdog circuit (milliseconds=
).
> +  - toggle: Both a high-to-low and a low-to-high transition clear
> +    the watchdog counter.
> +  - level: Low or high level starts counting watchdog timeout,
> +    the opposite level disables the watchdog. Active level is determ=
ined
> +    by the GPIO flags of the trigger-gpio (with active meaning the w=
atchdog is
> +    enabled).
> +- hw_margin_ms: Maximum time to reset watchdog circuit in millisecon=
ds.
> =20
>  Optional Properties:
> -- always-running: If the watchdog timer cannot be disabled, add this=
 flag to
> -  have the driver keep toggling the signal without a client. It will=
 only cease
> -  to toggle the signal when the device is open and the timeout elaps=
ed.
> +- enable-gpio: Reference to a gpio that when inactive stops the watc=
hdog.
> +- disable-on-tri-state: property that signals that the watchdog can =
be stopped
> +  by setting the trigger-gpio to tri-state.
> +
> +Deprecated Properties:
> +- always-running: This property signals the watchdog timer cannot be=
 disabled.
> +  Without this property the watchdog is expected to turn off for hw_=
algo=3Dtoggle
> +  watchdogs when the gpio is set to tri-state.
> +  Don't use it for new device descriptions as it is misleading in th=
e presence
> +  of an enable-gpio.
> +- gpios: deprecated alias of trigger-gpio
> =20
>  Example:
>  	watchdog: watchdog {
>  		/* ADM706 */
> -		compatible =3D "linux,wdt-gpio";
> -		gpios =3D <&gpio3 9 GPIO_ACTIVE_LOW>;
> +		compatible =3D "adi,adm706", "linux,wdt-gpio";
> +		trigger-gpio =3D <&gpio3 9 GPIO_ACTIVE_LOW>;
>  		hw_algo =3D "toggle";
>  		hw_margin_ms =3D <1600>;
>  	};
> --=20
> 2.1.4
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
