From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Fri, 26 May 2017 11:12:18 +1000
Message-ID: <1495761138.7794.11.camel@aj.id.au>
References: <20170516075840.23130-1-andrew@aj.id.au>
         <20170525202808.GA9501@mai>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-PQplvb5ZorwME6CSctlQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525202808.GA9501@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-PQplvb5ZorwME6CSctlQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-05-25 at 22:28 +0200, Daniel Lezcano wrote:
> On Tue, May 16, 2017 at 03:58:40PM +0800, Andrew Jeffery wrote:
> > Also clean up space-before-tab issues in the documentation.
>=20
> Andrew,
>=20
> I reworked the patch to apply to the changes Linus did recently to conver=
t to
> the fttrm010 driver.
>=20
> Please have a look at:
>=20
> https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=3Dclocke=
vents/4.13&id=3D3ca904162ffdd72f4fad3ab731fc94a12c50f682
>=20

I think we're going to run into trouble here:

https://git.linaro.org/people/daniel.lezcano/linux.git/tree/drivers/clockso=
urce/timer-fttmr010.c?h=3Dclockevents/4.13&id=3D3ca904162ffdd72f4fad3ab731f=
c94a12c50f682#n260

As it stands if a aspeed,ast2500-timer compatible is provided we'll
take the else branch and hit the issues Joel found with Linus' original
series counting up on the Aspeed hardware.

My change was somewhat cosmetic - Ben (now Cc'ed) didn't seemed too
concerned about using the the aspeed,ast2400-timer compatible string
for ast2500 dts. My motivation for the patch was that by describing the
aspeed,ast2500-timer compatible it signals that someone had taken a
look and judged it so. However, my point is maybe one solution is
simply to drop the patch and continue to use aspeed,ast2400-timer
compatible where we need.

Another is to rework your change to switch to
of_device_compatible_match() in drivers/clocksource/timer-fttmr010.c
and also check against aspeed,ast2500-timer.

What direction should we go?

> Shouldn't the compatible string be:
>=20
> 	"aspeed,ast2400-timer", "faraday,fttmr010"
> 	"aspeed,ast2500-timer", "faraday,fttmr010"
>=20

Does it makes sense in the face of the Aspeed quirks? If so it seems
reasonable, but falling back to the faraday,fttmr010 compatible could
lead to failures (if the compatible driver counted up).

Cheers,

Andrew

>=20
> =C2=A0 -- Daniel
>=20
--=-PQplvb5ZorwME6CSctlQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZJ4DyAAoJEJ0dnzgO5LT5XBsP/2uYn7L09WELg3p8y8GEFbXk
dlPxh1NJH86gk8b/a/85EEtaA6cByXswIVEsYpQ4XfFWresfMdXqvuv0JRLafkhq
UkL4zbHNZC7Rcssj0i0G4gfZJBgn61oX+f5gActUoIw8cvgVeI5b2ScmPPay8FaE
wZCWNWIOtqZamO2VozYOOruoNcMOvJslHdgqqEmXENs8lqkNbn6PuqVi8vV/A6f8
0GGiSjMI4TEl0pDnOLT5KSa3n1hIhmMygj0ik2wWUFFIVqGtWy8iaHttatKNTEeG
P3U4X3GDO2gs583tMBAOS+fob0KAwzrTFOmcNiJKl0wzDd6U3g0IX0CcziZJn3Su
5JvLT6HP8DtorMJndsF4sPMw3J44F5RBzhmEWUqQEY8WU4E+rs9+djSawAjoGb8V
xCSjUANlrdbRJ+8EfkacvYA3ipKHY68cvM/3WfN18qYq7tsBGqjye4GEbXLC24J+
05FhGBpXMNXS/1XgPpax14OZxzb3ptZtISYWQY5CcS0MQ5Q0/xeEirVCjiiR2VIS
SperNTXDxBU4Zq8DSJm84BocR4TybiwwUAVrY88Mkrzq7B2TLRlUpcaQfmHgNemG
GwwgdaH8FglsL5WCmLGwMrR0vdXneSO8B05rhtS2kyjAMk4le+ag2g9J61QkPM+A
RP6spr9OxRdCFa2bS6dZ
=Ky7x
-----END PGP SIGNATURE-----

--=-PQplvb5ZorwME6CSctlQ--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
