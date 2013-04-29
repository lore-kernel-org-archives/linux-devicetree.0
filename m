From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] fdtput: expand fdt if value does not fit (v2).
Date: Mon, 29 Apr 2013 19:08:35 +1000
Message-ID: <20130429090835.GH20202@truffula.fritz.box>
References: <1366360596-18968-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4960771807960896235=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366360596-18968-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4960771807960896235==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 09:36:36AM +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>=20
> If you try to insert a new node or extend a property with large value,
> using fdtput you will notice that it always fails.
>=20
> example:
> fdtput -v -p -ts ./tst.dtb "/node-1" "property-1" "value-1
> Error at 'node-1': FDT_ERR_NOSPACE
>=20
> or
>=20
> fdtput -v -c ./tst.dtb "/node-1"
> Error at 'node-1': FDT_ERR_NOSPACE
>=20
> or
>=20
> fdtput -v  -ts ./tst.dtb "/node" "property" "very big value"
> Decoding value:
> 	string: 'very big value'
> Value size 15
> Error at 'property': FDT_ERR_NOSPACE
>=20
> All these error are returned from libfdt, as the size of the fdt passed
> has no space to accomdate these new properties.
> This patch adds realloc functions in fdtput to allocate new space in fdt
> when it detects a shortage in space for new value or node. With this
> patch, fdtput can insert a new node or property or extend a property
> with new value greater than original size. Also it packs the final blob
> to clean up any extra padding.
>=20
> Without this patch fdtput tool complains with FDT_ERR_NOSPACE when we
> try to add a node/property or extend the value of a property.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> CC: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
> ---
>  fdtput.c |   87 +++++++++++++++++++++++++++++++++++++++++++++++++++-----=
-----
>  1 files changed, 72 insertions(+), 15 deletions(-)
>=20
> diff --git a/fdtput.c b/fdtput.c
> index f2197f5..3e17977 100644
> --- a/fdtput.c
> +++ b/fdtput.c
> @@ -131,19 +131,72 @@ static int encode_value(struct display_info *disp, =
char **arg, int arg_count,
>  	return 0;
>  }
> =20
> -static int store_key_value(void *blob, const char *node_name,
> +#define ALIGN(x)		(((x) + (FDT_TAGSIZE) - 1) & ~((FDT_TAGSIZE) - 1))
> +
> +static char *_realloc_fdt(char *fdt, int delta)
> +{
> +	int new_sz;
> +	char *new_fdt;
> +
> +	if (!delta)
> +		return fdt;
> +
> +	new_sz =3D fdt_totalsize(fdt) + delta;
> +	new_fdt =3D malloc(new_sz);

Might as well use realloc() here.  fdt_open_into() is (by design) safe
in both the overlapping and non-overlapping cases.

Also, use xrealloc()/xmalloc() instead of plain realloc()/malloc().
Your caller doesn't actually handle the failure case here when this
returns NULL, and there's not a whole lot you can do, so the abort()
is about the best you can do, and simplifies the code here.

> +	if (!new_fdt) {
> +		fprintf(stderr, "Unable to allocate memory to new fdt\n");
> +		return fdt;
> +	}
> +	fdt_open_into(fdt, new_fdt, new_sz);
> +	free(fdt);
> +	return new_fdt;
> +}
> +
> +static char *realloc_node(char *fdt, const char *name)
> +{
> +	int delta =3D 0;
> +	int newlen =3D strlen(name);
> +	if (newlen)

I don't see any point to this test.  Adding a node named "" would be
an error in other ways, but it would still require 8 bytes of extra
space.

> +		delta =3D sizeof(struct fdt_node_header) +
> +				ALIGN(newlen + 1) + FDT_TAGSIZE;

struct fdt_node_header already includes the FDT_BEGIN_NODE tag, so
you've allocated space for the tag twice.

> +
> +	return _realloc_fdt(fdt, delta);
> +}
> +
> +static char *realloc_property(char *fdt, int nodeoffset,
> +		const char *name, int newlen)
> +{
> +	int delta =3D 0;
> +	int oldlen =3D 0;
> +
> +	if (!fdt_get_property(fdt, nodeoffset, name, &oldlen))
> +		/* strings + property header */
> +		delta =3D sizeof(struct fdt_property) + strlen(name) + 1;
> +
> +	if (newlen > oldlen)
> +		/* actual value in off_struct */
> +		delta +=3D ALIGN(newlen) - ALIGN(oldlen);
> +
> +	return _realloc_fdt(fdt, delta);
> +}
> +
> +static int store_key_value(char **blob, const char *node_name,
>  		const char *property, const char *buf, int len)
>  {
>  	int node;
>  	int err;
> =20
> -	node =3D fdt_path_offset(blob, node_name);
> +	node =3D fdt_path_offset(*blob, node_name);
>  	if (node < 0) {
>  		report_error(node_name, -1, node);
>  		return -1;
>  	}
> =20
> -	err =3D fdt_setprop(blob, node, property, buf, len);
> +	err =3D fdt_setprop(*blob, node, property, buf, len);
> +	if (err =3D=3D -FDT_ERR_NOSPACE) {
> +		*blob =3D realloc_property(*blob, node, property, len);
> +		err =3D fdt_setprop(*blob, node, property, buf, len);
> +	}
>  	if (err) {
>  		report_error(property, -1, err);
>  		return -1;
> @@ -161,7 +214,7 @@ static int store_key_value(void *blob, const char *no=
de_name,
>   * @param in_path	Path to process
>   * @return 0 if ok, -1 on error
>   */
> -static int create_paths(void *blob, const char *in_path)
> +static int create_paths(char **blob, const char *in_path)
>  {
>  	const char *path =3D in_path;
>  	const char *sep;
> @@ -177,10 +230,11 @@ static int create_paths(void *blob, const char *in_=
path)
>  		if (!sep)
>  			sep =3D path + strlen(path);
> =20
> -		node =3D fdt_subnode_offset_namelen(blob, offset, path,
> +		node =3D fdt_subnode_offset_namelen(*blob, offset, path,
>  				sep - path);
>  		if (node =3D=3D -FDT_ERR_NOTFOUND) {
> -			node =3D fdt_add_subnode_namelen(blob, offset, path,
> +			*blob =3D realloc_node(*blob, path);
> +			node =3D fdt_add_subnode_namelen(*blob, offset, path,
>  						       sep - path);
>  		}
>  		if (node < 0) {
> @@ -203,7 +257,7 @@ static int create_paths(void *blob, const char *in_pa=
th)
>   * @param node_name	Name of node to create
>   * @return new node offset if found, or -1 on failure
>   */
> -static int create_node(void *blob, const char *node_name)
> +static int create_node(char **blob, const char *node_name)
>  {
>  	int node =3D 0;
>  	char *p;
> @@ -215,15 +269,17 @@ static int create_node(void *blob, const char *node=
_name)
>  	}
>  	*p =3D '\0';
> =20
> +	*blob =3D realloc_node(*blob, p + 1);
> +
>  	if (p > node_name) {
> -		node =3D fdt_path_offset(blob, node_name);
> +		node =3D fdt_path_offset(*blob, node_name);
>  		if (node < 0) {
>  			report_error(node_name, -1, node);
>  			return -1;
>  		}
>  	}
> =20
> -	node =3D fdt_add_subnode(blob, node, p + 1);
> +	node =3D fdt_add_subnode(*blob, node, p + 1);
>  	if (node < 0) {
>  		report_error(p + 1, -1, node);
>  		return -1;
> @@ -250,23 +306,25 @@ static int do_fdtput(struct display_info *disp, con=
st char *filename,
>  		 * store them into the property.
>  		 */
>  		assert(arg_count >=3D 2);
> -		if (disp->auto_path && create_paths(blob, *arg))
> +		if (disp->auto_path && create_paths(&blob, *arg))
>  			return -1;
>  		if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
> -			store_key_value(blob, *arg, arg[1], value, len))
> +			store_key_value(&blob, *arg, arg[1], value, len))
>  			ret =3D -1;
>  		break;
>  	case OPER_CREATE_NODE:
>  		for (; ret >=3D 0 && arg_count--; arg++) {
>  			if (disp->auto_path)
> -				ret =3D create_paths(blob, *arg);
> +				ret =3D create_paths(&blob, *arg);
>  			else
> -				ret =3D create_node(blob, *arg);
> +				ret =3D create_node(&blob, *arg);
>  		}
>  		break;
>  	}
> -	if (ret >=3D 0)
> +	if (ret >=3D 0) {
> +		fdt_pack(blob);
>  		ret =3D utilfdt_write(filename, blob);
> +	}
> =20
>  	free(blob);
>  	return ret;
> @@ -317,7 +375,6 @@ int main(int argc, char *argv[])
>  		 * - rename node
>  		 * - pack fdt before writing
>  		 * - set amount of free space when writing
> -		 * - expand fdt if value doesn't fit
>  		 */
>  		switch (c) {
>  		case 'c':

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF+OJMACgkQaILKxv3ab8YWvACfSDk3Enypu7fdBst8G/0WksOt
4bcAnRzJgTijkIvZE9NC9gVHZ1oDrzqk
=fhtK
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--


--===============4960771807960896235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4960771807960896235==--
