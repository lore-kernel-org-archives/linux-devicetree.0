From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v7 0/4] libfdt: Add support for device tree overlays
Date: Thu, 13 Oct 2016 08:41:57 +1100
Message-ID: <20161012214157.GA18039@umbus.fritz.box>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
 <20161006094756.GR18733@umbus.fritz.box>
 <6338fcb9-ffda-a04b-6c6e-2fd254b58dda@gmail.com>
 <965C6014-692F-4021-9E3D-945ED32307B7@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <965C6014-692F-4021-9E3D-945ED32307B7-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 05:06:07PM +0200, Pantelis Antoniou wrote:
> Hi Phil,
>=20
> > On Oct 6, 2016, at 23:16 , Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> >=20
> > On 06/10/2016 10:47, David Gibson wrote:
> >> On Fri, Sep 30, 2016 at 03:57:13PM +0200, Maxime Ripard wrote:
> >>> Hi,
> >>>=20
> >>> The device tree overlays are a great solution to the issue raised by
> >>> the bunch expandable boards we find everywhere these days, like the
> >>> Beaglebone, Raspberry Pi or CHIP.
> >>>=20
> >>> Although for now Linux is the only available tool that can deal with
> >>> overlays, some other components like bootloaders or user-space tools
> >>> might need to apply these overlays on top of a base device tree.
> >>>=20
> >>> To address these use cases, we introduce a new function to the libfdt,
> >>> fdt_overlay_apply, that does just that.
> >>>=20
> >>> You can find a test program here: http://code.bulix.org/792zum-99476?=
raw
> >>>=20
> >>> This is the last patches sent to U-boot, with the modifications
> >>> suggested by David, and the additional test cases.
> >>>=20
> >>> Let me know what you think!
> >>> Maxime
> >> Looking pretty good.  There's a minor error in 3/4 which I've pointed
> >> out, it can be fixed in a followup.
> >>=20
> >> An error in the conditionals means it's trying to run some of the
> >> tests which require an overlay-aware dtc on even when that's not
> >> available - I adjusted 4/4 to correct that.
> >>=20
> >> It also hit build failures on Travis, because the compiler version
> >> there complains about local variables named 'index' shadowing the
> >> standard library function.  I've corrected that with a followup patch.
> >>=20
> >> With that done, the whole lot has been committed to master.
> >>=20
> > Now that upstream libfdt can resolve and apply overlays we need a way
> > of generating them. I have a set of three patches from Pantelis that
> > add "plugin" support to dtc, together with two downstream (Raspberry Pi)
> > patches that fix an uninitialised memory reference and restrict
> > __local_fixups__  generation to overlays.
> >=20
> > Is there already a plan to get the enhanced dtc upstreamed? If so, can I
> > get the downstream fixes included?
> >=20
>=20
> David, my patchset is kept updated against mainline dtc.
> What are the remaining stumbling blocks in getting in accepted?

Well, repost it and we'll see.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX/q4jAAoJEGw4ysog2bOScqAP/0UZsaa8YCx9C2g9VukUSgJo
/qgOD23M/NBZq1zebE8luxv0bPKFWmI+XQVCQXcZi0ESOd9Adq0gryGSmJlbFat5
09vY3WPyS0NMvTPGf9RygYU6RDGgPn7XNXWn56oRI6rTe17vuYTI/xttSqCRNs9v
5VR8TUynVfzdGpeQQEjY5fP/4ApUBFU+2gTIKrGQ0X8tZ/BDBaPtdrCWFZprcEyF
7GKWXVttw2WoAAqgbQ44sDANj+c/alKSdV6N3nCBEEWY+kb6PMTwVoHGmFFdNUrt
i52mrfMjto207AvYHvTLt6kFOi1nqZxj0qW9CyrOmkBgqzRkqVBkh3nSIznQVGZa
ReLiV3rftVqXXZCufxChOQWaTCzZ7VQMX40QyK4/13BNT6/VV5QMaIfRTQnU2k4A
Oy7XosivU5N08A/GT0JUfdBzmV+9nT7y4dGdJjbHwmZI5Z/byPvUpYP1NtbeyJZI
+nc2FgL8MEJc2oNqXwUW04yah4VtDHJArtW8dOGmi6hm2fuJ8GSqko7Daht3/qay
rtpssKdBIYompuoaWeiQ+9KHlZmz5O7iXa3mexb4iyGtrlxNok1M260MXgwxIVsZ
LY2MixEU1k405KRBN003pTMGvJj//AlTnEo4qPY82yDyZkA12cl7Njmlwz4GMVwh
2bq0KRz2Ym+pcxYlkrQV
=FVCe
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
