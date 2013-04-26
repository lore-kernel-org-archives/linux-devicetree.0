From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add fdt_next_subnode() to permit easy subnode
 iteration
Date: Fri, 26 Apr 2013 21:59:51 +1000
Message-ID: <20130426115951.GD4360@truffula.fritz.box>
References: <1366914176-28684-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1569129078464350104=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366914176-28684-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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


--===============1569129078464350104==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 11:22:56AM -0700, Simon Glass wrote:
> Iterating through subnodes with libfdt is a little painful to write as we
> need something like this:
>=20
> for (depth =3D 0, count =3D 0,
> 	offset =3D fdt_next_node(fdt, parent_offset, &depth);
>      (offset >=3D 0) && (depth > 0);
>      offset =3D fdt_next_node(fdt, offset, &depth)) {
> 	if (depth =3D=3D 1) {
> 		/* code body */
> 	}
> }
>=20
> Using fdt_next_subnode() we can instead write this, which is shorter and
> easier to get right:
>=20
> for (depth =3D 0, offset =3D fdt_next_subnode(fdt, parent_offset, &depth);
>      offset >=3D 0;
>      offset =3D fdt_next_subnode(fdt, offset, &depth)) {
> 	/* code body */
> }
>=20
> Also, it doesn't require two levels of indentation for the loop
> body.

I like the idea in principle.  But if you split this into
find_first_subnode() and find_next_subnode() functions, you should be
able to get rid of the requirement for the caller to provide the depth
variable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF6bDcACgkQaILKxv3ab8YKNACeKWou75WPtPC/88LACl34M77n
4rwAni18LcHjFQY2vcrwkOgvy2P10g81
=E0eH
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--

--===============1569129078464350104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1569129078464350104==--
