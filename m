From: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: pinctrl: add mcp23018 to mcp23s08
 documentation
Date: Sun, 8 Oct 2017 23:18:50 +0200
Message-ID: <20171008211850.wrvbraxbapc52axm@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-3-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="es6kojppzsqsnkdw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-3-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--es6kojppzsqsnkdw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:06PM +0800, Phil Reid wrote:
> This adds the compatible string for the mcp23018, which is the i2c variant
> of the mcp23s18.
>=20
> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

-- Sebastian

>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index c934106..8a5bf99 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -13,6 +13,7 @@ Required properties:
>      - "microchip,mcp23s18" for 16 GPIO SPI version
>      - "microchip,mcp23008" for  8 GPIO I2C version or
>      - "microchip,mcp23017" for 16 GPIO I2C version of the chip
> +    - "microchip,mcp23018" for 16 GPIO I2C version
>      NOTE: Do not use the old mcp prefix any more. It is deprecated and w=
ill be
>      removed.
>  - #gpio-cells : Should be two.
> --=20
> 1.8.3.1
>=20

--es6kojppzsqsnkdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnaljoACgkQ2O7X88g7
+prR5Q//UCzoUIjR1eBP8pWtoXBDRDhUHWwFkQALki0XZ6nqiJw7KUKj6Szzxq3F
DCJ5NNiaEE2dKAubej+1MEYgQQrSYlfjAV9R7bCTOc27F3rCWnEC54TngretiVr9
/pk41Bc3Brpxx/6oazsi3CPZzy/JwIg+irdGZqnkf/jss32QJ7OkdkDeKj/wKjL9
6rSzOf9dj6/hQo6EwboWe0zhQQsfbeTexiXqbdSWYO8vbZN/V2DkP8b05gufi6+k
LzsEbQBf3NFzMzoOrNZJARXPRYIaZfOE57QUrNKkYwIaJBMi4iqzd3MQ8jRomkdv
jieurT6IyXJWNufTMEqleMEHm4ou7HnVm+jG0CcgH+EK3ZL7V1gYADIAezHhmsYz
4EdkitrPfEjcGlqIceDRIV3SBUGUnHRlEFFjX1kqRUGgrJOfxAiYwiG4DQYro+J+
71dWQJEn9CBRfGnJs5t0tHFWOTE3v1ol7s9znEGoJt9lw3fvtWfmXz/YH8VUWb3/
WfgPgDzRqrjMA+cnmE/OuWSACKifmhmZCkdULdwnX+milULS5P5OHzd8o46BYN5a
XYpTGcSovxE2Hlj3dul6RVmyMNztgk2gquAyhkAVJSChEfOK0Zj9w+yfOcsgpvi0
1JF6hRJaHROf0vuj+dNxTYLb79uQ78tM2b2a2kPBLG/kBXljmic=
=c1Hd
-----END PGP SIGNATURE-----

--es6kojppzsqsnkdw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
