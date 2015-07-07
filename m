From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-V5 4/4] mfd: devicetree: bindings: Add new 88pm800 mfd
 binding
Date: Tue, 7 Jul 2015 08:31:44 +0100
Message-ID: <20150707073144.GQ3182@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-5-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435591877-18214-5-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yizhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:

> With addition of DT support to 88pm800 mfd driver, this patch
> adds new DT binding documentation along with respective properties.
>=20
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/88pm800.txt | 53 +++++++++++++=
++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/88pm800.txt

=46or my own reference:
  Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yes, I plan to take this through the MFD tree.

> diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Docu=
mentation/devicetree/bindings/mfd/88pm800.txt
> new file mode 100644
> index 0000000..dec842f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
> @@ -0,0 +1,53 @@
> +* Marvell 88PM80x Power Management IC
> +
> +Required parent device properties:
> +- compatible		: "marvell,88pm800", "marvell,88pm805", "marvell,88pm8=
60"
> +- reg			: the I2C slave address for the 88pm80x family chip
> +- interrupts		: IRQ line for the 88pm80x family chip
> +- interrupt-controller	: describes the 88pm80x family chip as an int=
errupt
> +			  controller
> +- #interrupt-cells 	: should be 1.
> +			  The cell is the 88pm80x local IRQ number
> +
> +88pm80x family of devices consists of varied group of sub-devices:
> +
> +Device		 	Supply Names	 Description
> +------		 	------------	 -----------
> +88pm80x-onkey		:		: On key
> +88pm80x-rtc		:		: RTC
> +88pm80x-regulator	:		: Regulators
> +
> +Example:
> +
> +	pmic: 88pm800@30 {
> +		compatible =3D "marvell,88pm800";
> +		reg =3D <0x30>;
> +		interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&gic>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +
> +		regulators {
> +			compatible =3D "marvell,88pm80x-regulator";
> +
> +			buck1a: BUCK1A {
> +				regulator-name =3D "BUCK1A";
> +				regulator-min-microvolt =3D <600000>;
> +				regulator-max-microvolt =3D <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name =3D "LDO1";
> +				regulator-min-microvolt =3D <1700000>;
> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +
> +		rtc {
> +			compatible =3D "marvell,88pm80x-rtc";
> +		};
> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
