From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 00/10] add pinmuxing support for pins in AXP209 and
 AXP813 PMICs
Date: Tue, 5 Dec 2017 09:55:58 +0100
Message-ID: <20171205085558.ernawgdgybd4lzxx@flea.lan>
References: <cover.3ff63fdf302c6bda02ea7d160ad2aa5afee0899d.1512135804.git-series.quentin.schulz@free-electrons.com>
 <CACRpkdaMxaLjsDETm6_56tyGDu6=W0L4SQCAA2mmSR4mkR-jAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xlguvviawpatacuj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaMxaLjsDETm6_56tyGDu6=W0L4SQCAA2mmSR4mkR-jAA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xlguvviawpatacuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2017 at 05:00:03PM +0100, Linus Walleij wrote:
> On Fri, Dec 1, 2017 at 2:44 PM, Quentin Schulz
> <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > The AXP209 and AXP813 PMICs have several pins (respectively 3 and 2) th=
at can
> > be used either as GPIOs or for other purposes (ADC or LDO here).
> >
> > We already have a GPIO driver for the GPIO use of those pins on the AXP=
209.
> > Let's "upgrade" this driver to support all the functions these pins can=
 have.
> >
> > Then we add support to this driver for the AXP813 which is slighlty dif=
ferent
> > (basically a different offset in two registers and one less pin).
> >
> > I suggest patches 1 to 8 go through Linus's tree and 9 and 10 via Maxim=
e or
> > Chen-Yu's tree.
> >
> > v4:
>=20
> Looks overall good. As soon as Maxime is happy with everything I will
> happily apply 1-8 to the pinctrl tree and then pull it to GPIO as well to
> avoid clashes.
>=20
> I think there were some minor comments but it seems almost finished.

You can apply everything with my
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

The only comment left is the checkpatch warning, but there's multiple
occurences of that issue in the driver, so it can definitely be done
in a separate patch.

(But please do it Quentin ;))

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xlguvviawpatacuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlomXxoACgkQ0rTAlCFN
r3RvYw/9HAyKPI6MVsZfBMuGtO8Ppdk3YQTl2CaGiI4h3hcCsOw4edTH2HsUJpQm
iS/ZFOgnpLNY0QY8AgeM08PR2vLuvIIz+YC95mKdm4Wnjp+pIm6Q0+qdXj/i0jY/
qqeeC7HvphRQdR46khQoLCwpilMJyp1NFRm2zym1FVpHaVX+kdK8e3ibSvDvUxHy
/kMYsiLOuDKAfjhtfNiR4PFaqSYBT5mAlZ92R2C+Bide5awqO2yWWhYHv30qQTA4
3fkm3STLnDpry/eF33sJyDT3YU7TmxQvoNkamIuYCCzAXpJbhkPL+AkX57NOXZ5k
+/XBPa63pREU9f+aDGTPh05gMV3Te2ND3v+3J+9/Imnr4Y0K90B/SydASW8I0F94
3hIE20qz0njG0x4XMVuyc8pgg59qdRwgHvH/c3gXH2Rikbmq6FOC47V2yzgaCrmJ
2qt9AxMuUrwB2qVLdD05Yf7iZ+xk2otAiNUg5NzHRffZyqIt3sjNzDEmw5aTIUZR
F2QJFIsKtqKXfapYqagNXjjHUNTTKm2UtjiI3dDsNAZv8Nt0RdR/P+VqvU+a3J1z
GuJzEVDt+Us7IohLiUMZIRq16c/BOmlSJCqIvYxOtGkC1LD2h5PeTbZD6qjDvWDA
fIq+GMUtu4JTJHIXt9IA9KGhJeew8fyletulQix+v+E8XsmKutY=
=gMWJ
-----END PGP SIGNATURE-----

--xlguvviawpatacuj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
