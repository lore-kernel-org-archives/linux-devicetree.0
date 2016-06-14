From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Tue, 14 Jun 2016 16:05:17 +1000
Message-ID: <20160614060517.GN4882@voom.fritz.box>
References: <575B1D84.2010703@gmail.com>
 <20160614011021.GD4882@voom.fritz.box>
 <575F7FC1.5040508@gmail.com>
 <20160614051028.GL4882@voom.fritz.box>
 <575F963F.8090105@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vxa5joy26gVGOrvU"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575F963F.8090105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Vxa5joy26gVGOrvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 10:29:35PM -0700, Frank Rowand wrote:
> On 06/13/16 22:10, David Gibson wrote:
> > On Mon, Jun 13, 2016 at 08:53:37PM -0700, Frank Rowand wrote:
> >> On 06/13/16 18:10, David Gibson wrote:
>=20
> < snip >
>=20
> >>> Here's my inclination for how to treat this in dtc for the time being:
> >>>     1) Leave the bulk of dtc case sensitive, as now
> >>>     2) Add a new check which will generate an error if there are node
> >>>        names which differ only in case.
> >>>
> >>> Any objections to that plan?
> >>
> >> I think that the kernel should match the current behavior of dtc.
> >>
> >> I agree with "1)".
> >>
> >> I don't think that "2)" is required.  I think it is a really dumb idea=
 for
> >> anyone to create a dts with node names that differ only in case.  But I
> >> don't think it is the compiler's job to protect people from being dumb.
> >> An analogue would be the C language and compilers.  The C compiler doe=
sn't
> >> error on a program that has variables "foo" and "Foo".
> >=20
> > Hmm.. actually I think protecting you from being dumb is exactly the
> > purpose of compiler warnings.  Now that you found that quote from
> > 1275, which is pretty definitive as far as I'm concerned, I'd expect
> > to reduce that error to a warning (by default).
>=20
> A warning is ok by me.

Ok, I'll implement that when I get a chance.

Note that in most cases there's no fundamental distinction between dtc
errors and dtc warnings - it's just a question of whether they're
flagged as "error" or "warning" level in the check table.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Vxa5joy26gVGOrvU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX56dAAoJEGw4ysog2bOS4ZwP/R9kUcc/rWcz1LZmAo03iR5w
RwC926Z5n04PoEwiwkTFqYjYr5XqO4E7AwitHubQ2ZJindQcHE4YXN2usR96d0Da
ggDXL2y0MdyJv5dCkAchsZnupr2lVLQyl1zvKhejWPK7O99amstRdVX7eY0suPVA
nOY7foFROaV1DNS9/91iLoegIjDs4Np2gbM5M6H66wTZGWyVvYudGrzOFzaD5fqs
YMHdxiQD0cN7KOc/ztR/pGNB2swh0Lq7k+e7Pb0t6DaEW27VFw8QV1VEaOvQeP9i
56lzMD5wB20trGHIhQ5P6rZ38XbIl9s6hDzQ8S5G4nPM4ciiMunotlwVMcQk1ZLe
4GW5nPz6XdIHszSxyOXvdD37IlZevS3TAkCVD49F6ET2UKLkF+enYLABULMYCcXc
iMRNTdXmQgsoXO5e1AKZQeYTVFt/Pezs3AJduIApERus81KC39hz0fWpE6aqXxrV
9/gZoOSf/X3Rx3QiuMDLbJgA1+9JzqepiabrXrq9x58KnQRDjaWQEfIKtrFbwnBT
2P8S5Muw6K6OzluYTWMFVUrlM29cAu//wZlyYCfFuVyBMH1ChZ2HBa32QVzsXg6g
kWlSlDe0JBUhnv97HYRRkoY0hYEpferjhMZrqcdJjslnknMelU+E+8/qEhFQ06VB
xUwt9c1PcslNqTCeyhdP
=727m
-----END PGP SIGNATURE-----

--Vxa5joy26gVGOrvU--
