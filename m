From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Tue, 23 Jan 2018 23:05:00 +1100
Message-ID: <20180123120500.GJ11419@umbus>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="itqfrb9Qq3wY07cp"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b96829f9-2e8b-fdc5-5090-58591e2260cf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--itqfrb9Qq3wY07cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2018 at 12:09:18AM -0800, Frank Rowand wrote:
> Hi All,
>=20
> I've tried to create a decent distribution list, but I'm sure I've missed
> someone or some important list.  Please share this with anyone you think
> will be affected.
>=20
> I have been playing around with some thoughts for some additions to
> the devicetree FDT aka blob format.
>=20
> I would like to get the affected parties thinking about how additions to
> the format could improve whichever pieces of FDT related technology you
> work on or care about.  In my opinion, the FDT format should change
> very infrequently because of the impact on so many projects that have
> to work together to create a final solution, plus the many many users
> of those projects.
>=20
> So I would like you guys to consider what I send out in a day or so,
> but I don't want to preempt your creativity by laying out the details
> of my proposal right now.
>=20
> I have not looked at how this would impact the devicetree compilers,
> but I have hacked together a tool to convert existing blobs to the
> new format.  The new format is backward compatible, but transforms
> the overlay related metadata into separate blocks and removes the
> metadata from nodes and properties.  My current proposal leaves
> the fragment subtrees intact - it only transforms __symbols__,
> __fixups__, and __local_fixups__.
>=20
> Some Advantages and disadvantages of my proposal are:
>=20
> Con:
>   - New blob version.
>=20
> Pro:
>   - Backward compatible.  Bootloaders and kernels that can process v17 bl=
obs
>     will continue to work in the same manner with a v18 blob.  They will =
not
>     be able to use the new v18 features.
>=20
> Pro:
>   - If a bootloader passes a blob unmodified to a kernel, then the kernel=
 will
>     be able to use the new v18 features.
>=20
> Pro:
>   - If a bootloader modifies a blob before passing it to a kernel _and_
>     downrevs the version to v17, then the kernel will continue to work in=
 the
>     same manner as it works with a v17 blob.
>=20
> Con:
>   - If a bootloader modifies a blob before passing it to a kernel _and_ f=
ails
>     to downrev the version to v17, then the kernel will most likely detec=
t an
>     error and may choose to not boot.

I have difficulty imagining any format change for which this is not
the case.  Altering a blob and not downrevving it to the latest
version you understand is definitely a bug.

> Pro:
>   - A trailing magic field allows detection of a partially composed blob,
>     where the blob is created by a multi-pass tool.
>=20
> Pro:
>   - Validation tools can annotate the blob to indicate validation fail or
>     validation warning.  The bootloader and kernel can choose what to do
>     with the information.  For example, a Linux kernel might choose to
>     taint itself if the blob is not validated or has a validation error.
>=20
> Pro:
>   - A significant file size reduction for a blob that contains the symbol
>     information needed by overlays.

I'm having trouble imagining how that can be while still being
backward compatible with v17.

