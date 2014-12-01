From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 11/15] tpm/tpm_i2c_stm_st33/dts/st33zp24_i2c: Add DTS
 Documentation
Date: Mon, 1 Dec 2014 10:46:29 +0000
Message-ID: <20141201104629.GD17070@leverpostej>
References: <1417393247-4479-1-git-send-email-christophe-h.ricard@st.com>
 <1417393247-4479-12-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1417393247-4479-12-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "christophe-h.ricard-qxv4g6HH51o@public.gmane.org" <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>, "jean-luc.blanc-qxv4g6HH51o@public.gmane.org" <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 12:20:43AM +0000, Christophe Ricard wrote:
> st33zp24 tpm can be seen as a trivial i2c device as other i2c tpm.
> However several other properties needs to be documented such as lpcpd=
=2E
>=20
> Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/security/tpm/st33zp24.txt  | 36 ++++++++++++=
++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/security/tpm/st=
33zp24.txt
>=20
> diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24.=
txt b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
> new file mode 100644
> index 0000000..eb48222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
> @@ -0,0 +1,36 @@
> +* STMicroelectronics SAS. ST33ZP24 TPM SoC
> +
> +Required properties:
> +- compatible: Should be "st,st33zp24_i2c".

s/_/-/ in property names and compatible strings, please.

> +- clock-frequency: I=C2=B2C work frequency.
> +- reg: address on the bus
> +
> +Optional ST33ZP24 Properties:
> +- interrupt-parent: phandle for the interrupt gpio controller
> +- interrupts: GPIO interrupt to which the chip is connected
> +- lpcpd-gpios: Output GPIO pin used for ST33ZP24 power management D1=
/D2 state.
> +If set vps must present when the platform is going into sleep/hibern=
ate mode.

What is 'vps'?

Mark.

> +
> +Optional SoC Specific Properties:
> +- pinctrl-names: Contains only one value - "default".
> +- pintctrl-0: Specifies the pin control groups used for this control=
ler.
> +
> +Example (for ARM-based BeagleBoard xM with ST33ZP24 on I2C2):
> +
> +&i2c2 {
> +
> +        status =3D "okay";
> +
> +        st33zp24: st33zp24@13 {
> +
> +                compatible =3D "st,st33zp24_i2c";
> +
> +                reg =3D <0x013>;
> +                clock-frequency =3D <400000>;
> +
> +                interrupt-parent =3D <&gpio5>;
> +                interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                lpcpd-gpios =3D <&gpio5 15 GPIO_ACTIVE_HIGH>;
> +        };
> +};
> --=20
> 2.1.0
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
