From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCHv2] dt: bindings: Add support for CSI1 bus
Date: Mon, 6 Feb 2017 10:53:25 +0100
Message-ID: <20170206095325.GB17017@amd>
References: <20161228183036.GA13139@amd>
 <20170111225335.GA21553@amd>
 <20170119214905.GD3205@valkosipuli.retiisi.org.uk>
 <20170203115045.GA1350@amd>
 <20170203141649.GC12291@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170203141649.GC12291-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >  - bus-type: data bus type. Possible values are:
> > -  0 - MIPI CSI2
> > -  1 - parallel / Bt656
> > -  2 - MIPI CSI1
> > -  3 - CCP2
> > +  0 - autodetect based on other properties (MIPI CSI2, parallel, Bt656)
>=20
> In the meantime, I also realised that we need to separate MIPI C-PHY and
> D-PHY from each other. So I think we'll need that property for CSI-2
> nevertheless. How about:
>=20
> 0 - autodetect based on other properties (MIPI CSI-2 D-PHY, parallel or B=
t656)
> 1 - MIPI CSI-2 C-PHY
> 2 - MIPI CSI1
> 3 - CCP2=20
>=20
> I wouldn't add a separate entry for the parallel case as there are plenty=
 of
> existing DT binaries with parallel interface configuration without phy-ty=
pe
> property. They will need to be continue to be supported anyway, so there's
> not too much value in adding a type for that purpose.
>=20
> I do find this a bit annoying; we should have had something like phy-type
> from day one rather than try to guess which phy is being used...

Ok, v3 is in the mail.=20

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAliYR5UACgkQMOfwapXb+vKbQgCfZcD0wvvPNU5xFNRC+VhSubIa
GUcAoLFbA7vD8EsHlXlD+wOf4xM9GguQ
=Ns6S
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
