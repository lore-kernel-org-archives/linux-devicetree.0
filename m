From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: gpiolib: Expand sleep tolerance to include
 controller reset
Date: Thu, 26 Oct 2017 11:10:53 +1030
Message-ID: <1508978453.13477.7.camel@aj.id.au>
References: <20171025050417.27992-1-andrew@aj.id.au>
         <20171025050417.27992-2-andrew@aj.id.au>
         <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-gRK8or06tBXp9hQzQC25"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171025083201.wdudlzgphypyhmwc-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mwelling-ei31t81uNw5BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-gRK8or06tBXp9hQzQC25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-25 at 09:32 +0100, Charles Keepax wrote:
> On Wed, Oct 25, 2017 at 03:34:16PM +1030, Andrew Jeffery wrote:
> Reset tolerance is added to gpiolib with the introduction of a new
> pinconf parameter propagating the request to hardware. The existing
> persistence support for sleep is augmented to include reset tolerance
> if the GPIO driver provides it. Persistence continues to be enabled by
> default; in-kernel consumers can opt out, but userspace (currently) does
> not have a choice.
>=C2=A0
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.=C2=A0=C2=A0I feel that renaming to just *_MAY_LOSE=
_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
>=C2=A0
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
>=C2=A0
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
> I'm not wedded to the names 'transitory' and 'persistent', so feel free t=
o
> paint the bikeshed some other colour.
>=C2=A0
>=C2=A0
> I am happy enough with the names.
>=C2=A0
> =C2=A0drivers/gpio/gpiolib-of.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++--
> =C2=A0drivers/gpio/gpiolib-sysfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 14 +++++---
> =C2=A0drivers/gpio/gpiolib.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 58 +++++++=
+++++++++++++++++++++++---
> =C2=A0drivers/gpio/gpiolib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A02 +-
> =C2=A0include/dt-bindings/gpio/gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 ++--
> =C2=A0include/linux/gpio/consumer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A08 +++++
> =C2=A0include/linux/gpio/machine.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 +--
> =C2=A0include/linux/of_gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 =
+-
> =C2=A0include/linux/pinctrl/pinconf-generic.h |=C2=A0=C2=A02 ++
> =C2=A09 files changed, 84 insertions(+), 18 deletions(-)
> @@ -2424,6 +2428,46 @@ int gpiod_set_debounce(struct gpio_desc *desc, uns=
igned debounce)
> =C2=A0EXPORT_SYMBOL_GPL(gpiod_set_debounce);
> =C2=A0
> =C2=A0/**
> + * gpiod_set_transitory - Lose or retain GPIO state on suspend or reset
> + * @desc: descriptor of the GPIO for which to configure persistence
> + * @transitory: True to lose state on suspend or reset, false for persis=
tence
> + *
> + * Returns:
> + * 0 on success, otherwise a negative error code.
> + */
> +int gpiod_set_transitory(struct gpio_desc *desc, bool transitory)
> +{
> +	struct gpio_chip *chip;
> +	unsigned long packed;
> +	int gpio;
> +	int rc;
> +
> +	/* Handle FLAG_TRANSITORY first for suspend case */
> +	if (transitory)
> +		set_bit(FLAG_TRANSITORY, &desc->flags);
> +	else
> +		clear_bit(FLAG_TRANSITORY, &desc->flags);
> +
> +	/* Configure reset persistence if the controller supports it */
> +	chip =3D desc->gdev->chip;
> +	if (!chip->set_config)
> +		return 0;
> +
> +	packed =3D pinconf_to_config_packed(PIN_CONFIG_RESET_TOLERANT,
> +					=C2=A0=C2=A0!transitory);
> +	gpio =3D gpio_chip_hwgpio(desc);
> +	rc =3D chip->set_config(chip, gpio, packed);
> +	if (rc =3D=3D -ENOTSUPP) {
> +		dev_dbg(&desc->gdev->dev, "Reset tolerance not supported for GPIO %d\n=
",
> +				gpio);
> +		return 0;
> +	}
> +
> +	return rc;
>=C2=A0
> This means that if we have a set_config we are directly
> equating PERSISTENT to RESET_TOLERANT, which seems wrong to
> me. I might have a GPIO on a controller with pinconf that
> doesn't have anything to do with RESET_TOLERANT. Should the
> PIN_CONFIG_RESET_TOLERANT, really just be PIN_CONFIG_PERSISTENT?
> And then its upto the driver what persistence means for that
> chip?

Right, maybe I'm tying the design in a bit too closely with the Aspeed hard=
ware
again. I'm coming out in favour of changing it based on my thoughts below.

However, I want to understand whether there are alternatives to reset toler=
ance
as a property. The obvious one is sleep persistence as implemented in the
Arizona driver, but it didn't take the set_config() route with its initial
implementation.

The set_config() approach was largely driven by the sysfs patch in
the RFC series, because I wanted a way to propagate the desired property
to hardware without affecting (or again calling through the handlers for) t=
he
export state or direction. It seemed to come out neat enough in general so =
I
kept it.

Were you thinking of using set_config() to control the Arizona's behaviour =
and
do something other than the calls to gpiochip_line_is_persistent() in
arizona_gpio_direction_{in,out}() (as in, keep the state inside the device
driver rather than querying gpiolib where the state is currently stored)? T=
hat
would seem neat in that it gives us one method of setting both persistence
types (and in this case I should rename the pinconf parameter). With that w=
e
could probably get rid of gpiochip_line_is_persistent(). A small downside i=
s
some duplicated state (we probably still want to keep FLAG_TRANSITORY in
gpiolib).

Would it be reasonable for other drivers to implement sleep persistence in =
the
same manner as the Arizona driver currently does? If that's the case, I don=
't
think there is a third tolerance option in addition to sleep and reset, and=
 so
we might not need to rename the pinconf parameter.

Finally, we could implement reset persistence in the same manner as the
Arizona's sleep persistence (with gpiochip_line_is_persistent()) given the
sysfs patch has been thrown away.

So to summarise, having rambled a bit, I see the situation as:

1. Rename the pinconf parameter, and patch the Arizona driver to use
=C2=A0=C2=A0=C2=A0set_config() and hold sleep persistence state internally.
2. Drop the pinconf parameter and do something similar to the Arizona's sle=
ep
=C2=A0=C2=A0=C2=A0persistence for reset persistence in the Aspeed driver.
3. Keep things as proposed are and live with two approaches to persistence

Point 3 seems like the least desirable. I'm leaning towards 1. I could prob=
ably
live with 2. after experimenting with it and confirming it's workable for m=
e.

If you think 1. is the way to go are you happy for me to send a patch to th=
e
Arizona driver implementing the change?

Thanks for the feedback!

Andrew
--=-gRK8or06tBXp9hQzQC25
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ8S8VAAoJEJ0dnzgO5LT53kcP/A7cRmmjb9RB2ejvb1rBJHdu
ZmavXgkJ5czHv+a0JCE3h1LNCR61dSSNtXkVFjdYimX3J9ndEqzbMvoxlC0Kmgfd
zlyc+NM9ZlBHva8AlY3AY5kt5PgnKwgybHf8OViWc/1GSjuuXLHtfJH+WcXTS9Dy
Sc+5qoFSlYk0Ybxn3BJ0jufYRAle7nzE8Fel9VITS4oLMGZS8JkE4ZBIrrASMRpu
d2cXdkE7w7oyNNEyaSQdYCassmKMMb++qeAiOD+Q0D1zUxvFqcbCxTRKa4OVfwc0
HXnA9ur6ySyr2dxmGaPlCOnMrxCAOi6EP3uzaAr9j0JsF4nZDimBJVZVMlTeZoak
6O1fcAJw/nB3KVgSZfo6D5PTuC0s6GvE9RHGLiOeGBEX7bHsUqhkaLnlMa9Uw9IS
4M/3nUJ0oob4bcXeAwbqCU1kAHane/GxEgqwViE2YinPP2BoagllXRTYtkF83Al7
8efC/MSTgMpJRC24iDuH3hmCFuDJ+FHQzknEXD9PAsLkSNQOWzGkabQ+tioJeLS2
5IiQ1U2jUkAOfUIoNaPzE2o+M8SPMRT6pEF5w9f1sKYHcNssQpIJow6QIJRLUp6P
lVZa5GCsDthA102BySFRcMG/N7QyvROo51hsFonxPC9+7pzwJg7cjB6cbJPbputD
yzrhTyNs6QVY02Jefzij
=g0+D
-----END PGP SIGNATURE-----

--=-gRK8or06tBXp9hQzQC25--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
