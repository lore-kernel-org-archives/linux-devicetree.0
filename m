From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regulator: Add generic DT parsing for regulators
Date: Fri, 27 Apr 2012 19:01:24 +0100
Message-ID: <20120427180124.GQ18260@opensource.wolfsonmicro.com>
References: <1335451941-26333-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6916110472057694190=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335451941-26333-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6916110472057694190==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2012 at 04:52:20PM +0200, Thierry Reding wrote:
> Looking up init data for regulators found on chips is a common operation
> that can be handled in a generic way. The new helper function introduced
> by this patch looks up the children of a given node by names specified
> in a match table and fills that match table with information parsed from
> the DT.
>=20
> This is based on work by Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.

Rhyland, does this new interface work for you?

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPmt6mAAoJEBus8iNuMP3dc+0P/36TcJv4cIlk2wqC5nIVCgND
5WE8N1u5kKyxcKOUTxK1y9s8Ea8Sh97JLNmYwKXt57+wIRVw+rFFwufdi6mEf1U0
F7teUbxjQk+4xadt+2jgPd3p8rai3nXFgmogHhaJtZ+EuTDI30Ho+UiECuGybVjV
gzyTXTK5kgWYwARJCyFPkMKpucgzfRMKxTzA+E1Qi24n3PaWgQc4OQqC6fL7gbXh
4v9l9YjSdL0jIG5xduck5pZSWVDmcPwH7qvuRGUcF+DIusMFHbBApOAO5RYNx4FI
mbl0QdRWXy7aKDzOZ5ts5pteW2bNG9tYLlbhfzJLEr+nhVs22mcgFcwoB6VQhdvX
ZTe5GK5KyAhHhvvfzycYTlwXE1vgcgivWXsEnQxDbBmiiRHErnNf1NsPj4kHqji1
Xcdw6utlxrSSz1N/XSitNSjweX5D+JWuXTGQHfukQF+Vrf58/xc44w9sSWx++3Ij
ik+CdL+IM3uT3yoanoRH0MQFEimavbo346nzSJglauIB9VtWwQx9ZsZ7l5y10KsC
Fv9qixynjQOOveom1O2LwZ6o6uuEs+/M+N1Rib7RiJa8/9QkskHGZB0T+/hnDfua
svozhJW3nO0ZtgpbAjaQn/c0u57ezyFa7JhFgbQWw223fBMMgCyO64qKvk8A0rS1
ofCCGWSIusY+dDRseUC4
=Pa5T
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--

--===============6916110472057694190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6916110472057694190==--
