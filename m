From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/7] ARM: dts: imx7s: Add node for GPC
Date: Mon, 29 May 2017 10:20:04 -0300
Message-ID: <CAOMZO5AE9Zz1QhGAKhPFOBMMdsf-=WP-VP115Mo-r+59oZhF2Q@mail.gmail.com>
References: <20170515145305.4465-1-andrew.smirnov@gmail.com> <20170515145305.4465-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170515145305.4465-4-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Mon, May 15, 2017 at 11:53 AM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add node for GPC and specify as a parent interrupt controller for SoC bus.
>
> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Your series has been applied and when I run Shawn's imx/dt I am not
able to boot mx7d-sdb.

With low level debug support I get:

[    0.276569] hw-breakpoint: maximum watchpoint size is 8 bytes.
[    0.285692] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.293671] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.301605] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.309566] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.317481] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.325447] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.333364] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.341299] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.349779] imx7d-pinctrl 302c0000.iomuxc-lpsr: initialized IMX
pinctrl driver
[    0.357735] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.366749] imx7d-pinctrl 30330000.iomuxc: initialized IMX pinctrl driver
[    0.375092] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.383303] vdd1p0d: supplied by regulator-dummy
[    0.388394] vdd1p0d: Bringing 0uV into 800000-800000uV
[    0.394800] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.402980] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.410851] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.419693] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.427539] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.435442] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.443341] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.451629] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.459504] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.467472] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.475350] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !
[    0.483263] irq: no irq domain found for
/soc/aips-bus@30000000/gpc@303a0000 !

Any ideas?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
