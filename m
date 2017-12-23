From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] clk: rockchip: Switch dt-binding headers for rk3328 to GPL/X11
Date: Sat, 23 Dec 2017 17:26:51 +0100
Message-ID: <2822025.zCoiRFqhzu@phil>
References: <20171223152254.11617-1-manu@freebsd.org> <CAOFm3uGdESYGtXP24AkHOLcLAJuGXhz1uvig=GVGAt-OagXFEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOFm3uGdESYGtXP24AkHOLcLAJuGXhz1uvig=GVGAt-OagXFEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am Samstag, 23. Dezember 2017, 17:19:58 CET schrieb Philippe Ombredanne:
> Dear Emmanuel,
> 
> On Sat, Dec 23, 2017 at 4:22 PM, Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org> wrote:
> > Since those files are also needed kernel side, switch their licences
> > to GPL/X11 so it can be used in BSD kernels.
> >
> > Signed-off-by: Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>

[...]

> > diff --git a/include/dt-bindings/power/rk3328-power.h b/include/dt-bindings/power/rk3328-power.h
> > index 02e3d7fc1cce..301f30967b39 100644
> > --- a/include/dt-bindings/power/rk3328-power.h
> > +++ b/include/dt-bindings/power/rk3328-power.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > +/* SPDX-License-Identifier: GPL-2.0 or X11 */
> >  #ifndef __DT_BINDINGS_POWER_RK3328_POWER_H__
> >  #define __DT_BINDINGS_POWER_RK3328_POWER_H__
> 
> What you call X11 is called MIT in SPDX and in Thomas doc patches [1],
> e.g. this tag is supposed to match the eyes-poking long legalese
> above, this should be instead:
> 
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> 
> Finally if the goal of this proposed license update is usage in
> FreeBSD and other BSD kernels, why use MIT as a second license? Would
> not a BSD be better and avoid license inflation on the BSD side?

I think it is likely meant to match the license used on the devicetree
files themselfs. For whatever reason the existing combination of
GPL+MIT was the preferred one, so the license inflation is already there
and it might be best to keep to the same combination for the headers
needed by those devicetree files?

Heiko


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
