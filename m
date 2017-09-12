From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 10/13] openrisc: add simple_smp dts and defconfig for
 simulators
Date: Tue, 12 Sep 2017 09:47:02 +0200
Message-ID: <20170912074702.GA25921@amd>
References: <cover.1504129273.git.shorne@gmail.com>
 <37f0d48de4690694c18be3d32483dafee0730859.1504129273.git.shorne@gmail.com>
 <20170911223712.GA31546@amd>
 <CAAfxs76zOKM3vs=9_vwpNnceua-THV=h6Y4xAtg-kU=wpRq46g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAfxs76zOKM3vs=9_vwpNnceua-THV=h6Y4xAtg-kU=wpRq46g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-09-12 07:55:18, Stafford Horne wrote:
> On Tue, Sep 12, 2017 at 7:37 AM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
> > On Thu 2017-08-31 07:03:11, Stafford Horne wrote:
> >> From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> >>
> [...]
> >> +++ b/arch/openrisc/boot/dts/simple_smp.dts
> >> @@ -0,0 +1,58 @@
> >> +/dts-v1/;
> >> +/ {
> >> +     compatible =3D "opencores,or1ksim";
> >
> > You may want to add some comment on top, explaining what this
> > is... and perhaps link to some page documenting how to set up
> > qemu/FPGAs?
>=20
> Sure, I can create an entry in Documentation/devicetree/binding
> documenting this since its been there for a while but was never properly
> documented.

Yep, Documentation/devicetree should be mandatory.

> But, just to be clear, what do you mean by page?  Are you suggesting
> linking to a web page?  Or do you mean something in Documentation/...?

Whatever works for you. Maybe Documentation/ would be better...
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlm3kPYACgkQMOfwapXb+vKUUgCeMVUxB81MItaN4Iu0ibG48JE/
tOQAn3rcAM4gNnRtKoDDSUnaUhmwLe61
=Ed0c
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
