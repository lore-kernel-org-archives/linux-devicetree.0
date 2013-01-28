From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Move the fdt*_t type definitions to fdt.h
Date: Mon, 28 Jan 2013 15:52:33 +1100
Message-ID: <20130128045233.GA4107@truffula.fritz.box>
References: <5105E615.30102@cideas.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5811491639063692522=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5105E615.30102-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
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
To: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5811491639063692522==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2013 at 09:44:37PM -0500, Gerald Van Baren wrote:
> Arguably they belong there since they are fundamental to the fdt.
> As a side effect, I had to flip the order of #includes of fdt.h and
> libfdt_env.h in libfdt.h since libfdt_env.h needs the fdt*_t definitions.
>=20
> Signed-off-by: Gerald Van Baren <gvb-LFPmMGy0VdYAvxtiuMwx3w@public.gmane.org>
> ---
>=20
> I'm not sure I like this, but submit it for your consideration.  If, for
> some reason, libfdt_env.h needed to (re)define something in fdt.h, it
> would be unable to do so. :-/

Sorry, nack on this one.  fdt.h is supposed to be as independent as we
can make it from the environment in which its being compiled.  That
means I don't want it to include *any* system headers, even stdint.h.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEGBBEACgkQaILKxv3ab8ZZPgCfThNgJlQiHArTGbQ1vX3cQsK7
e38AniVt78k6FjgJqFg7Up0XNyjYqHqi
=rvxb
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============5811491639063692522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5811491639063692522==--