> Pro:
>   - A significant memory size reduction for a blob that contains the symb=
ol
>     information needed by overlays.
>=20
> Con:
>   - All blobs will have a small file size increase when the symbol inform=
ation
>     needed by overlays is not included:  125 - 140 bytes or 44 bytes less
>     than that if checksums not added.
>=20
> Pro:
>   - Simplifies implementation of Linux kernel overlay application very ea=
rly
>     in the boot, mostly before unflattening the blob.  Early boot overlay
>     application will be complete when the unflattenning is complete.
>=20
>     This feature _might_ _eventually_ reduce of remove the need for the
>     bootloader to apply overlays.
>=20
> Pro:
>   - Simplifies implementation of the Linux kernel overlay application to
>     the live tree, post-boot.
>=20
>=20
> Some data would be useful, so here it is.  I compiled all of the .dts fil=
es
> in the Linux kernel source tree at arch/arm/boot/dts/.  The following data
> is the size of the blob (and for Linux the amount of memory that the
> flattened tree consumes and never frees after boot).  This is for v4.15-r=
c7.
> The following sizes are in bytes.
>=20
> 'dtb no symbols' is the existing blob as currently built in the kernel tr=
ee.
>=20
> 'delta no_sym' is the extra overhead from convering 'dtb no symbols' to t=
he
> new format.  Again, this could be reduced by 44 bytes if the checksums
> portion of the proposal is not implemented.
>=20
> 'delta symbols' is the existing format build in the kernel tree, but with
> the "-@" flag provided to dtc, so that the __symbols__ node is populated.
>=20
> 'delta new fmt' is the 'delta symbols' blobs converted to the proposed
> format.
>=20
> 'saved' is the number of bytes saved by converting to the new format,
> when symbols metadata is included in the blob.
>=20
> The following table is sorted from most bytes saved, to least, with
> one entry at approximately every 16 percentile:
>=20
>=20
> row   dtb no   delta    delta    delta    saved
>       symbols  no_sym   symbols  new fmt
> ----  -------  -------  -------  -------  -------
>  99%    90531      134    42721    15766    26955  am57xx-beagle-x15-revb=
1.dtb
>  83%    44302      139    14582     5163     9419  imx6dl-tx6dl-comtft.dtb
>  66%    26277      132    11662     4628     7034  sun6i-a31s-sinovoip-bp=
i-m2.dtb
>  49%    21047      130     7328     2754     4574  imx53-qsb.dtb
>  33%    12864      137     4305     1705     2600  kirkwood-netgear_ready=
nas_nv+_v2.dtb
>  16%    12009      128     2929     1520     1409  bcm911360k.dtb
>   0%     1220      133       68      149      -81  xenvm-4.2.dtb
>=20
> Note that there are a few blobs with so little symbol metadata that the
> proposed format increases the size of the blob.  This can be seen in the
> tail of the distribution:
>=20
>    2537      128      593      384      209  mt6589-aquaris5.dtb
>    2966      131      537      355      182  mt8127-moose.dtb
>    5173      132      552      372      180  spear300-evb.dtb
>    2473      128      485      368      117  mt6592-evb.dtb
>    2370      135      454      343      111  cx92755_equinox.dtb
>    2105      128      377      304       73  mt6580-evbp1.dtb
>    2357      132      346      292       54  hip01-ca9x2.dtb
>    1232      137      208      201        7  alphascale-asm9260-devkit.dtb
>    2571      126      201      222      -21  alpine-db.dtb
>    1220      133       68      149      -81  xenvm-4.2.dtb
>=20
> I will reply to this message with the complete table of all arm blobs.
>=20
> Please discuss.  :-)
>=20
> -Frank

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--itqfrb9Qq3wY07cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlpnJOkACgkQbDjKyiDZ
s5K/fxAA4RkTiBGxHM6Nbz5IofN8q2P0kdxFKdh8xAlst1D49xGCjJr3snz0rnHc
coibLVwbodV+QlP3x1fwKsKh6snrvIA3mGxpLL1kSTXaelWhhDwXJjpOnbOLXLQo
9/Zsj0XxfOwkO1DenKiikznlOtOXrRV9eB9v3rbtlYQI69FbbRjeAfRBz56dyA3q
B3ar+vXOitzVUVa7YOS7LC5oKqjlFwbID5x4+vwHkNNkRkSeg776OzR9zGKWB1yI
iLaDCv0wIpby5gh5f9tYUsci+ImvI1mDPH3ZGvPX8y6XPNUBGUB3RQDb6Xgc8lap
RdAzHjMq/zSEmhta537BiKziTo/zocCkp/CMFlX6TTLQZ3NC0ZoFxmBkUtdU4K0R
+yo5qgjrOM9iWyYtJpPF/Xa7MvQWJsUu9KPBLUxda2MpXmbyMCnJhWDgVGr3k0TH
dqWOlEP8anZTjrSBPwWdEFje3DjWcmoqZPFehPVQUHA6IDdFUpa9pFkjy2WUcH92
k6QMw5h2T/kxJlrudYazMLNyxASp0QYK6ykMRVEHVy+Zgb4UpxRx4B/GxkU2PQNb
Xr1YKRPU2l4ZrzCIj0//wyyh2cyiOAfyXgSERi0FipgMdWzTD2KilHqB9tsSKZba
Ni7dSyR2jEiK+lXcUxOfFFBlDtSlU8jFkZFWnu9UH12G+EaCc1w=
=tTJA
-----END PGP SIGNATURE-----

--itqfrb9Qq3wY07cp--
