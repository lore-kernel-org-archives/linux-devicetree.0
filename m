From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v8 1/3] DTBO magic and dtbo format options
Date: Thu, 9 Jun 2016 14:19:09 +1000
Message-ID: <20160609041909.GI9226@voom.fritz.box>
References: <1464889642-28080-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1464889642-28080-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20160608065100.GA9226@voom.fritz.box>
 <91D401B5-5C8F-4AEB-918C-1BF0BCCCC9D8@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aJFFgG5QZHt5jcrP"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <91D401B5-5C8F-4AEB-918C-1BF0BCCCC9D8-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aJFFgG5QZHt5jcrP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2016 at 11:30:43AM +0300, Pantelis Antoniou wrote:
>=20
> > On Jun 8, 2016, at 09:51 , David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
> >=20
> > On Thu, Jun 02, 2016 at 08:47:20PM +0300, Pantelis Antoniou wrote:
> >> Introduce a new magic number for dynamic plugin objects,
> >> which is enabled by selecting dtbo/input output options.
> >>=20
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >=20
> > So, I don't think we should need an explicit -I dtbo or -O dtbo.
> > Instead we should be able to autoselect the right magic number based
> > on the presence of the /plugin/ flag.  In the other direction we
> > should be able to set the equivalent of the /plugin/ flag based on the
> > magic number.
>=20
> Sure but this will break everything since nothing can grok the different
> magic number. Not the kernel unflattener nor any bootloader.

Yes, but I'd prefer to implement the preferred way of doing things
first - with the new magic number, then add the backward compatibility
shim afterwards.

