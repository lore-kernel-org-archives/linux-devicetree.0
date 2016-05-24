From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v6 4/4] DTBO magic and dtbo format options
Date: Tue, 24 May 2016 21:05:14 +1000
Message-ID: <20160524110514.GF17226@voom.fritz.box>
References: <1462477724-8092-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1462477724-8092-5-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462477724-8092-5-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2016 at 10:48:44PM +0300, Pantelis Antoniou wrote:
> Introduce a new magic number for dynamic plugin objects,
> which is enabled by selecting dtbo/input output options.

I'd prefer to see this earlier in the series (maybe merged with the
base support.

Basically using the new magic number for overlays should be the "base"
default behaviour implemented first.  Outputting the same magic number
of fdts should be the backwards compatibility hack implemented after.

>=20
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/manual.txt |  7 +++++++
>  dtc.c                    | 14 +++++++++++---
>  dtc.h                    |  4 ++--
>  fdtdump.c                |  2 +-
>  flattree.c               | 11 ++++++-----
>  libfdt/fdt.c             |  2 +-
>  libfdt/fdt.h             |  3 ++-
>  libfdt/libfdt_internal.h |  1 +
>  tests/mangle-layout.c    |  7 ++++---
>  9 files changed, 35 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> index 3e16c24..63066ec 100644
> --- a/Documentation/manual.txt
> +++ b/Documentation/manual.txt
> @@ -60,6 +60,9 @@ The currently supported Input Formats are:
>      - "dtb": "blob" format.  A flattened device-tree block with
>          header in one binary blob.
> =20
> +    - "dtbo" : "blob" format. Identical with "dtb" but meant
> +        for use with dynamic-device tree objects.
> +
>      - "dts": "source" format.  A text file containing a "source"
>          for a device-tree.
> =20
> @@ -71,6 +74,8 @@ The currently supported Output Formats are:
> =20
>       - "dtb": "blob" format
> =20
> +     - "dtbo": "blob" format - for objects
> +
>       - "dts": "source" format
> =20
>       - "asm": assembly language file.  A file that can be sourced
> @@ -78,6 +83,8 @@ The currently supported Output Formats are:
>          then simply be added to your Makefile.  Additionally, the
>          assembly file exports some symbols that can be used.
> =20
> +     - "asmo": assembly language file for objects. Identical to "asm"
> +
> =20
>  3) Command Line
> =20
> diff --git a/dtc.c b/dtc.c
> index f8277fb..1330e15 100644
> --- a/dtc.c
> +++ b/dtc.c
> @@ -123,6 +123,8 @@ static const char *guess_type_by_name(const char *fna=
me, const char *fallback)
>  		return "dts";
>  	if (!strcasecmp(s, ".dtb"))
>  		return "dtb";
> +	if (!strcasecmp(s, ".dtbo"))
> +		return "dtbo";
>  	return fallback;
>  }
> =20
> @@ -153,6 +155,8 @@ static const char *guess_input_format(const char *fna=
me, const char *fallback)
>  	magic =3D fdt32_to_cpu(magic);
>  	if (magic =3D=3D FDT_MAGIC)
>  		return "dtb";
> +	if (magic =3D=3D FDT_MAGIC_DTBO)
> +		return "dtbo";
> =20
>  	return guess_type_by_name(fname, fallback);
>  }
> @@ -286,7 +290,7 @@ int main(int argc, char *argv[])
>  		bi =3D dt_from_source(arg);
>  	else if (streq(inform, "fs"))
>  		bi =3D dt_from_fs(arg);
> -	else if(streq(inform, "dtb"))
> +	else if(streq(inform, "dtb") || streq(inform, "dtbo"))
>  		bi =3D dt_from_blob(arg);
>  	else
>  		die("Unknown input format \"%s\"\n", inform);
> @@ -325,9 +329,13 @@ int main(int argc, char *argv[])
>  	if (streq(outform, "dts")) {
>  		dt_to_source(outf, bi);
>  	} else if (streq(outform, "dtb")) {
> -		dt_to_blob(outf, bi, outversion);
> +		dt_to_blob(outf, bi, FDT_MAGIC, outversion);
> +	} else if (streq(outform, "dtbo")) {
> +		dt_to_blob(outf, bi, FDT_MAGIC_DTBO, outversion);
>  	} else if (streq(outform, "asm")) {
> -		dt_to_asm(outf, bi, outversion);
> +		dt_to_asm(outf, bi, FDT_MAGIC, outversion);
> +	} else if (streq(outform, "asmo")) {
> +		dt_to_asm(outf, bi, FDT_MAGIC_DTBO, outversion);
>  	} else if (streq(outform, "null")) {
>  		/* do nothing */
>  	} else {
> diff --git a/dtc.h b/dtc.h
> index 68cb109..aea6509 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -276,8 +276,8 @@ void process_checks(bool force, struct boot_info *bi);
> =20
>  /* Flattened trees */
> =20
> -void dt_to_blob(FILE *f, struct boot_info *bi, int version);
> -void dt_to_asm(FILE *f, struct boot_info *bi, int version);
> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int versio=
n);
> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version=
);
> =20
>  struct boot_info *dt_from_blob(const char *fname);
> =20
> diff --git a/fdtdump.c b/fdtdump.c
> index 9183555..11c2b8d 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -306,7 +306,7 @@ int main(int argc, char *argv[])
>  			p =3D memchr(p, smagic[0], endp - p - 4);
>  			if (!p)
>  				break;
> -			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> +			if (fdt_magic(p) =3D=3D FDT_MAGIC || fdt_magic(p) =3D=3D FDT_MAGIC_DT=
BO) {
>  				/* try and validate the main struct */
>  				off_t this_len =3D endp - p;
>  				fdt32_t max_version =3D 17;
> diff --git a/flattree.c b/flattree.c
> index 5dde832..4fe64d4 100644
> --- a/flattree.c
> +++ b/flattree.c
> @@ -335,6 +335,7 @@ static struct data flatten_reserve_list(struct reserv=
e_info *reservelist,
>  }
> =20
>  static void make_fdt_header(struct fdt_header *fdt,
> +			    fdt32_t magic,
>  			    struct version_info *vi,
>  			    int reservesize, int dtsize, int strsize,
>  			    int boot_cpuid_phys)
> @@ -345,7 +346,7 @@ static void make_fdt_header(struct fdt_header *fdt,
> =20
>  	memset(fdt, 0xff, sizeof(*fdt));
> =20
> -	fdt->magic =3D cpu_to_fdt32(FDT_MAGIC);
> +	fdt->magic =3D cpu_to_fdt32(magic);
>  	fdt->version =3D cpu_to_fdt32(vi->version);
>  	fdt->last_comp_version =3D cpu_to_fdt32(vi->last_comp_version);
> =20
> @@ -366,7 +367,7 @@ static void make_fdt_header(struct fdt_header *fdt,
>  		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
>  }
> =20
> -void dt_to_blob(FILE *f, struct boot_info *bi, int version)
> +void dt_to_blob(FILE *f, struct boot_info *bi, fdt32_t magic, int versio=
n)
>  {
>  	struct version_info *vi =3D NULL;
>  	int i;
> @@ -390,7 +391,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int ve=
rsion)
>  	reservebuf =3D flatten_reserve_list(bi->reservelist, vi);
> =20
>  	/* Make header */
> -	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> +	make_fdt_header(&fdt, magic, vi, reservebuf.len, dtbuf.len, strbuf.len,
>  			bi->boot_cpuid_phys);
> =20
>  	/*
> @@ -460,7 +461,7 @@ static void dump_stringtable_asm(FILE *f, struct data=
 strbuf)
>  	}
>  }
> =20
> -void dt_to_asm(FILE *f, struct boot_info *bi, int version)
> +void dt_to_asm(FILE *f, struct boot_info *bi, fdt32_t magic, int version)
>  {
>  	struct version_info *vi =3D NULL;
>  	int i;
> @@ -832,7 +833,7 @@ struct boot_info *dt_from_blob(const char *fname)
>  	}
> =20
>  	magic =3D fdt32_to_cpu(magic);
> -	if (magic !=3D FDT_MAGIC)
> +	if (magic !=3D FDT_MAGIC && magic !=3D FDT_MAGIC_DTBO)
>  		die("Blob has incorrect magic number\n");
> =20
>  	rc =3D fread(&totalsize, sizeof(totalsize), 1, f);
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index 22286a1..28d422c 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -57,7 +57,7 @@
> =20
>  int fdt_check_header(const void *fdt)
>  {
> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
> +	if (fdt_magic(fdt) =3D=3D FDT_MAGIC || fdt_magic(fdt) =3D=3D FDT_MAGIC_=
DTBO) {
>  		/* Complete tree */
>  		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
>  			return -FDT_ERR_BADVERSION;
> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> index 526aedb..493cd55 100644
> --- a/libfdt/fdt.h
> +++ b/libfdt/fdt.h
> @@ -55,7 +55,7 @@
>  #ifndef __ASSEMBLY__
> =20
>  struct fdt_header {
> -	fdt32_t magic;			 /* magic word FDT_MAGIC */
> +	fdt32_t magic;			 /* magic word FDT_MAGIC[|_DTBO] */
>  	fdt32_t totalsize;		 /* total size of DT block */
>  	fdt32_t off_dt_struct;		 /* offset to structure */
>  	fdt32_t off_dt_strings;		 /* offset to strings */
> @@ -93,6 +93,7 @@ struct fdt_property {
>  #endif /* !__ASSEMBLY */
> =20
>  #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
> +#define FDT_MAGIC_DTBO	0xd00dfdb0	/* DTBO magic */
>  #define FDT_TAGSIZE	sizeof(fdt32_t)
> =20
>  #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
> diff --git a/libfdt/libfdt_internal.h b/libfdt/libfdt_internal.h
> index 02cfa6f..773dfa3 100644
> --- a/libfdt/libfdt_internal.h
> +++ b/libfdt/libfdt_internal.h
> @@ -91,5 +91,6 @@ static inline struct fdt_reserve_entry *_fdt_mem_rsv_w(=
void *fdt, int n)
>  }
> =20
>  #define FDT_SW_MAGIC		(~FDT_MAGIC)
> +#define FDT_SW_MAGIC_DTBO	(~FDT_MAGIC_DTBO)

This define is never used, remove it - there's no way to construct
dtbos with libfdt, serially or otherwise (maybe that should change,
but only add the define when it does).

>  #endif /* _LIBFDT_INTERNAL_H */
> diff --git a/tests/mangle-layout.c b/tests/mangle-layout.c
> index a76e51e..d29ebc6 100644
> --- a/tests/mangle-layout.c
> +++ b/tests/mangle-layout.c
> @@ -42,7 +42,8 @@ static void expand_buf(struct bufstate *buf, int newsiz=
e)
>  	buf->size =3D newsize;
>  }
> =20
> -static void new_header(struct bufstate *buf, int version, const void *fd=
t)
> +static void new_header(struct bufstate *buf, fdt32_t magic, int version,
> +		       const void *fdt)
>  {
>  	int hdrsize;
> =20
> @@ -56,7 +57,7 @@ static void new_header(struct bufstate *buf, int versio=
n, const void *fdt)
>  	expand_buf(buf, hdrsize);
>  	memset(buf->buf, 0, hdrsize);
> =20
> -	fdt_set_magic(buf->buf, FDT_MAGIC);
> +	fdt_set_magic(buf->buf, magic);
>  	fdt_set_version(buf->buf, version);
>  	fdt_set_last_comp_version(buf->buf, 16);
>  	fdt_set_boot_cpuid_phys(buf->buf, fdt_boot_cpuid_phys(fdt));
> @@ -145,7 +146,7 @@ int main(int argc, char *argv[])
>  	if (fdt_version(fdt) < 17)
>  		CONFIG("Input tree must be v17");
> =20
> -	new_header(&buf, version, fdt);
> +	new_header(&buf, FDT_MAGIC, version, fdt);
> =20
>  	while (*blockorder) {
>  		add_block(&buf, version, *blockorder, fdt);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRDVqAAoJEGw4ysog2bOSM60QAOD64quoq8dG2jlSTEGIQD2T
GIoKCa5v7OrygttwkFEsQ++JKzF3Hh4DuGNxtv2BLBbCXBn5pvH4Enl09PGttEi5
TPoF5U+qZXrXtBpgfhBNxOXNojGVkaFPud5HogaHuTrlvP4GeNW24DQfhTa7tSzp
ZnFcGI1w/Dv01yXwSBxOoMByBFxfzhnX36HIZNIenFd1UnTXX8nd5t8Rtfm69YjS
kZRPfhZNg/xo+dxJsrp7wtr8UA6pqc05eYDzgd1p6BiwPqUgtW4kqJbcKC6adeVQ
HokfxClEbBTg51vSXzcCVGOMsRdR4gzuRHiXxAK+fRusV+drKw7KycPuoisuv1td
5vogBfRnspTRifO4Nukeu0BQaiT2A3ZPj32qF6gmJh1XyshLKnBWEdakdjlZmxu0
sa5AOYUDtXqBAye4PJ0a2B5GnvCiXyKOVEa+QABpeTikftRWe6EgsJKNQgHBoTwS
DI2K0tK1Nx5bPrvgWzyvqE4RQlEH77lX1qsNLleAe915dJteYD3EbmwugQCxKz0t
jQ7hv0G38sxOGVrotz6Tgfy3aKnhe8mJp2rxNVc08t4svg2oLVUguHoZIuR1oX0N
5NOUFrPJ2M7d3zv19uZsNNcC1JOCTjQlTYE6weWy4WwREknJUmnDSLtTrC9Q10OF
iQw39ezC2DY+KmyIIVHe
=dIPt
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
