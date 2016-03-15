From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: Do not set constraints on
 dc1sw regulator
Date: Tue, 15 Mar 2016 19:29:54 +0100
Message-ID: <20160315182954.GH30977@lukather>
References: <1457552339-400-1-git-send-email-hdegoede@redhat.com>
 <1457552339-400-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uwB7x3tnyrZQfZJI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457552339-400-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--uwB7x3tnyrZQfZJI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 08:38:59PM +0100, Hans de Goede wrote:
> dc1sw is an on/off only regulator and as such it cannot have constraints.
>=20
> This is a limitation of the kernel regulator implementation which resolves
> supplies on the first regulator_get(), which is done after applying
> constraints, and applying the constrains will fail because it calls
> _regulator_get_voltage() and _regulator_do_set_voltage() both of which
> will fail on a switch regulator when there is no supply (yet).
>=20
> This causes registering of all axp22x regulators to fail with the
> following errors:
>=20
> [    1.395249] vcc-lcd: failed to get the current voltage(-22)
> [    1.405131] axp20x-regulator axp20x-regulator: Failed to register dc1sw
> [    1.412436] axp20x-regulator: probe of axp20x-regulator failed with er=
ror -22
>=20
> This commit removes the constrains on dc1sw / vcc-lcd fixing this problem
> note that dcdc1 itself is contrained to the exact same values, so this
> does not change anything.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued this as fixes for 4.6.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--uwB7x3tnyrZQfZJI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW6FSiAAoJEBx+YmzsjxAgym4P/RCT4OOcTgBvyY78ikxkSjcw
0BQMYOoD6/8SJyN+ZkyGx70Q8v7SmXi8u6CpbU49SJ2jHrh9lwJrLT+KBEVWJYe2
36oARY97c43DnXDPaewEvPvEDJOQVkQ4zobYALcrqMCv1c6tiR6K7BmBhw80IjEZ
sU3H3mh9SVYWnyi5IOK7YnALjc9ik2eRVAmELl8m/bbA8Qa/veE1bXyiTD3aJSiI
hOJmraX+YUIWBqn1Lkrs3854uABs96HRFg15GHxy0HqTBp/JtPqsBbADx8tjjD2Q
jBaixlZN2aVJHY8/PsaV4dwx9J24R7zEtjZwm2D2CJ4vk2wLRmOK/OLAiniTsTp8
OW5qI3/vyXdTpRYwCZvJpX+laBldQZ2zpcE2rKs8hU+SGUMZ0mbQ9hjaU1gpnZI4
WNIWanv3mH9AMgYkFUdt4k3u+rdRFzAoNxabAHndyq6QBKgLbB0KB01Pk+n4jh2b
5FILqCq7mkXUO1rSKH1tBvur+Xq4iR5PcskoYv3muFM3uFCFv5KTarepghWOp7N9
1Clj6fgl+gD0vdfX7j9ztPpQhrecjJE7HmRJLTtK+FA9eyeLX1Yypi8XtihM+1j9
ljG1+dACHy/Typ8UJd/kgeDHTj632FjlVRSlkmRBeACWhTIfY83yX7xk7nkxqPRp
QW6CAaxANC4Z3S+u1S+E
=uLMC
-----END PGP SIGNATURE-----

--uwB7x3tnyrZQfZJI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