> We need an option to keep the old magic number for compatibility.
>=20
> >> ---
> >> Documentation/manual.txt |  8 ++++++++
> >> dtc.c                    | 14 +++++++++++---
> >> dtc.h                    |  4 ++--
> >> fdtdump.c                |  2 +-
> >> flattree.c               | 11 ++++++-----
> >> libfdt/fdt.c             |  2 +-
> >> libfdt/fdt.h             |  3 ++-
> >> tests/mangle-layout.c    |  7 ++++---
> >> 8 files changed, 35 insertions(+), 16 deletions(-)
> >>=20
> >> diff --git a/Documentation/manual.txt b/Documentation/manual.txt
> >> index 398de32..6d2811b 100644
> >> --- a/Documentation/manual.txt
> >> +++ b/Documentation/manual.txt
> >> @@ -60,6 +60,9 @@ The currently supported Input Formats are:
> >>     - "dtb": "blob" format.  A flattened device-tree block with
> >>         header in one binary blob.
> >>=20
> >> +    - "dtbo" : "blob" format. Identical with "dtb" but meant
> >> +        for use with dynamic-device tree objects.
> >> +
> >>     - "dts": "source" format.  A text file containing a "source"
> >>         for a device-tree.
> >>=20
> >> @@ -71,6 +74,8 @@ The currently supported Output Formats are:
> >>=20
> >>      - "dtb": "blob" format
> >>=20
> >> +     - "dtbo": "blob" format - for dynamic device tree objects/overla=
ys
> >> +
> >>      - "dts": "source" format
> >>=20
> >>      - "asm": assembly language file.  A file that can be sourced
> >> @@ -78,6 +83,9 @@ The currently supported Output Formats are:
> >>         then simply be added to your Makefile.  Additionally, the
> >>         assembly file exports some symbols that can be used.
> >>=20
> >> +     - "asmo": assembly language file for dynamic device tree objects=
/overlays.
> >> +        Identical to "asm" for most purposes.
> >> +
> >>=20
> >> 3) Command Line
> >>=20
> >> diff --git a/dtc.c b/dtc.c
> >> index 1c1f88f..43ba19d 100644
> >> --- a/dtc.c
> >> +++ b/dtc.c
> >> @@ -127,6 +127,8 @@ static const char *guess_type_by_name(const char *=
fname, const char *fallback)
> >> 		return "dts";
> >> 	if (!strcasecmp(s, ".dtb"))
> >> 		return "dtb";
> >> +	if (!strcasecmp(s, ".dtbo"))
> >> +		return "dtbo";
> >> 	return fallback;
> >> }
> >>=20
> >> @@ -157,6 +159,8 @@ static const char *guess_input_format(const char *=
fname, const char *fallback)
> >> 	magic =3D fdt32_to_cpu(magic);
> >> 	if (magic =3D=3D FDT_MAGIC)
> >> 		return "dtb";
> >> +	if (magic =3D=3D FDT_MAGIC_DTBO)
> >> +		return "dtbo";
> >>=20
> >> 	return guess_type_by_name(fname, fallback);
> >> }
> >> @@ -285,7 +289,7 @@ int main(int argc, char *argv[])
> >> 		dti =3D dt_from_source(arg);
> >> 	else if (streq(inform, "fs"))
> >> 		dti =3D dt_from_fs(arg);
> >> -	else if(streq(inform, "dtb"))
> >> +	else if (streq(inform, "dtb") || streq(inform, "dtbo"))
> >> 		dti =3D dt_from_blob(arg);
> >> 	else
> >> 		die("Unknown input format \"%s\"\n", inform);
> >> @@ -319,9 +323,13 @@ int main(int argc, char *argv[])
> >> 	if (streq(outform, "dts")) {
> >> 		dt_to_source(outf, dti);
> >> 	} else if (streq(outform, "dtb")) {
> >> -		dt_to_blob(outf, dti, outversion);
> >> +		dt_to_blob(outf, dti, FDT_MAGIC, outversion);
> >> +	} else if (streq(outform, "dtbo")) {
> >> +		dt_to_blob(outf, dti, FDT_MAGIC_DTBO, outversion);
> >> 	} else if (streq(outform, "asm")) {
> >> -		dt_to_asm(outf, dti, outversion);
> >> +		dt_to_asm(outf, dti, FDT_MAGIC, outversion);
> >> +	} else if (streq(outform, "asmo")) {
> >> +		dt_to_asm(outf, dti, FDT_MAGIC_DTBO, outversion);
> >> 	} else if (streq(outform, "null")) {
> >> 		/* do nothing */
> >> 	} else {
> >> diff --git a/dtc.h b/dtc.h
> >> index 040f8d4..fa66dca 100644
> >> --- a/dtc.h
> >> +++ b/dtc.h
> >> @@ -266,8 +266,8 @@ void process_checks(bool force, struct dt_info *dt=
i);
> >>=20
> >> /* Flattened trees */
> >>=20
> >> -void dt_to_blob(FILE *f, struct dt_info *dti, int version);
> >> -void dt_to_asm(FILE *f, struct dt_info *dti, int version);
> >> +void dt_to_blob(FILE *f, struct dt_info *dti, fdt32_t magic, int vers=
ion);
> >> +void dt_to_asm(FILE *f, struct dt_info *dti, fdt32_t magic, int versi=
on);
> >>=20
> >> struct dt_info *dt_from_blob(const char *fname);
> >>=20
> >> diff --git a/fdtdump.c b/fdtdump.c
> >> index 95a6a20..fa5a050 100644
> >> --- a/fdtdump.c
> >> +++ b/fdtdump.c
> >> @@ -199,7 +199,7 @@ int main(int argc, char *argv[])
> >> 			p =3D memchr(p, smagic[0], endp - p - 4);
> >> 			if (!p)
> >> 				break;
> >> -			if (fdt_magic(p) =3D=3D FDT_MAGIC) {
> >> +			if (fdt_magic(p) =3D=3D FDT_MAGIC || fdt_magic(p) =3D=3D FDT_MAGIC=
_DTBO) {
> >> 				/* try and validate the main struct */
> >> 				off_t this_len =3D endp - p;
> >> 				fdt32_t max_version =3D 17;
> >> diff --git a/flattree.c b/flattree.c
> >> index 45fcb04..59bdc7d 100644
> >> --- a/flattree.c
> >> +++ b/flattree.c
> >> @@ -335,6 +335,7 @@ static struct data flatten_reserve_list(struct res=
erve_info *reservelist,
> >> }
> >>=20
> >> static void make_fdt_header(struct fdt_header *fdt,
> >> +			    fdt32_t magic,
> >> 			    struct version_info *vi,
> >> 			    int reservesize, int dtsize, int strsize,
> >> 			    int boot_cpuid_phys)
> >> @@ -345,7 +346,7 @@ static void make_fdt_header(struct fdt_header *fdt,
> >>=20
> >> 	memset(fdt, 0xff, sizeof(*fdt));
> >>=20
> >> -	fdt->magic =3D cpu_to_fdt32(FDT_MAGIC);
> >> +	fdt->magic =3D cpu_to_fdt32(magic);
> >> 	fdt->version =3D cpu_to_fdt32(vi->version);
> >> 	fdt->last_comp_version =3D cpu_to_fdt32(vi->last_comp_version);
> >>=20
> >> @@ -366,7 +367,7 @@ static void make_fdt_header(struct fdt_header *fdt,
> >> 		fdt->size_dt_struct =3D cpu_to_fdt32(dtsize);
> >> }
> >>=20
> >> -void dt_to_blob(FILE *f, struct dt_info *dti, int version)
> >> +void dt_to_blob(FILE *f, struct dt_info *dti, fdt32_t magic, int vers=
ion)
> >> {
> >> 	struct version_info *vi =3D NULL;
> >> 	int i;
> >> @@ -390,7 +391,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int =
version)
> >> 	reservebuf =3D flatten_reserve_list(dti->reservelist, vi);
> >>=20
> >> 	/* Make header */
> >> -	make_fdt_header(&fdt, vi, reservebuf.len, dtbuf.len, strbuf.len,
> >> +	make_fdt_header(&fdt, magic, vi, reservebuf.len, dtbuf.len, strbuf.l=
en,
> >> 			dti->boot_cpuid_phys);
> >>=20
> >> 	/*
> >> @@ -460,7 +461,7 @@ static void dump_stringtable_asm(FILE *f, struct d=
ata strbuf)
> >> 	}
> >> }
> >>=20
> >> -void dt_to_asm(FILE *f, struct dt_info *dti, int version)
> >> +void dt_to_asm(FILE *f, struct dt_info *dti, fdt32_t magic, int versi=
on)
> >> {
> >> 	struct version_info *vi =3D NULL;
> >> 	int i;
> >> @@ -832,7 +833,7 @@ struct dt_info *dt_from_blob(const char *fname)
> >> 	}
> >>=20
> >> 	magic =3D fdt32_to_cpu(magic);
> >> -	if (magic !=3D FDT_MAGIC)
> >> +	if (magic !=3D FDT_MAGIC && magic !=3D FDT_MAGIC_DTBO)
> >> 		die("Blob has incorrect magic number\n");
> >>=20
> >> 	rc =3D fread(&totalsize, sizeof(totalsize), 1, f);
> >> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> >> index 22286a1..28d422c 100644
> >> --- a/libfdt/fdt.c
> >> +++ b/libfdt/fdt.c
> >> @@ -57,7 +57,7 @@
> >>=20
> >> int fdt_check_header(const void *fdt)
> >> {
> >> -	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
> >> +	if (fdt_magic(fdt) =3D=3D FDT_MAGIC || fdt_magic(fdt) =3D=3D FDT_MAG=
IC_DTBO) {
> >> 		/* Complete tree */
> >> 		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
> >> 			return -FDT_ERR_BADVERSION;
> >> diff --git a/libfdt/fdt.h b/libfdt/fdt.h
> >> index 526aedb..493cd55 100644
> >> --- a/libfdt/fdt.h
> >> +++ b/libfdt/fdt.h
> >> @@ -55,7 +55,7 @@
> >> #ifndef __ASSEMBLY__
> >>=20
> >> struct fdt_header {
> >> -	fdt32_t magic;			 /* magic word FDT_MAGIC */
> >> +	fdt32_t magic;			 /* magic word FDT_MAGIC[|_DTBO] */
> >> 	fdt32_t totalsize;		 /* total size of DT block */
> >> 	fdt32_t off_dt_struct;		 /* offset to structure */
> >> 	fdt32_t off_dt_strings;		 /* offset to strings */
> >> @@ -93,6 +93,7 @@ struct fdt_property {
> >> #endif /* !__ASSEMBLY */
> >>=20
> >> #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
> >> +#define FDT_MAGIC_DTBO	0xd00dfdb0	/* DTBO magic */
> >> #define FDT_TAGSIZE	sizeof(fdt32_t)
> >>=20
> >> #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
> >> diff --git a/tests/mangle-layout.c b/tests/mangle-layout.c
> >> index a76e51e..d29ebc6 100644
> >> --- a/tests/mangle-layout.c
> >> +++ b/tests/mangle-layout.c
> >> @@ -42,7 +42,8 @@ static void expand_buf(struct bufstate *buf, int new=
size)
> >> 	buf->size =3D newsize;
> >> }
> >>=20
> >> -static void new_header(struct bufstate *buf, int version, const void =
*fdt)
> >> +static void new_header(struct bufstate *buf, fdt32_t magic, int versi=
on,
> >> +		       const void *fdt)
> >> {
> >> 	int hdrsize;
> >>=20
> >> @@ -56,7 +57,7 @@ static void new_header(struct bufstate *buf, int ver=
sion, const void *fdt)
> >> 	expand_buf(buf, hdrsize);
> >> 	memset(buf->buf, 0, hdrsize);
> >>=20
> >> -	fdt_set_magic(buf->buf, FDT_MAGIC);
> >> +	fdt_set_magic(buf->buf, magic);
> >> 	fdt_set_version(buf->buf, version);
> >> 	fdt_set_last_comp_version(buf->buf, 16);
> >> 	fdt_set_boot_cpuid_phys(buf->buf, fdt_boot_cpuid_phys(fdt));
> >> @@ -145,7 +146,7 @@ int main(int argc, char *argv[])
> >> 	if (fdt_version(fdt) < 17)
> >> 		CONFIG("Input tree must be v17");
> >>=20
> >> -	new_header(&buf, version, fdt);
> >> +	new_header(&buf, FDT_MAGIC, version, fdt);
> >>=20
> >> 	while (*blockorder) {
> >> 		add_block(&buf, version, *blockorder, fdt);
> >=20
>=20
> Regards
>=20
> =E2=80=94 Pantelis
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aJFFgG5QZHt5jcrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWO49AAoJEGw4ysog2bOSO4kQAKp2qDdDDw2yTjNXPL2F9kMi
oeudkxKQNW51XKRdHOQOAl2UWRfD195KiWY2nKOj7NlJvWe7CKVwfjaarDoEAUxR
N7web3hvtZTbsWOXpo4T2yk+LgX9YRZaACvzx8FkBqP8CWb7JLCgb1AJ56m16yv0
I9WFANKHYxM+V7hrIUoYBvvAu6k01ihapvTMs9WsrxKlI9Vsno3uh6U9jdL4GoxR
NzXBejYjt4WgzEDGGKGhWwOKIfcgwh+yNrFq0KQ1paOdkb8i4NUOwh/wTZQ6UIxz
uWXjiDurd7jtLfwzGEDxELPCVTLXaqQqxI7bNOcITRrwsnRcsnOE5MqHCHc5DrtI
0tA9RNypPKs78DmC7WjzlFUX4N+B7JcbZT7IHmF44QvkroZVCJtfNkucKO3i29FS
1mPzu0rzhqE9dmtmdKFDS8KyFXdQZwu6RvEm+ldPy+vHcnd2mTrP/ux+zt7Kwvpw
MhUrlThFDSu05x8GmyqN8EoifdJKTmeBlPuS8WChZXa7LYRQVNgGAR0t+Nay3y/r
Nf11wRFJyJIp7f2wAUJFFYzoENiSFfEO5i9PGM+ydBCk3TQez24kFwwEbdfP1Gvi
zwNTb0QDzjHHdgOmnT2JMium+ZsV3VlRF1yguftGc46tPFMqwL8vfRvXYVP08Szu
+Juks69ivY6HZ4mh4ZFe
=2s9J
-----END PGP SIGNATURE-----

--aJFFgG5QZHt5jcrP--
