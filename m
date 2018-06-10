From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv2 05/17] dt-bindings: display: add HPD gpio to DVI
 connector
Date: Sun, 10 Jun 2018 15:54:00 +0200
Message-ID: <20180610135400.lruifesy2l3cx5bi@earth.universe>
References: <1519817174-20714-1-git-send-email-tomi.valkeinen@ti.com>
 <1519817174-20714-6-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1429024452=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1519817174-20714-6-git-send-email-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============1429024452==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghhn52jl3jnmfexr"
Content-Disposition: inline


--ghhn52jl3jnmfexr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2018 at 01:26:02PM +0200, Tomi Valkeinen wrote:
> Add hpd-gpios property to dvi-connector.txt.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  Documentation/devicetree/bindings/display/connector/dvi-connector.txt | =
1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/connector/dvi-conn=
ector.txt b/Documentation/devicetree/bindings/display/connector/dvi-connect=
or.txt
> index fc53f7c60bc6..207e42e9eba0 100644
> --- a/Documentation/devicetree/bindings/display/connector/dvi-connector.t=
xt
> +++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.t=
xt
> @@ -10,6 +10,7 @@ Optional properties:
>  - analog: the connector has DVI analog pins
>  - digital: the connector has DVI digital pins
>  - dual-link: the connector has pins for DVI dual-link
> +- hpd-gpios: HPD GPIO number
> =20
>  Required nodes:
>  - Video port for DVI input
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ghhn52jl3jnmfexr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlsdLXgACgkQ2O7X88g7
+pq7Gg//TLgoiGmiRZ0pFFZYjbb04OCR50If9//35KCX38m7iE1b3mTwzJszJVyi
BQ6TZhMy8lh4MpiZKHdR2y/Q5sb7PNjTeZ/Q4NlDtEQdr3nGt7rZOZQ2y5QOOS5T
uoLlypUegFPJ3YsavDh0RZvizoe5nt0Pvj7GjZBZw5w8DnQzKp6brBwJieyR5SpU
WKidREJGacnrKgb/tCKuBQYlGTIPevSLXO9ezlRt+Wl2sqkSAviRzpHmq7q8wkxk
sj0j0oArOkU8pvMPq5TTYBpYSo71qMeO0cqlE3EdeBQs933lesJlM2iseTPgoTJC
uFRZNLI5TkPf9qQru0CAUthi2V6lG95UAQIUCJcLshgHuCabmd8Ncxob9M7VnoRu
UseqT4tHH8UaJDEh/AFh0z2rTDTX5+KeprKQKhX/LJ1JPN63G/WUP3VjxDky/doW
D/I6WeBs4635D4YE6bOuWbfVt3J8zEqu6xFDbIe/z5UFnCD4c4T5qcjuwbTVC7RT
9ICRMTg1kCg1JJmTiDtVPwl35/C4O0AmQ0SfaALtPXPjTmFiTLNV4ydDGt9ITDOO
qYxhE0F+QKuosAsrTR7psVhtrxwnHJUlUwZLaad0isHTfyJK6yhKH7cMClEnVpnI
o17AD7NU4iaXb/8OJnx5myRKQzbJAaZd85SElFBA2kkDEFoNRw4=
=LkcP
-----END PGP SIGNATURE-----

--ghhn52jl3jnmfexr--

--===============1429024452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1429024452==--
