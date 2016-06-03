From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 4/5] dtc: Plugin and fixup support
Date: Fri, 3 Jun 2016 11:11:23 +1000
Message-ID: <20160603011123.GB1087@voom.fritz.box>
References: <1464112239-29856-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464112239-29856-5-git-send-email-pantelis.antoniou@konsulko.com>
 <20160527073306.GA17226@voom.fritz.box>
 <20160531050634.GJ17226@voom.fritz.box>
 <60DA9B11-16A5-49C6-AB27-888D4FCBE3A3@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <60DA9B11-16A5-49C6-AB27-888D4FCBE3A3-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 08:13:51PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> > On May 31, 2016, at 08:06 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> =
wrote:
> >=20
> > On Fri, May 27, 2016 at 05:33:06PM +1000, David Gibson wrote:
> >> On Tue, May 24, 2016 at 08:50:38PM +0300, Pantelis Antoniou wrote:
> >>> This patch enable the generation of symbols & local fixup information
> >>> for trees compiled with the -@ (--symbols) option.
> >>>=20
> >>> Using this patch labels in the tree and their users emit information
> >>> in __symbols__ and __local_fixups__ nodes.
> >>>=20
> >>> The __fixups__ node make possible the dynamic resolution of phandle
> >>> references which are present in the plugin tree but lie in the
> >>> tree that are applying the overlay against.
> >>>=20
> >>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>> Signed-off-by: Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>=20
> >> So, I think I've identified the underlying thing which was bothering
> >> me about these patches.
> >>=20
> >> With the new dynamic patching stuff, "overlays" (for want of a better
> >> term) now have a real existence both in the dts source format, and in
> >> the dtb object format.  However, these patches don't give them a
> >> concrete, explicit representation within dtc itself - instead we just
> >> kind of mangle one representation to the other as we're parsing.  I
> >> think this is a mistaken approach.
> >>=20
> >> I'm toying with some patches to give overlays a full representation in
> >> dtc which I think will handle these cases better - and allow for
> >> easier experimentation with different possible ways of encoding the
> >> overlays.
> >>=20
> >> One side point - writing plugins in dts format leads to an irritating
> >> little ambiguity in the grammar.  Well, not an ambiguity technically,
> >> but a place where we need more lookahead than normal, meaning we get
> >> shift/reduce conflicts.  It arises because both memreserves and
> >> overlays can have a label in front of them.  So, if we see a label as
> >> our next token after the version tag, we don't know if a memreserve or
> >> overlay is coming next, so the parser doesn't know which path to go
> >> down (with a single token lookahead).  We could handle it with
> >> %glr-parser, of course, but I have been trying to avoid that.  I think
> >> this will apply both with your patches and with the approach I'm
> >> working on - not sure what to do about it yet.
> >=20
> > I now have a first cut at said experiments, see:
> >    https://github.com/dgibson/dtc/tree/overlay
> >=20
>=20
> Rebased my work and will submit again a couple of minutes.
>=20
> Everything works besides a small niggle with the overlay syntax.
>=20
> You cannot get rid of the basetree token. So=E2=80=A6
>=20
> &foo { };=20
>=20
> Does not work for an overlay, you need a dummy basetree=20
>=20
> / { }; &foo { };


Right, it was my intention to remove that restriction but it hits the
grammar complication discussed above.  I might have to bite the bullet
and turn on %glr-parser.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXUNk7AAoJEGw4ysog2bOSvOAQANezX4rsaZk4CK0XhPvSdaH5
lPFRpAYNoQW3l5mcClMrNTpRKCWLAT0LOQwVIqG11zJTIsM/rXKTuCb0fPWCNqss
/N51Y4+6bJacGi5mwbsR5CGQ5WkVAIby8ZVChutNyJwOfjMRnHUyG682GitfkVUb
jl9wiLq47N//K4wTBOwElgVh8iJzYntVbIHOdba+bzQRnIQrOU66Px7rEV2pluuR
ZbTx5WgxIFJKOaH2zvkB1x6wf0ba7MB17ZHQnhfWufKE5TDNZF4hKx4sSwbmt04h
NOWn0apz1EgGdrd95YnrfvX5Kxa1SzTwysuEKDNekH2nmCaas7vkJyVzJOjhmyMv
qNTQ6yWhFcFwSJhB0K8eo9jl+qIxOt2qED2J3Wqb0WCvmS7yz9XCHZGOefVmZ/kU
GagRvCE+QKJqQmKPb/x4DCLw532MOWC+Pt5D3vfhrMK9DRt72AWI04A+n2Q2UJPZ
Yzqqkd7wlcwliO1t8DA6SajdXdnbn6OW2SuQfeKRbxcCuWw+M9N6FGjp8eyiwhY8
KslvFy3GPKNalbtWnlNHMOnPDgUSvyHf/XuDR4J70rviZUXp6rS2/B6ZFcCYVejT
9RP/npAuGzg0f5sWjsrL2gQ8gsQndWVypBVXtHtSqKLEarB5TFFWYhJ2YSeyMGRa
ZBCB6GyiIjwSgi5qoM3Y
=N4FT
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
