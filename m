From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun4i: The blue led on the Mele A1000 is a
 power led
Date: Sat, 11 Jun 2016 17:45:33 +0200
Message-ID: <20160611154533.GE19854@lukather>
References: <1465129393-22379-1-git-send-email-hdegoede@redhat.com>
 <20160607212419.GE14179@lukather>
 <0acb666e-3fa7-fb10-4c0d-1d7990f9eaa6@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0acb666e-3fa7-fb10-4c0d-1d7990f9eaa6-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 03:23:31PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 07-06-16 23:24, Maxime Ripard wrote:
> >On Sun, Jun 05, 2016 at 02:23:11PM +0200, Hans de Goede wrote:
> >>The blue led on the Mele A1000 is wired to light up as soon as the board
> >>has powered (it will be on while the gpio is still in input / floating
> >>mode), also its location on the top-set box clearly signals "power led".
> >>
> >>Until now we've been treating this as a generic usr function led, which
> >>means that when you plug power into the top-set box, the power-led ligh=
ts
> >>and then turns off as soon as the kernel loads, which looks wrong.
> >
> >I'm not sure I understand the relationship between usr vs pwr led and
> >the fact that it's disabled.
>=20
> There is no relation, other then that pwr leds typically have
> default-state =3D "on"; set whereas usr leds do not.
>=20
> >>This renames the led from a1000:blue:usr to a1000:blue:pwr and marks
> >>it as default on, fixing this.
> >
> >however, the default on might. Is it just a confusing commit log, or
> >am I overlooking something?
>=20
> Just a slightly confusing commit log.

Ok, applied all three.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXDIdAAoJEBx+YmzsjxAgmNUP/2OQbvxvxVakaE05SaYiP2vr
gEX+38qPPqkfz5WrrQua8SAHI92H2ghoSwmX0KDSsUDiTSqvkvIOho9h2hz9Ad95
IZuLl16A5bw/f4MrIA+e7M3K5MWKzRztDrvp8sfZNN6mXBDTff+1GwrrdKiKz9z1
mFSws1eEOpHz3war4Y0P/AixWSL52IPuvQUcNHqrYtNe2r2wjOD9MVXpX+Elkacp
JPUXuvmLsZYjc9NYxzQ3EiOxmonBpjMFJQhDD/qy4PHz7mMkPzSaZLnhDn9cit67
MkmuY1ISvp6Yef1NmI5/GYFzHunc3IgAqp7Fzc7BgUYIWah411nGtasVGRN3idkb
Y98t3PCQt4F4uO/LJ5vfxxgr4emGLR6wd/aI51Q5VA+goQi8Kf7120O1z75Zrc5e
5zLpdoDLWWwAEX6HLfcIaPJ4F9A2et3Us3X5VW8znkvo+wcGR5Xt1i+/ioGFhvpK
Ep780bBvUvOasreOEqbn/bC8Cgt5E+WPsrc1Ebsu8vxqhpl2rt+oIy+EO+FHuBlR
+KOW64f8wptYgimvhtfQPRmhvnghdXqbKYZQi5aFNp3H1k2yaiPcl6xZxDg5VB73
IjA1hzwcXQpwG48HE9I4WYx9f5EhI5ZcHPB4+0K2IIEGt2i0wwSKBMF5LfwVtdCL
x4zkFMUvxPzeIk53kWYf
=KFKU
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
