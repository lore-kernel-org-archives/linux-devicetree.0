From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Mon, 11 Jan 2016 05:49:08 +0000
Message-ID: <20160111054908.GE3331@x1>
References: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
 <1452218729-11357-3-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452218729-11357-3-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 08 Jan 2016, Wenyou Yang wrote:

> The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
> two subdevices:
>  - Regulator
>  - Charger

Is this really an MFD?  What special handling does it require?

> This patch adds documentation for ACT8945A DT bindings.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>=20
>  Documentation/devicetree/bindings/mfd/act8945a.txt |   16 ++++++++++=
++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.tx=
t
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Doc=
umentation/devicetree/bindings/mfd/act8945a.txt
> new file mode 100644
> index 0000000..406db16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
> @@ -0,0 +1,16 @@
> +Device-Tree bindings for Active-semi ACT8945A MFD driver
> +
> +Required properties:
> + - compatible: "active-semi,act8945a".
> + - reg: the I2C slave address for the ACT8945A chip
> +
> +The chip exposes two subdevices:
> + - a regulators: see ../regulator/act8945a-regulator.txt
> + - a charger: see ../power/act8945a-charger.txt
> +
> +Example:
> +	mfd: act8945a@5b {

"mfd" is too generic to be a label.

Why do you need a label in any case?

> +		compatible =3D "active-semi,act8945a";
> +		reg =3D <0x5b>;
> +		status =3D "okay";
> +	};

This doesn't look much like an MFD to me.

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
