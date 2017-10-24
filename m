From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] livetree: avoid assertion of orphan phandles with
 overlays
Date: Tue, 24 Oct 2017 18:07:34 +0200
Message-ID: <20171024160734.GE15297@umbus>
References: <1508854458-9937-1-git-send-email-t-kristo@ti.com>
 <CAL_JsqJAPKYf25pW-4awUHpovq-fxesG-E_rYjh8MGufVSYRBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJAPKYf25pW-4awUHpovq-fxesG-E_rYjh8MGufVSYRBA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2017 at 10:21:10AM -0500, Rob Herring wrote:
> On Tue, Oct 24, 2017 at 9:14 AM, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org> wrote:
> > Right now, check_interrupts_property fails with overlays, as the phandle
> > for the interrupt-parent can be orphan. Avoid this by allowing the orph=
an
> > node to pass the assert check.
> >
> > The process_checks() call is also moved later during init sequence,
> > so that we can use the global variable generate_fixups to check if
> > we are compiling an overlay.
>=20
> This is fixed by [1].
>=20
> David, BTW, you didn't push to kernel.org dtc repo. That's still the
> "official" one?

Yess.  I usually push to github first, wait for the Travis build to
complete then push to kernel.org, but I got distracted and forgot to
finish that.  Fixed now.

>=20
> Rob
>=20
> [1] https://github.com/dgibson/dtc/commit/c1e55a5513e9bca41dc78a0f20245cc=
928596a3a
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlnvZUAACgkQbDjKyiDZ
s5J68xAA0YJ6ldzdKV3fwOvEDNluWUssWbGmLuZngUWqAAAho8mzqDUH/CvuAHAs
ueebrY+pp965b6aTQdCWDTfELRmkkVx2gAVYpU5BIWNh0hFuzoh06JTgBfrcqggr
EePiEjlwK3yxrifpxP7ZJzZwn4Lta3pUGvRMM62v9HVx7j+vhGCSAX43iBIs06Oz
QK9xXvb/brcZ6bA1mZ+FeGHC/2tcpSFbz+QJ25wcZ1dUex4q1vP7//+LLabZWTFu
tQvFAJerTvASAUK+sTyGSyW61wCkWfTYqLPHobJ2ze/k3TdyPU+Z9Jfgdo2pbqx/
/xtCh9yP+4HJZiaO/B/FGFUydZLlMNB+nAkbEV8C12Vg2gXSdwXJkMVH8/JLxUpV
Tc7t1xxWh9/6P4Ag4bw9fN+BMHATNMgTpSvlM+bnHVQXLD2HSWlVM4Uf50/3fgZi
KCwnL9pXNI9t7TmqtYHLPd4xKu9FvTPGGLgzNxzB7DuD7vmD1Uoso9zRi9F3uONO
lMZ0g0XvWO3MbcmA0W78qRFlWw9ocagZ1kBvn3WdoCYm8zA4yvqW90d3VQmHTW2o
ltgWgpH3zGKferMZghwXluIOw2fWiYmqlFNEfk2EBZ943IgU+S+tsldVt2cHfeN8
7OwJ4oqudJZsc0uL0epDdY0CKfl5vq6OJkXS6ykJINa8EDYcDLY=
=GZd9
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
