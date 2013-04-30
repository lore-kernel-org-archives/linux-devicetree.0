From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] fdtput: expand fdt if value does not fit (v3).
Date: Tue, 30 Apr 2013 18:40:30 +1000
Message-ID: <20130430084030.GK20202@truffula.fritz.box>
References: <1367310331-3790-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0507119885431754368=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1367310331-3790-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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

--===============0507119885431754368==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zz5hxuHUV8Fb7Aol"
Content-Disposition: inline

--Zz5hxuHUV8Fb7Aol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 09:25:31AM +0100, Srinivas KANDAGATLA wrote:
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

Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Jon, please apply.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zz5hxuHUV8Fb7Aol
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF/g34ACgkQaILKxv3ab8YpDQCdHx5nXytp7w2u+E82ANa0Si0N
vDcAoJTlKXUItTM7l+ATCSKl5kJ6PR1H
=iI6V
-----END PGP SIGNATURE-----

--Zz5hxuHUV8Fb7Aol--


--===============0507119885431754368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0507119885431754368==--
