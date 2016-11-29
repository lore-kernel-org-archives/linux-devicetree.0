From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v10 3/4] dtc: Plugin and fixup support
Date: Tue, 29 Nov 2016 13:11:31 +1100
Message-ID: <20161129021131.GD13307@umbus.fritz.box>
References: <1480077131-14526-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1480077131-14526-4-git-send-email-pantelis.antoniou@konsulko.com>
 <20161128041228.GJ30927@umbus.fritz.box>
 <D69908BD-B243-4AEE-B6BA-80B94AFE4B6A@konsulko.com>
 <4672e164-aae0-6306-fe70-146a1f930cf7@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4672e164-aae0-6306-fe70-146a1f930cf7-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 12:24:20PM +0000, Phil Elwell wrote:
> On 28/11/2016 12:10, Pantelis Antoniou wrote:
> > For plugins we need the __symbols__ node to support stacked overlays, i=
=2Ee.
> > overlays referring label that were introduced by a previous overlay.
> Although it is arguably useful to be able to refer to symbols created by
> one overlay from within another, do we really want all symbols to be
> global? Isn't there a call for a new syntax or usage pattern to indicate
> either that a symbol should be local to the overlay or, my preferred
> option, global?

So, this is back to a design question about the overlay format.  As
noted in the initial discussions about possible "connector" formats, I
think we will want some sort of local symbols.  But the current
overlay format with all global symbols is out there and we need to
support it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYPOPTAAoJEGw4ysog2bOSga0P/i2VLRUAAtE1cHe2MVYL+leC
b6YLygd9cqaCRnz1v//7eCsl7VwT0KKdI99y0TCzYrMU8nYBHFEYSBF7lSSDhR46
cZ3NsIRcuRi9e+V7CBCyHUHNJLJTUnyNev+DX/8EQjb+BWPh6g44pTF/0tJaodpr
X9vy0hFlof4bE5KyUtz6nX9ucluUX57HSl67bB8qIyKPoC0uzu3wIPXrYwnf3DfK
5OvXsho7YQd629tXWe2lT9yJ06kpMoAu7P2idjZ4vTNcmvtCLutZ+PaU4QM9M6ZX
eVaeAgMoeeHBNl/WAOgbaYTW/YTBg3CO4t/L+2ARioolExAqQzxzf94GPEEAuMro
u6OqOIOtRI+b16NSkOPmHldpz9DxOqlQm7xqpocBtz1EMEXNTZJNvFeLQP2GhqOU
stJPlgUkZgNXlF72HsRjeQvb8nLeK5vGx8JaNL4w+je1br1xrAAfdFDxu+xXDbnM
+gI2YW9N/nsf/3WZsOOiHVLRcUvmw36xeBfecP7Jqig2/Mr1qxYO3ZQSDdUGHo4j
1xAqZC5OZF3OQsuYzQeHtw2ZXtiqq60cvyib5DJbUX3Q2kadE7nLlthddoNGjO7j
B3OwsCjQGD6zw5hDuk8EiL7wo74JMNsgeMiVblIvADhzDMQpT37pX4HUQfZKVnN3
3d6/zZyw6CtQVtyRApxp
=o++n
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
