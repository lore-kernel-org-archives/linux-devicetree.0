From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] NFC: pn544_i2c: Add DTS Documentation
Date: Mon, 31 Mar 2014 16:25:50 +0100
Message-ID: <20140331152550.GA15064@e106331-lin.cambridge.arm.com>
References: <6ec915ed416745248c5ed4aa22dfe0e6@AMXPR04MB136.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6ec915ed416745248c5ed4aa22dfe0e6-fjMGVQzTDdguRZvghep3ngfhPeD8jYilXA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-y27Ovi1pjclAfugRpC6u6w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 01:22:24PM +0100, Clement Perrochaud wrote:
> Describe the properties used by the PN544 NFC controller driver.
>=20
> Signed-off-by: Cl=C3=A9ment Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
> ---
>  .../devicetree/bindings/net/nfc/pn544.txt          | 32 ++++++++++++=
++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nfc/pn544.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/net/nfc/pn544.txt b/Do=
cumentation/devicetree/bindings/net/nfc/pn544.txt
> new file mode 100644
> index 0000000..2017ad5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nfc/pn544.txt
> @@ -0,0 +1,32 @@
> +* NXP Semiconductors PN544 NFC Controller
> +
> +Required properties:
> +- compatible: Should be "nxp,pn544_i2c".

s/_/-/ in compatible strings and property names, please.

> +- clock-frequency: I=C2=B2C work frequency.
> +- reg: address on the bus
> +- irq: Input GPIO pin used for interrupt requests from the controlle=
r

As this is an interrupt from the point of view of the device, I would
prefer this described as an interrupt (using the standard interrupts
property), with the GPIO controller described as an interrupt
controller.

> +- en: Output GPIO pin used for enabling/disabling the PN544

enable-gpios?

> +- fw:Output GPIO pin used to enter firmware download mode

firmware-gpios?

Cheers,
Mark.

> +
> +Optional SoC Specific Properties:
> +- pinctrl-names: Contains only one value - "default".
> +- pintctrl-0: Specifies the pin control groups used for this control=
ler.
> +
> +Example (for ARM-based BeagleBone with PN544 on I2C2):
> +
> +&i2c2 {
> +
> +	status =3D "okay";
> +
> +    pn544: pn544@28 {
> +
> +        compatible =3D "nxp,pn544_i2c";
> +
> +        reg =3D <0x28>;
> +        clock-frequency =3D <400000>;
> +
> +        irq  =3D <&gpio1 17 GPIO_ACTIVE_HIGH>;
> +        en =3D <&gpio3 21 GPIO_ACTIVE_HIGH>;
> +        fw =3D <&gpio3 19 GPIO_ACTIVE_HIGH>;
> +    };
> +};
> --=20
> 1.9.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
