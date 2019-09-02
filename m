From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Date: Mon, 2 Sep 2019 11:35:17 +0200
Message-ID: <20190902093517.GA12946@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2015802104=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190902090633.24239-1-linus.walleij@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============2015802104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 11:06:32AM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Sony ACX424AKP panel.
> Let's use YAML.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../display/panel/sony,acx424akp.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,=
acx424akp.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424a=
kp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.ya=
ml
> new file mode 100644
> index 000000000000..29f41fee1b69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony ACX424AKP 4" 480x864 AMOLED panel
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,acx424akp
> +  reg: true
> +  port: true
> +  reset-gpios: true
> +  vddi-supply:
> +     description: regulator that supplies the vddi voltage
> +  dsi-command-mode:
> +     type: boolean
> +     description:
> +       If this is specified, the panel will be used in command
> +       mode instead of video mode.

I'm not sure there's concensus on this one yet. I think so far the
driver decides which mode to use the panel in. Technically this falls
into the category of configuration, so it doesn't really belong in the
DT.

I vaguely recall from discussions I've had on this subject that there's
usually no reason to do video mode if you can do command mode because
command mode is more power efficient. This was a long time ago, so I may
be misremembering. Perhaps you have different information on this?

Thierry

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +  - reset-gpios
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel@0 {
> +        compatible =3D "sony,acx424akp";
> +        reg =3D <0>;
> +        vddi-supply =3D <&foo>;
> +        reset-gpios =3D <&foo_gpio 0 GPIO_ACTIVE_LOW>;
> +
> +        port {
> +            panel_in: endpoint {
> +                remote-endpoint =3D <&dsi_out>;
> +            };
> +        };
> +    };
> +
> +...
> \ No newline at end of file
> --=20
> 2.21.0
>=20

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s4lAACgkQ3SOs138+
s6FUmRAAssnTFG30GwN6PL97FSCIhD/zIteo1zy1RyqFbFYPWPV/o1y8MhXBG7oQ
2RXLvB6k2GBjS2sNE1nIutDjTNG42pmnidIpDZxW0Tc7zra9+mE1Itgae4/kiKDw
pLuk1Qoc4TSvI/G3ScyASZw6rMTSr+JJN9pPWfek5K8+Fq6LXNNnoCkPjnsNpBH3
YOYsssA1JWNYqME4ve7f0O3NxYkv1XUFVha5XKhVbkJfn/8VJ8ABXyGG/UWFb75s
7hpLUkjHpO6d57kM9vJExrbXuvuefCj68n2x0CedHCd0NolwDwWfW7tghK3/S94l
SYNwppctPlx+D2vhBp5NUZO2yQfE4aOGLLezdkKdHaNAsJaMR+1eq5BU5eW8wGvE
K5Eu6QBnr+XtZ1bFxJdxq9F+cEZTIr3AB74Sd1Z4TAmgEJ8/u+16ppiPalSjCp34
jqODdxrxqLykN25eAwn96RlU8S/CdrCRnge8tal9iuP90gH1wj+Vn9ipxhMXHCPj
pV4F11fSei7xrXXt1hRGofXBUsO6dLJtaUHk3hhZa5oC76QWsVpULSxzqmHJyFdF
KUrh0JANdC4uUKaeSQs4NoVXAnq7AdRRCX771Ipycl0thV6kTSyrUI/Py1ukJajI
Q8t8xP/SUtklxhd9Tw1/bLJzy4f9+I/vBDbRK3GzkpsbxMkD3es=
=VxoP
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============2015802104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2015802104==--
