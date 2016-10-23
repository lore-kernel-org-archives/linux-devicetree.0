From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH v3 0/2] media: add et8ek8 camera sensor driver and
 documentation
Date: Sun, 23 Oct 2016 20:17:52 +0200
Message-ID: <20161023181752.GA11728@amd>
References: <1465659593-16858-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <20161023073322.GA3523@amd>
 <53284bf5-9a36-fbcb-5cac-4a64823c3516@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53284bf5-9a36-fbcb-5cac-4a64823c3516-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sakari.ailus-X3B1VOXEql0@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>This series adds driver for Toshiba et8ek8 camera sensor found in Nokia=
 N900
> >>
> >>Changes from v2:
> >>
> >> - fix build when CONFIG_PM is not defined
> >>
> >>Changes from v1:
> >>
> >> - driver and documentation split into separate patches
> >> - removed custom controls
> >> - code changed according to the comments on v1
> >
> >>Ivaylo Dimitrov (2):
> >>  media: Driver for Toshiba et8ek8 5MP sensor
> >>  media: et8ek8: Add documentation
> >
> >Is there any progress here? Is there any way I could help?
> >
>=20
> There were some notes I need to address, unfortunately no spare time late=
ly
> :( . Feel free to fix those for me and resend the patches. If not, I real=
ly
> don't know when I will have the time needed to focus on it.

So good start would be taking these two, address the comments, and try
to merge them?

Date: Sat, 11 Jun 2016 18:39:52 +0300
Subject: [PATCH v3 1/2] media: Driver for Toshiba et8ek8 5MP sensor

Date: Wed, 15 Jun 2016 22:24:40 +0300
Subject: Re: [PATCH v3 2/2] media: et8ek8: Add documentation

Thanks and best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlgM/tAACgkQMOfwapXb+vLXZwCgkKFaHLnibgr1W/pCPbJD31au
UUcAoKJtDjhWyrtd6HuxxOtAYKUv9x4X
=dR7m
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
