From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 4/5] dtc: Plugin and fixup support
Date: Tue, 31 May 2016 15:06:34 +1000
Message-ID: <20160531050634.GJ17226@voom.fritz.box>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464112239-29856-5-git-send-email-pantelis.antoniou@konsulko.com>
 <20160527073306.GA17226@voom.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E2AOuUyqcJWq6+RR"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160527073306.GA17226-RXTfZT5YzpxwFLYp8hBm2A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--E2AOuUyqcJWq6+RR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 05:33:06PM +1000, David Gibson wrote:
> On Tue, May 24, 2016 at 08:50:38PM +0300, Pantelis Antoniou wrote:
> > This patch enable the generation of symbols & local fixup information
> > for trees compiled with the -@ (--symbols) option.
> >=20
> > Using this patch labels in the tree and their users emit information
> > in __symbols__ and __local_fixups__ nodes.
> >=20
> > The __fixups__ node make possible the dynamic resolution of phandle
> > references which are present in the plugin tree but lie in the
> > tree that are applying the overlay against.
> >=20
> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>=20
> So, I think I've identified the underlying thing which was bothering
> me about these patches.
>=20
> With the new dynamic patching stuff, "overlays" (for want of a better
> term) now have a real existence both in the dts source format, and in
> the dtb object format.  However, these patches don't give them a
> concrete, explicit representation within dtc itself - instead we just
> kind of mangle one representation to the other as we're parsing.  I
> think this is a mistaken approach.
>=20
> I'm toying with some patches to give overlays a full representation in
> dtc which I think will handle these cases better - and allow for
> easier experimentation with different possible ways of encoding the
> overlays.
>=20
> One side point - writing plugins in dts format leads to an irritating
> little ambiguity in the grammar.  Well, not an ambiguity technically,
> but a place where we need more lookahead than normal, meaning we get
> shift/reduce conflicts.  It arises because both memreserves and
> overlays can have a label in front of them.  So, if we see a label as
> our next token after the version tag, we don't know if a memreserve or
> overlay is coming next, so the parser doesn't know which path to go
> down (with a single token lookahead).  We could handle it with
> %glr-parser, of course, but I have been trying to avoid that.  I think
> this will apply both with your patches and with the approach I'm
> working on - not sure what to do about it yet.

I now have a first cut at said experiments, see:
    https://github.com/dgibson/dtc/tree/overlay

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E2AOuUyqcJWq6+RR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTRvaAAoJEGw4ysog2bOSj0QP/jS5roflqBMK+ClKTxEM2WgL
6e8DtYkrpN3qRQtSv/FWQj0XeimUvL6gBOLkoGICUQaiPZ1LVVjMFsotJxuHLluM
BohpRb7mOe2wc6UTK4u9uIVnpKWNsZ37pLnhYRNPjsH0n0pESa64Uve299rAWAwh
PRtMAECWw8H652E7Sw9DIY00fdXFzpdw0JFqg9BT2qDk9DTe72DO6sHkASAmGzr9
fC/d10dDvkQ1bb+nOGEQ6PsmYqvF4Rs/lj45oyRNWL5CjQ7c9RjMaN+7MZygwlB6
a9V2wti9jiKtEdpaP5QeJhXR2iruZow4RFZlDjCNXyb+FcaGDQ/2cgdj153qFXcU
+kxXcv2oB6B+SXOCGKMZDFqT7oo4W48n4B2H5uNYVlO1EabU6bQmyyk5JK/FILdI
XwSpuvRyShhuF7nmaNhBLwbHowuMsAVw9h8QOpwxzDLkXreU0Xsec5zQIrhWb7mU
H+Ga888bliIfQ3u4xMunsU23cffRCxseLJyVJ49DpAfkD9F00KJtP6vnMkCt0Ogp
xKUakXOeBwRidCH4ow0ugWKHZq93EHYHRGIolioWB+dZNScklEszkLun+EzkA+1c
3oaysvkojuUKw9H0Xa91RKXFxoVG5jz22w+bAPClbdXTjWcHgpVnUnT1VwYL8b2j
UdGon7vQ2Y63uZKxInfD
=9nzK
-----END PGP SIGNATURE-----

--E2AOuUyqcJWq6+RR--
