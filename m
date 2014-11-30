From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v4 09/15] tpm/tpm_i2c_stm_st33/dts/st33zp24_i2c: Add DTS Documentation
Date: Sun, 30 Nov 2014 13:55:34 +0100
Message-ID: <201411301355.35211.PeterHuewe@gmx.de>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com> <1413753085-9958-10-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413753085-9958-10-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

can I get an ACK from the device tree gurus?

Am Sonntag, 19. Oktober 2014, 23:11:19 schrieb Christophe Ricard:
> st33zp24 tpm can be seen as a trivial i2c device as other i2c tpm.
> However several other properties needs to be documented such as lpcpd=
=2E
>=20
> Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
> ---
>  .../devicetree/bindings/security/tpm/st33zp24.txt  | 36
> ++++++++++++++++++++++ 1 file changed, 36 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/security/tpm/st33zp24.txt
>=20
> diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24.=
txt
> b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt new fil=
e
> mode 100644
> index 0000000..eb48222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
> @@ -0,0 +1,36 @@
> +* STMicroelectronics SAS. ST33ZP24 TPM SoC
> +
> +Required properties:
> +- compatible: Should be "st,st33zp24_i2c".
> +- clock-frequency: I=C2=B2C work frequency.
> +- reg: address on the bus
> +
> +Optional ST33ZP24 Properties:
> +- interrupt-parent: phandle for the interrupt gpio controller
> +- interrupts: GPIO interrupt to which the chip is connected
> +- lpcpd-gpios: Output GPIO pin used for ST33ZP24 power management D1=
/D2
> state. +If set vps must present when the platform is going into
> sleep/hibernate mode. +
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


Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
