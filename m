From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Add Avionic Design vendor prefix
Date: Tue, 22 May 2012 15:57:03 +0200
Message-ID: <20120522135703.GD21187@avionic-0098.mockup.avionic-design.de>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8868675687680149998=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334229858-1665-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============8868675687680149998==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> This commit adds a device tree vendor prefix for Avionic Design GmbH.
>=20
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index 82ac057..6b6e465 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -3,6 +3,7 @@ Device tree binding vendor prefix registry.  Keep list in=
 alphabetical order.
>  This isn't an exhaustive list, but you should add new prefixes to it bef=
ore
>  using them to avoid name-space collisions.
> =20
> +ad	Avionic Design GmbH
>  adi	Analog Devices, Inc.
>  amcc	Applied Micro Circuits Corporation (APM, formally AMCC)
>  apm	Applied Micro Circuits Corporation (APM)

Alternatively the prefix could be "avionic-design". I'm a little unsure abo=
ut
the criteria here. Anyone?

Thierry

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+7my8ACgkQZ+BJyKLjJp8t7ACeNh5j4yFShFR8nRyj74X8v3uO
vbIAn3e632fN6Ml/yMph39JOIIKjbs9H
=6GZb
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--

--===============8868675687680149998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8868675687680149998==--
