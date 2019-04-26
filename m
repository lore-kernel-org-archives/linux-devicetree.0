From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: Add KOE
 tx14d24vm1bpa display description
Date: Fri, 26 Apr 2019 14:29:14 +0200
Message-ID: <20190426142914.45adfdae@jawa>
References: <20180412143715.6828-1-lukma@denx.de>
        <20190404112243.9473-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QOX5Xd8fL4u/irJU0gONYsV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404112243.9473-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/QOX5Xd8fL4u/irJU0gONYsV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> This commit adds documentation entry description for KOE's 5.7"
> display.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>=20
> ---
> Previous discussion (and Rob's Reviewed-by) about this patch
> https://patchwork.kernel.org/patch/10339595/
>=20
> Changes for v3 :
> - New patch

Gentle ping on this patch...

> ---
>  .../bindings/display/panel/koe,tx14d24vm1bpa.txt   | 42
> ++++++++++++++++++++++ 1 file changed, 42 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
>=20
> diff --git
> a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> new file mode 100644 index 000000000000..be7ac666807b --- /dev/null
> +++
> b/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> @@ -0,0 +1,42 @@ +Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x
> 240) TFT LCD panel +
> +Required properties:
> +- compatible: should be "koe,tx14d24vm1bpa"
> +- backlight: phandle of the backlight device attached to the panel
> +- power-supply: single regulator to provide the supply voltage
> +
> +Required nodes:
> +- port: Parallel port mapping to connect this display
> +
> +This panel needs single power supply voltage. Its backlight is
> conntrolled +via PWM signal.
> +
> +Example:
> +--------
> +
> +Example device-tree definition when connected to iMX53 based board
> +
> +	lcd_panel: lcd-panel {
> +		compatible =3D "koe,tx14d24vm1bpa";
> +		backlight =3D <&backlight_lcd>;
> +		power-supply =3D <&reg_3v3>;
> +
> +		port {
> +			lcd_panel_in: endpoint {
> +				remote-endpoint =3D <&lcd_display_out>;
> +			};
> +		};
> +	};
> +
> +Then one needs to extend the dispX node:
> +
> +	lcd_display: disp1 {
> +
> +		port@1 {
> +			reg =3D <1>;
> +
> +			lcd_display_out: endpoint {
> +				remote-endpoint =3D <&lcd_panel_in>;
> +			};
> +		};
> +	};




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/QOX5Xd8fL4u/irJU0gONYsV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlzC+ZoACgkQAR8vZIA0
zr0lYAf+IJnNCKzyRLvnjXawDB53bWGwWygFn8+i87scG/6xNTrawduWFhndYwoA
D8L0QtjGUwBt3H/VRzjdciKlUlUT8DjMrpnbA6X2MSW2bvlH0xwyUQfr/MsmWNIq
j6Y92E1kDnYfWWY1OzaOqfjtxqJ92dxM7CnHBRy2HdGl6fa9nYlnD6/I8T9BvkxJ
M20W6KCVIRqrg7mioponoRm34A7WyEqWNV3sUYScPTJlyS+rOemLl7Lm1B4dbdhc
myut2GPixVxzeJ9nlQJY7yTIzynteDePCL4pWYd49I62nke2qQ0QbrCh0OwuHjgb
3/boIMTzYLUAcdSSDdl+iGBIY+d3ew==
=7oyd
-----END PGP SIGNATURE-----

--Sig_/QOX5Xd8fL4u/irJU0gONYsV--
