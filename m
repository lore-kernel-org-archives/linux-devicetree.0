From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/3] RFC: Check offset in fdt_string()
Date: Fri, 22 Feb 2013 10:35:03 +1100
Message-ID: <20130221233503.GH21011@truffula.fritz.box>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9181072468855826790=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360968578-18443-4-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============9181072468855826790==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline


--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 02:49:38PM -0800, Simon Glass wrote:
> (We probably don't want this patch, and certainly can't apply it as is,
> but I send it in order to find out the intent of fdt_string()).
>=20
> At present fdt_string() says that returns:
>=20
>    - a pointer to the string, on success
>    - NULL, if stroffset is out of bounds
>=20
> However it does not in fact return NULL. Changing it to do so also
> breaks 15 tests (segfault).
>=20
> What is the intended behaviour of this function, please?

Ah.  Yes.  So I'm guessing the tests that fail are all the tests of
the sequential write functions (fdt_sw.c).  When the blob is in
sequential write mode, the string offsets work differently - they're
negative from a strings block pointer which sits at the end of the
strings.  That's because as we add new properties, the strings block
grows downwards.  The offsets get fixed up again in fdt_finish().

So, fdt_string() would need a special case for trees in SW mode.  I
also have a vague recollection that there was another reason I didn't
implement the bounds checking, but I seem to have forgotton what it
was :(.


> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Drop patch to replace fdtdump
>=20
>  libfdt/fdt_ro.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/libfdt/fdt_ro.c b/libfdt/fdt_ro.c
> index 50007f6..cba8772 100644
> --- a/libfdt/fdt_ro.c
> +++ b/libfdt/fdt_ro.c
> @@ -77,6 +77,8 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
> =20
>  const char *fdt_string(const void *fdt, int stroffset)
>  {
> +	if (stroffset < 0 || stroffset >=3D fdt_size_dt_strings(fdt))
> +		return NULL;
>  	return (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEmrycACgkQaILKxv3ab8b9LwCfczpjIPuP7ul3slleCKhfiKDK
3FQAnRGCkZ5c5PQN3GSGtL4niLdTxwh9
=+vNu
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--

--===============9181072468855826790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============9181072468855826790==--
