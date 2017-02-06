From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for the
 Sitronix ST7789V panel
Date: Mon, 6 Feb 2017 14:05:49 +0100
Message-ID: <20170206130549.GA28955@ulmo.ba.sec>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <097eb2ad92f68f0f1a7c035c9b6b094afaf34dc1.1486115846.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <097eb2ad92f68f0f1a7c035c9b6b094afaf34dc1.1486115846.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 10:59:05AM +0100, Maxime Ripard wrote:
> The Sitronix ST7789V is an LCD panel controller, controlled over SPI, that
> can drive 18-bits 240x320 LCD displays.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt | 3=
6 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sitro=
nix,st7789v.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7=
789v.txt b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v=
=2Etxt
> new file mode 100644
> index 000000000000..f70e6e9c54ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
> @@ -0,0 +1,36 @@
> +Sitronix ST7789V RGB panel with SPI control bus
> +
> +Required properties:
> +  - compatible: "sitronix,st7789v"
> +  - reg: Chip select of the panel on the SPI bus
> +  - reset-gpios: a GPIO phandle for the reset pin

Shouldn't this have some sort of power supply?

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYdKoACgkQ3SOs138+
s6F78g//fEwSaYzC2eumdo7oFTRGOMJebQPT++P4NOXl1FKs4M53c+S1EBC+EPVl
hJraiC7VbYj8U4HwzPhAy+x4GXIRYKVVFmQBHxHPrU1Ll2BP1dZ29IrWnFQlS4tV
fuf3Y4ShW3kG/EcL42xFXUcjyYXF5G/N3e3v00HrPhv0TprkUigdQA+L0pVNJvpR
DbxC0yAwpi055cR3OTBsgTTsZ4FYxLaoOFClGWx4NMwxZDpcYlaZPHSAkYRl/XZU
yU5cb828PwwJ+1vCtYanHSyLvpDH1XOZWF5xvfcjJqWk+mAx5PLIQF7GAmXc2HKB
yZDIzLZWiJ/Fu/KGhvIjt318DshL0mJFIrkeasdgRBaUWqDxYVkOaMlikKr6Opqb
tReUfjGOHHuYw7/O14oTGwKXnJj+nf4GyxxE7j94BZAk6TG/77lcJJXLeLeEpXKc
vX7B5cCak4WD1WP0/Gn1q5XTgWTY9cjszYvFjDR5ZEuxsbmd1pksWjGxODZXOg8v
tNEhOp4AH15tyv4o/bwxn606XdOUUyhxIxjhmat5vVWlfEK3wdCG5KZfGMydtm27
UwzhX3Qh9l03aqney6XME/ESPezgahabl2a/A6xbxfyjWBXZQjXcTaVQm3DsuXH0
49Btgi8khM5mLPA1eQCXQcToRUzZ/vLaNJnLBMYiH5/pkHQJ2Fs=
=w1qP
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
