From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Sat, 16 Mar 2019 13:29:23 +0100
Message-ID: <1552739363.1562.0@crapouillou.net>
References: <20190315170701.29670-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315170701.29670-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le ven. 15 mars 2019 =E0 18:06, Paul Cercueil <paul@crapouillou.net> a=20
=E9crit :
> Add documentation for the devicetree bindings of the DRM driver for=20
> the
> JZ47xx family of SoCs from Ingenic.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>=20
> Notes:
>     v2: Remove ingenic,panel property.
>=20
>  .../devicetree/bindings/display/ingenic,drm.txt    | 29=20
> ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/display/ingenic,drm.txt
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/display/ingenic,drm.txt=20
> b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> new file mode 100644
> index 000000000000..f57a4ae0f7ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> @@ -0,0 +1,29 @@
> +Ingenic JZ47xx DRM driver
> +
> +Required properties:
> +- compatible: one of:
> +  * ingenic,jz4740-drm
> +  * ingenic,jz4725b-drm

Ooops, I forgot to fix what Rob pointed out. Will do in V3.

-Paul

> +- reg: LCD registers location and length
> +- clocks: LCD pixclock and device clock specifiers.
> +	   The device clock is only required on the JZ4740.
> +- clock-names: "lcd_pclk" and "lcd"
> +- interrupts: Specifies the interrupt line the LCD controller is=20
> connected to.
> +
> +Optional properties:
> +- ingenic,lcd-mode: LCD mode to use with the display panel.
> +		    See <dt-bindings/display/ingenic,drm.h> for all the
> +		    possible values.
> +
> +Example:
> +
> +lcd: lcd-controller@13050000 {
> +	compatible =3D "ingenic,jz4725b-drm";
> +	reg =3D <0x13050000 0x1000>;
> +
> +	interrupt-parent =3D <&intc>;
> +	interrupts =3D <31>;
> +
> +	clocks =3D <&cgu JZ4725B_CLK_LCD>;
> +	clock-names =3D "lcd";
> +};
> --
> 2.11.0
>=20
=
