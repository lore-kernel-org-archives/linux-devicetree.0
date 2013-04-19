From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] fdtput: expand fdt if value does not fit.
Date: Fri, 19 Apr 2013 10:56:30 +1000
Message-ID: <20130419005630.GM16400@truffula.fritz.box>
References: <1366007810-17881-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2945448573467840128=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366007810-17881-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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

--===============2945448573467840128==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oMYUQGQaTbnds07l"
Content-Disposition: inline

--oMYUQGQaTbnds07l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 07:36:50AM +0100, Srinivas KANDAGATLA wrote:
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
>=20
> This patch adds realloc functions in fdtput to allocate new space in fdt
> when it detects a shortage in space for new value or node. With this
> patch, fdtput can insert a new node or property or extend a property
> with new value greater than original size.
>=20
> Without this patch fdtput tool complains with FDT_ERR_NOSPACE when we
> try to add a node/property or extend the value of a property.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

Your realloc functions could overestimate the required size in some
cases, so you should put an fdt_pack() before you write the final blob
out to clean up any extra padding.

Other than that, looks good.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oMYUQGQaTbnds07l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFwlj4ACgkQaILKxv3ab8bLPQCeJT7PzGlLc8JUmoxLp8yw/Les
c0IAnR9q63UcbqQs5Ug7K+X1C1Hsrb/K
=VueU
-----END PGP SIGNATURE-----

--oMYUQGQaTbnds07l--


--===============2945448573467840128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2945448573467840128==--
