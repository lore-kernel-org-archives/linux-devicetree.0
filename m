From: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2 1/2] dt-binding: regulator: anatop: make regulator name
 property required
Date: Wed, 19 Apr 2017 15:33:03 +0000
Message-ID: <DB5PR04MB1431C0B3F327E547A001D57580180@DB5PR04MB1431.eurprd04.prod.outlook.com>
References: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492180234-2496-1-git-send-email-aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "A.S. Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Dong Aisheng [mailto:aisheng.dong-3arQi8VN3Tc@public.gmane.org]
> Sent: Friday, April 14, 2017 10:31 PM
> To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: A.S. Dong; Rob Herring; Mark Rutland; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: [PATCH v2 1/2] dt-binding: regulator: anatop: make regulator nam=
e
> property required
>=20
> We actually can't allow the missing of the regualor name, thus update the
> binding doc to make regulator-name property to be required.
>=20
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

Sorry, Mark, missed you about this one.

Regards
Dong Aisheng

> ---
>  Documentation/devicetree/bindings/regulator/anatop-regulator.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/anatop-
> regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-
> regulator.txt
> index 1d58c8c..a3106c7 100644
> --- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
> @@ -2,6 +2,7 @@ Anatop Voltage regulators
>=20
>  Required properties:
>  - compatible: Must be "fsl,anatop-regulator"
> +- regulator-name: A string used as a descriptive name for regulator
> +outputs
>  - anatop-reg-offset: Anatop MFD register offset
>  - anatop-vol-bit-shift: Bit shift for the register
>  - anatop-vol-bit-width: Number of bits used in the register
> --
> 2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
