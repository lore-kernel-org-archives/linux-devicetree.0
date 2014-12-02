From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v9 3/8] devicetree: mfd: Add new SKY81452 mfd binding
Date: Tue, 2 Dec 2014 14:07:27 +0000
Message-ID: <20141202140727.GD22522@x1>
References: <1417507529-13654-1-git-send-email-jack.yoo@skyworksinc.com>
 <1417507529-13654-4-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417507529-13654-4-git-send-email-jack.yoo@skyworksinc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gyungoh@gmail.com
Cc: sameo@linux.intel.com, jg1.han@samsung.com, cooloney@gmail.com, broonie@kernel.org, lgirdwood@gmail.com, jack.yoo@skyworksinc.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, grant.likely@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, pawel.moll@arm.com, heiko@sntech.de, jason@lakedaemon.net, treding@nvidia.com, florian.vaussard@epfl.ch, trivial@kernel.org, linux@roeck-us.net, andrew@lunn.ch, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

This requires a DT Ack.

> From: Gyungoh Yoo <jack.yoo@skyworksinc.com>
>=20
> Signed-off-by: Gyungoh Yoo <jack.yoo@skyworksinc.com>
> ---
> Changes v9:
> Nothing
>=20
> Changes v8:
> Made up the example for backlight DT
>=20
> Changes v7:
> Nothing
>=20
> Changes v6:
> Nothing
>=20
> Changes v5:
> Changed DT for regulator : 'lout' node should be defined under 'regul=
ator'
> Removed compatible string from sky81452-regulator driver
>=20
> Changes v4:
> Nothing
>=20
> Changes v3:
> Nothing
>=20
> Changes v2:
> Added reg attribute for I2C slave address
>=20
>  Documentation/devicetree/bindings/mfd/sky81452.txt | 36 ++++++++++++=
++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/sky81452.txt b/Doc=
umentation/devicetree/bindings/mfd/sky81452.txt
> new file mode 100644
> index 0000000..ab71473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sky81452.txt
> @@ -0,0 +1,36 @@
> +SKY81452 bindings
> +
> +Required properties:
> +- compatible	: Must be "skyworks,sky81452"
> +- reg		: I2C slave address
> +
> +Required child nodes:
> +- backlight	: container node for backlight following the binding
> +		in video/backlight/sky81452-backlight.txt
> +- regulator	: container node for regulators following the binding
> +		in regulator/sky81452-regulator.txt
> +
> +Example:
> +
> +	sky81452@2c {
> +		compatible =3D "skyworks,sky81452";
> +		reg =3D <0x2c>;
> +
> +		backlight {
> +			compatible =3D "skyworks,sky81452-backlight";
> +			name =3D "pwm-backlight";
> +			skyworks,en-channels =3D <0x3f>;
> +			skyworks,ignore-pwm;
> +			skyworks,phase-shift;
> +			skyworks,ovp-level =3D <20>;
> +			skyworks,current-limit =3D <2300>;
> +		};
> +
> +		regulator {
> +			lout {
> +				regulator-name =3D "sky81452-lout";
> +				regulator-min-microvolt =3D <4500000>;
> +				regulator-max-microvolt =3D <8000000>;
> +			};
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
