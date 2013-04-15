From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 10/10] fdtdump: add a debug mode
Date: Mon, 15 Apr 2013 15:12:06 +1000
Message-ID: <20130415051206.GK16400@truffula.fritz.box>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-11-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8436505076989719560=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365618555-5893-11-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8436505076989719560==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0FM4RQAc0jwHekq5"
Content-Disposition: inline


--0FM4RQAc0jwHekq5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 02:29:15PM -0400, Mike Frysinger wrote:
> When hacking raw fdt files, it's useful to know the actual offsets into
> the file each node appears.  Add a --debug mode that includes this.

Neat idea.  Few comments on implementation below.

> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  fdtdump.c | 40 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 4 deletions(-)
>=20
> diff --git a/fdtdump.c b/fdtdump.c
> index 2b8c194..2c8bff6 100644
> --- a/fdtdump.c
> +++ b/fdtdump.c
> @@ -19,8 +19,29 @@
>  #define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
>  #define GET_CELL(p)	(p +=3D 4, *((const uint32_t *)(p-4)))
> =20
> -static void dump_blob(void *blob)
> +static const char *tagname(uint32_t tag)
>  {
> +	static const char * const names[] =3D {
> +#define TN(t) [t] #t
> +		TN(FDT_BEGIN_NODE),
> +		TN(FDT_END_NODE),
> +		TN(FDT_PROP),
> +		TN(FDT_NOP),
> +		TN(FDT_END),
> +#undef TN
> +	};
> +	if (tag < ARRAY_SIZE(names))
> +		if (names[tag])
> +			return names[tag];
> +	return "???";

Better to return NULL here, I think.  That way a caller can easily
check and print the numeric value instead.

Or you could construct a string with the number.  It would leak
memory, obviously, but in a short-run program like this, it doesn't
really matter.

> +}
> +
> +#define dprintf(fmt, args...) \
> +	do { if (debug) printf("// " fmt, ## args); } while (0)

I'd prefer a different function (well, macro) name.  I tend to use
"dprintf" for debug print functions in the sense of debugging for the
program they're in, whereas in this case it's for the debug mode which
is (primarily) for debugging other programs.

> +static void dump_blob(void *blob, bool debug)
> +{
> +	uintptr_t blob_off =3D (uintptr_t)blob;
>  	struct fdt_header *bph =3D blob;
>  	uint32_t off_mem_rsvmap =3D fdt32_to_cpu(bph->off_mem_rsvmap);
>  	uint32_t off_dt =3D fdt32_to_cpu(bph->off_dt_struct);
> @@ -74,7 +95,8 @@ static void dump_blob(void *blob)
>  	p =3D p_struct;
>  	while ((tag =3D fdt32_to_cpu(GET_CELL(p))) !=3D FDT_END) {
> =20
> -		/* printf("tag: 0x%08x (%d)\n", tag, p - p_struct); */
> +		dprintf("%04zx: tag: 0x%08x (%s)\n",
> +		        (uintptr_t)p - blob_off - 4, tag, tagname(tag));
> =20
>  		if (tag =3D=3D FDT_BEGIN_NODE) {
>  			s =3D p;
> @@ -113,6 +135,8 @@ static void dump_blob(void *blob)
> =20
>  		p =3D PALIGN(p + sz, 4);
> =20
> +		dprintf("%04zx: string: %s\n", (uintptr_t)s - blob_off, s);
> +		dprintf("%04zx: value\n", (uintptr_t)t - blob_off);
>  		printf("%*s%s", depth * shift, "", s);
>  		utilfdt_print_data(t, sz);
>  		printf(";\n");
> @@ -121,8 +145,9 @@ static void dump_blob(void *blob)
> =20
>  /* Usage related data. */
>  static const char usage_synopsis[] =3D "fdtdump [options] <file>";
> -static const char usage_short_opts[] =3D "s" USAGE_COMMON_SHORT_OPTS;
> +static const char usage_short_opts[] =3D "ds" USAGE_COMMON_SHORT_OPTS;
>  static struct option const usage_long_opts[] =3D {
> +	{"debug",            no_argument, NULL, 'd'},
>  	{"scan",             no_argument, NULL, 's'},
>  	USAGE_COMMON_LONG_OPTS
>  };
> @@ -136,6 +161,7 @@ int main(int argc, char *argv[])
>  	int opt;
>  	const char *file;
>  	char *buf;
> +	bool debug =3D false;
>  	bool scan =3D false;
>  	off_t len;
> =20
> @@ -143,6 +169,9 @@ int main(int argc, char *argv[])
>  		switch (opt) {
>  		case_USAGE_COMMON_FLAGS
> =20
> +		case 'd':
> +			debug =3D true;
> +			break;
>  		case 's':
>  			scan =3D true;
>  			break;
> @@ -179,6 +208,9 @@ int main(int argc, char *argv[])
>  				    fdt_off_dt_struct(p) < this_len &&
>  					fdt_off_dt_strings(p) < this_len)
>  					break;
> +				if (debug)
> +					printf("%s: skipping fdt magic at offset %#zx\n",
> +						file, p - buf);
>  			}
>  			++p;
>  		}
> @@ -188,7 +220,7 @@ int main(int argc, char *argv[])
>  		buf =3D p;
>  	}
> =20
> -	dump_blob(buf);
> +	dump_blob(buf, debug);
> =20
>  	return 0;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0FM4RQAc0jwHekq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFrjCYACgkQaILKxv3ab8aAaACeM9otsd6sxHHC4VWNhc7aBX5i
vXAAoIzNXAQ+EGrMf9lcdCCJDbloGP+i
=m0gd
-----END PGP SIGNATURE-----

--0FM4RQAc0jwHekq5--

--===============8436505076989719560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8436505076989719560==--
