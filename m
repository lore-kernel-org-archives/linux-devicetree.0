From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 9/9] ARM: dts: imx7: add Toradex Colibri iMX7D 1GB
 (eMMC) support
Date: Sun, 17 Dec 2017 19:59:28 -0200
Message-ID: <CAOMZO5BXEj9AKeQEVNhDYMCydpe+PVnXjchvTAuuwdM7Yp6d2w@mail.gmail.com>
References: <20171217203723.15896-1-stefan@agner.ch> <20171217203723.15896-9-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171217203723.15896-9-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On Sun, Dec 17, 2017 at 6:37 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:

> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dts
> @@ -0,0 +1,20 @@
> +/*
> + * Copyright 2017 Toradex AG
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> + */

In the previous patch you used GPL-2.0 text, instead of GPL-2.0+.

The SPDX line should be the first one and start with a // style comment:

// SPDX-License-Identifier: (GPL-2.0 OR MIT)

Philippe, please confirm this is the correct way.

With this fixed you can add:

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
