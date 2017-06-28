From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Modified imx7d-sdb.dts file so that VLDO4 provides 2.8V
 for MIPI CSI/DSI
Date: Wed, 28 Jun 2017 17:19:50 -0300
Message-ID: <CAOMZO5A41QFoJsC2ST1kvpCOs3-unzHDrqXshHa=2ShWWCOyZg@mail.gmail.com>
References: <20170628174518.5950-1-mindentropy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170628174518.5950-1-mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mindentropy <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gautam,

On Wed, Jun 28, 2017 at 2:45 PM, mindentropy <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
>  * According to mx7sabresd schematics the MIPI CSI/DSI voltage rails
>    should be 2.8V but the voltage provided is a maximum of 3.3V and
>    minimum of 1.8V. Providing such a higher voltage might damage the
>    peripherals and violates the schematic settings.
>
> Signed-off-by: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Patch looks good, but the Subject could be improved to something like:

ARM: dts: imx7d-sdb: Set LDO4 to 2.8V
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
