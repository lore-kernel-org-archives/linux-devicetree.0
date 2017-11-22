From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] checks: add a string checks for label, bootargs and
 stdout-path
Date: Wed, 22 Nov 2017 14:12:31 +1100
Message-ID: <20171122031231.GE2380@umbus.fritz.box>
References: <20171117144515.10870-1-robh@kernel.org>
 <20171117144515.10870-2-robh@kernel.org>
 <20171120000954.GF19214@umbus.fritz.box>
 <CAL_JsqJUpgBC1awgTZgz3pwhYUL02ES=E-ogqVONxDFjg8eSag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJUpgBC1awgTZgz3pwhYUL02ES=E-ogqVONxDFjg8eSag-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2017 at 11:26:49AM -0600, Rob Herring wrote:
> On Sun, Nov 19, 2017 at 6:09 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Fri, Nov 17, 2017 at 08:45:11AM -0600, Rob Herring wrote:
> >> Add more string property checks for label, bootargs, and stdout-path.
> >
> > Where does 'label' appear?  I'm not immediately recalling it as a
> > property with global meaning.
>=20
> It's documented in DT spec/ePAPR. It can be anywhere. It's the
> property for the human readable identifiers such as the label on
> ethernet ports, serial ports, LEDs, etc.

Ah, ok.  I'd completely forgotten about that one.  Ok, that's a fine
check then.

> > bootargs and stdout-path are from /chosen of course.  I have some
> > mixed feelings about whether it's reasonable to check it's a string
> > everywhere, rather than specifically just in /chosen.
>=20
> We don't really want to see the same property names with different
> meanings.

Hm.  As a rule of thumb, yes, but I don't know that it's super
important for properties that aren't very common.  Even then /chosen
is really special.

> I think checking the location is a separate check. You've
> generally suggested splitting up tests rather than have all in one
> tests. Not sure if we should check known properties only appear in
> chosen or that chosen only has known properties (assuming we can
> enumerate that list. Maybe we allow things like "linux,*").

I think for now a better approach would be to add one or more checks
specifically to validate the /chosen node.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAloU6x0ACgkQbDjKyiDZ
s5LGqQ//S/JR2SZ0ItSarHZXXfEO5iDF+fAHCeKwy+MLPqr8zBtLWWObGnNIMiPx
rz5N6w8qTM6yM8H7wa1eRazEXdHxqiUwJpZaXfKGHEtJ2hHs2NdRqPEaoly1eF7C
e4TsiF14qbakzmj1UiK6qlAjimnNW4UmpyA8Nb+K2L+4zcwtNlDgAZVstlZWvCN3
otJIdhWWCBrUTHt9G73r1UErs7lmvC0VKQuN8fhZsDJMJf7XDrrFKyEleKqYnPiA
VU7TPhn05vUTo7uZjVzxIGrapliriNEPnZcyft9/PxnlhRuwWujf5T786DRJBdIu
F812s/hXRTeNPQ9mK/UmJ4kR8RRL+i5G7bkssGWQXOZqD5QGasqt7yr/gukZp+QY
AzcwfgtUn8gyo7lJLIZvKAZu984gKKzoGoS4AgD6QeCfy8M7lOLU00JU8l2Fid0S
tkKo9vQbahvYwUnoajYxBsZVqDR6QvdNE3lMrLhUvAmnzzljc2PXKTO0IHdcphKm
DSijhTfg2jzuSlTy1dNJhJsX/qFR0gduocJ4CG7jUQzIslU4sxt9bupaFqQhhbMi
gtj+JkxsBeFsrSYyvdYcxSW+LH0pJTTjaD1jHlX/rdtLiHFxLGJjqcyuKequgLbq
epynxXmJXGbatSRpHGwN3liaYEcZkK9ZZXg7Lfd+hOsb0X+3JkA=
=fcCI
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
