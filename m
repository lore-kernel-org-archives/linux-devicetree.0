From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: dts: Fix Makefile target for
 sun4i-a10-itead-iteaduino-plus
Date: Mon, 05 Oct 2015 23:55:17 +0100
Message-ID: <1444085717.2956.0.camel@decadent.org.uk>
References: <20150904124934.GD464@hansolo.redhat.com>
	 <20150906112046.GK31584@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Qv6DY59isUIiFq5XLR1w"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150906112046.GK31584@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josef Gajdusek <atx-MwjtXicnQwU@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--=-Qv6DY59isUIiFq5XLR1w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2015-09-06 at 13:20 +0200, Maxime Ripard wrote:
> On Fri, Sep 04, 2015 at 08:49:34AM -0400, Josh Boyer wrote:
> > Commit 79ae3e66f8d (ARM: dts: sun4i: Add Iteaduino Plus A10) added a ne=
w
> > make target for the sun4i-a10-itead-iteaduino-plus dts file, but mistak=
enly
> > used .dts instead of the correct .dtb suffix.  This resulted in a build=
 error
> > like:
> >=20
> >         scripts/Makefile.dtbinst:42: target 'sun4i-a10-itead-iteaduino-=
plus.dts' doesn't match the target pattern
> >=20
> > when doing a make dtbs_install.
> >=20
> > Fix it to use the proper file name.
> >=20
> > Signed-off-by: Josh Boyer <jwboyer-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
>=20
> Queued, thanks!

This still isn't in Linus's tree; please make sure it gets to him
before 4.3.

Ben.

--=20
Ben Hutchings
compatible: Gracefully accepts erroneous data from any source
--=-Qv6DY59isUIiFq5XLR1w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVhL/1ee/yOyVhhEJAQqttQ//Um4Mhb82trygGL29APftDCwqwn6mDlPW
a+rd3XOJK6eP2wIaxviXnw7JYiFJROEexiWnG2m0Ll16AUTUCrfbPQAP5+g3y4Jy
6aEwV9Iqcgz+FNtFupaatCRlmOuiQbGzxsLWGoDSauFA9s4L/ZlZAAglkEFHhCtR
1H6NwqPOlu2jI7W6bBiS6lHmypIO6HG8orfkBfmup4xjBJ61G9wjJCDOCmPFBm7z
KWiiTOL1I+GD8PqjBjZIGxIs+4SHbyG5aKT0rXYMEoKQ5Ta+foJ3ReD94LGwlZIe
GaaheG4Wp7UzY3aqIL60/P+46FrcIltcaFk42pD6W+axHGX5VJy+B8vCx/HZhtN/
9Twb10Bshu0YeNWmnFr9PafkVwvIoIQL592ogLtiYn8DYYGIMkHAqAXOJ0ey7prA
LOZYjRCEW8PrPq3hWBizzaDNpgO9/z7ASKDclBFbtomURlw0cpEKnp6EZs1d667A
m8kGnnUUe4T+iyWkDRf3zUwi825Lhl7xKDBvqqqOcS6rvDubPeKSrzDtNhnMyXWX
vj8zBlWSEFzZ72O5+pLyFuBDnOudrRBiUNlUqt1JdPQ76EHuH1CZeRsrqd7RgBTq
D4p6Qud5ru5IT3mnQ4mvqetQfetexyE+ys944fMXpJbmBDKDH2ebV69MsFnekgmu
11yGXy2KImU=
=2quZ
-----END PGP SIGNATURE-----

--=-Qv6DY59isUIiFq5XLR1w--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
