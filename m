From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Fri, 9 Sep 2016 17:57:24 -0300
Message-ID: <CAOMZO5Co0CXMY1uWcF+_vN=+0wFSw1VrN-+c9AuY7zNq2WKLTQ@mail.gmail.com>
References: <1473453312-2786-1-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473453312-2786-1-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 9, 2016 at 5:35 PM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> +/dts-v1/;
> +
> +#include "imx6q.dtsi"
> +#include "imx6qdl-icore.dtsi"
> +
> +/ {
> +       model = "Engicam i.CoreM6 Quad/Dual Starter Kit";
> +       compatible = "fsl,imx6-icore", "fsl,imx6q";

Should be:
 compatible = "engicam,imx6-icore", "fsl,imx6q";

You could also send a patch adding engicam entry to
Documentation/devicetree/bindings/vendor-prefixes.txt

> +};
> +
> +&can1 {
> +       status = "oaky";

Should be "okay"

> +};
> +
> +&can2 {
> +       status = "oaky";

Should be "okay"

> +&iomuxc {
> +       pinctrl_flexcan1: flexcan1grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_ROW2__FLEXCAN1_RX 0x80000000
> +                       MX6QDL_PAD_KEY_COL2__FLEXCAN1_TX 0x80000000

No 0x80000000, please. Use the real IOMUX register value instead.


> +               >;
> +       };
> +
> +       pinctrl_flexcan2: flexcan2grp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x80000000
> +                       MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x80000000

Same here.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
