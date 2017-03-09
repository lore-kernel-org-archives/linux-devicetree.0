From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 3/7] arm: dts: dt-bindings: Add Renesas RZ pinctrl header
Date: Thu, 9 Mar 2017 14:54:37 +0000
Message-ID: <SG2PR06MB1165A5A95A54365FF5E43FCF8A210@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487610788-6939-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Monday, February 20, 2017, Jacopo Mondi wrote:
>=20
> Add dt-bindings for Renesas r7s72100 pin controller header file.
>=20
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/dt-bindings/pinctrl/r7s72100-pinctrl.h | 30
> ++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/r7s72100-pinctrl.h
>=20
> diff --git a/include/dt-bindings/pinctrl/r7s72100-pinctrl.h b/include/dt-
> bindings/pinctrl/r7s72100-pinctrl.h
> new file mode 100644
> index 0000000..24759bf
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/r7s72100-pinctrl.h
> @@ -0,0 +1,30 @@
> +/*
> + * Defines macros and constants for Renesas RZ/A1 pin controller pin
> + * muxing functions.
> + */
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +#define __DT_BINDINGS_PINCTRL_RENESAS_RZA1_H
> +
> +#define RZA1_PINS_PER_PORT	16
> +
> +/* Create the pin index from it's bank and position numbers */
> +#define PIN(b, p)		((b) * RZA1_PINS_PER_PORT + (p))
> +
> +/* Flags to apply to alternate function configuration */
> +/*
> + * Pin needs input buffer enabled.
> + * This applies to pin which alternate function requires input
> capabilities.
> + * Eg: RX pin on a serial interface needs this flag to be set.
> + */
> +#define INPUT_EN		(1 << 3)

This is basically talking about the "Port Input Buffer Control Register"
(PIBCn) which is actually not that important. But, you are also using it
for the special cases where you have to manually define the pin to be eithe=
r
input or output....but I would just remove INPUT_EN.

For the PIBCn register, just set it automatically if you are going to
use the pin as a GPIO (in or out). I have not really found a case yet where
I had to set this bit for another other than GPIO-input.

I would prefer to see a different define that talks about the pin being bi-=
directional
which is required for things like I2C, SDHI, etc... and would be directly r=
elated
to the "Port Bidirection Control Register" (PBDCn) for each pin.

#define BI_DIR		(1 << 3)


Additionally, according to the RZ/A1 hardware manual:
 "When the output buffer is enabled and the PBDCn.PBDCnm bit is 1, the
  input buffer is enabled regardless of this register setting."

> +
> +/*
> + * Let software drive the pin I/O direction overriding the alternate
> function
> + * configuration.
> + * Some alternate function requires software to force I/O direction of a
> pin,
> + * ovverriding the designated one.
> + * Reference to the HW manual to know when this flag shall be used.
> + */
> +#define SWIO			(1 << 4)

For "software I/O" settings, you were using INPUT_EN to determine input or =
output.

To make things simple, I would just define:
#define SWIO_IN			(1 << 4)
#define SWIO_OUT			(1 << 5)


So in summary, this is how I think things should look in the DT:

Example of a 'normal' pin (most of the pins).
		/* P3_0 as TxD2; P3_2 as RxD2 */
		renesas,pins =3D <PIN(3, 0) 6>,
			       <PIN(3, 2) 4>;

Example of pins that need bi-directional specified:
		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
		renesas,pins =3D <PIN(1, 4) (1 | BI_DIR)>,
			       <PIN(1, 5) (1 | BI_DIR)>;


Example of pins that need software I/O manually specified (because they are
whacky pins) as defined by Table 54.7:

		/* MTU2 TIOC0A as input capture */
		renesas,pins =3D <PIN(4, 0) (2 | SWIO_IN)>;

		/* MTU2 TIOC0A as output compare */
		renesas,pins =3D <PIN(4, 0) (2 | SWIO_OUT)>;

		/* LVDS */
		renesas,pins =3D <PIN(5, 0) (1 | SWIO_IN)>; /* the spec says to put these=
 as inputs */

		/* SSI Audio */
		renesas,pins =3D <PIN(2, 11) (4 | SWIO_OUT)>;

		/* Watchdog Overflow */
		renesas,pins =3D <PIN(3, 7) (8 | SWIO_OUT)>;



Chris

