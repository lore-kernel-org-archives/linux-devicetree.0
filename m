From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Date: Wed, 30 Mar 2016 12:35:32 +0100
Message-ID: <20160330113532.GI3323@x1>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, pawell.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:

> From: Thor Thayer <tthayer@opensource.altera.com>
>=20
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device, it has two subdevices:
>      - GPIO
>      - HWMON
>=20
> This patch adds documentation for the Altera A10-SR DT bindings.
>=20
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++=
++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10s=
r.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b=
/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> new file mode 100644
> index 0000000..564c761
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> @@ -0,0 +1,35 @@
> +* Altera Arria10 Development Kit System Resource Chip
> +
> +Required parent device properties:
> +- compatible : "altr,altr_a10sr"
> +- spi-max-frequency : Maximum SPI frequency.
> +- reg : the SPI Chip Select address for the Arria10 System Resource =
chip

DT bindings are much easier to read in the following format:

- compatible		: "altr,altr_a10sr"
- spi-max-frequency	: Maximum SPI frequency.
- reg			: the SPI Chip Select address for the Arria10 System Resource c=
hip

=2E.. also, sentences start with an uppercase char.

> +The A10SR consists of this varied group of sub-devices:
> +
> +Device                   Description
> +------                   ----------
> +altr_a10sr_gpio          GPIO Controller
> +altr_a10sr_hwmon         Hardware Monitor
> +
> +The LEDs are implemented entirely in the device tree using
> +the gpio-led framework.

This is a Linuxisum and should not live in DT bindings.

> +Example:
> +
> +        a10-sr: a10-sr@0 {

Nodes should be named after their device 'type'.

Does this device really start a address 0?

> +		compatible =3D "altr,altr-a10sr";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <100000>;
> +
> +		a10sr_gpio: a10sr_gpio {

Device type only please.

> +			compatible =3D "altr,a10sr-gpio";
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			ngpios =3D <16>;
> +		};
> +
> +		a10sr_hwmon: a10sr_hwmon {

Device type only please.

> +			compatible =3D "altr,a10sr-hwmon";
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
