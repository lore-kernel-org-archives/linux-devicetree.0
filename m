From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/1] ARM: dts: imx53: Add GE Healthcare PPD
Date: Wed, 12 Jul 2017 09:32:44 -0300
Message-ID: <CAOMZO5D6xw4hVCOWfM0+++PQ87xBwihGSCJZsW8qBdn==vrLvA@mail.gmail.com>
References: <cffaa6f22474ff2ba4ca46d4252d35fc75cb0dd7.1499779628.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cffaa6f22474ff2ba4ca46d4252d35fc75cb0dd7.1499779628.git.martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 10:42 AM, Martyn Welch
<martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:

> Changes since PATCHv3: https://patchwork.kernel.org/patch/9819017/
>  - licensing modified
>  - manufacturer changed to GE
>  - regulator nodes corrected
>  - backlight node corrected
>  - flags rather than magic numbers used
>  - registers for usbphys added
>  - set up IOMUX configuration correctly
>  - various whitespace corrections
>  - removed unused fsl,mode node

Actually I still see 'fsl,mode' under the ssi2 node. Please remove it.

> +#define I2C_PAD_CTL 0xc0000000

This still sets bits 31, which means the kernel will rely on the IOMUX
configuration from the bootloader.

It is better if you could just pass the real IOMUX values here instead.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
