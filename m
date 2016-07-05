From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx: Add UDOO Neo support
Date: Tue, 5 Jul 2016 09:04:46 -0300
Message-ID: <CAOMZO5CQWz++TVKBKEMSQuyks3C+7Tx5=Frh6R+Qubcab=EbjA@mail.gmail.com>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de> <1467691450-22975-3-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467691450-22975-3-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 5, 2016 at 1:04 AM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> =
wrote:

> +/dts-v1/;
> +
> +#include "imx6sx-udoo-neo.dtsi"
> +
> +/ {
> +       model =3D "UDOO Neo Basic";

This should be something like:

model =3D "Udoo i.MX6 SoloX UDOO Neo Basic";

> +       compatible =3D "fsl,imx6sx";

compatible =3D "udoo,imx6sx-udoo-neo", "fsl,imx6sx";

Then you can also send a separate patch to add udoo to
Documentation/devicetree/bindings/vendor-prefixes.txt.

Same applies to other places in this patch.

> +&fec1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_enet1>;
> +       phy-mode =3D "rmii";
> +       phy-reset-gpios =3D <&gpio5 4 GPIO_ACTIVE_HIGH>;

Shouldn't this be GPIO_ACTIVE_LOW instead?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
