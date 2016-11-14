From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: reference-design-tablet: ldo_io1 is
 vcc-touchscreen
Date: Mon, 14 Nov 2016 21:08:20 +0100
Message-ID: <20161114200820.xd2yoo6gfxgnegld@lukather>
References: <20161113192203.7101-1-hdegoede@redhat.com>
 <20161113192203.7101-2-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kt2mzwmjlggw4kog"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161113192203.7101-2-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kt2mzwmjlggw4kog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2016 at 08:22:03PM +0100, Hans de Goede wrote:
> On some Q8 and other tablets ldo_io1 is used as vcc-touchscreen,
> config at as such in sun8i-reference-design-tablet.dtsi.
>=20
> Note that it will only be enabled when it us actually referenced by
> a foo-supply property in the touchscreen node, so for tablets which
> do not use ldo_io1 as vcc-touchscreen, it will be disabled.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kt2mzwmjlggw4kog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYKhm0AAoJEBx+YmzsjxAgTCoP/3xhVBbxbnzB2D6mIY60hvDS
g3mdahN7eHGsJIR3wATc3jrilZG3GbggRU/uF5veRWZNJm/U7yEhtxV8reQ/jfxE
OrLvhZuOzHkKkaVmhaU5K2ar0D2dmh86VWccvmbRirj90ht5S3+wT0ME+cU8Y16l
ylHhwSrcCCsnZf1oQkwsEy6lJzvo8bK2rrhRVYFP0m+tzmgkZK3si8D273VtBF7c
T/vkUv9DOpE8hfBD8XC/xDCThMi4bHgS6xly6qoafqDX7Vp3Zx4goi2HNy6yApBD
1i+/mivBCZCyCECK8kPYdSPrQXLVMWwLIOTNFDhwc9poaIwspVO7qZtS1p+Fz/MQ
csbf0c+6NXmHKuLd3rkU5ydZatQayihzjugQVB4wGISdD/ktbj1ItQvrCN11HWqW
vsKrfOqZ01UwLVoXXNQZmhR3gpAqnRp3/zw9vyZXVHVWWoZwcnDO2RNQM9GBtuo2
PTHJ0h7AqEKGkb8lm94ZKlDZf9OwDetSNmDQkh/BcfI4y62XPj3XdN4cgg9iJf3R
zvow+3V8eb1SwLQ/4Gv6hDtieItO65JWVlHol552WseXI5tvXwDBoxyibJYBi5dV
NukH+08DVuguOc0GPZmZ0nr10t+Gjnss2fyhnJ6XXCZ6nJ0U7oeBPO4ODT8GOM46
Si50MWod+FYN+3QgI3Pf
=nrPS
-----END PGP SIGNATURE-----

--kt2mzwmjlggw4kog--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
