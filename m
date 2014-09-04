From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Thu, 4 Sep 2014 18:45:02 +0200
Message-ID: <CACRpkdZJSf+EfYN=hHxRnpjQZGuqroBL0c+08Ng=dRkS0GZySA@mail.gmail.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
	<1409161588-19417-4-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409161588-19417-4-git-send-email-alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Weike Chen <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boon Leong Ong <boon.leong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Andriy Shevchenko <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hock Leong Kweh <hock.leong.kweh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 7:46 PM, Weike Chen <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:

> This patch enables suspend and resume mode for the power management, and
> it is based on Josef Ahmad's previous work.
>
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Weike Chen <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

(...)

> +#if defined CONFIG_PM_SLEEP

I wonder whether it's worth #ifdef:in out such things, it clutters
the place.

> +/* Store GPIO context across system-wide suspend/resume transitions */
> +static struct gpio_saved_regs {

Call the struct:

struct dwapb_context

because that is easier to understand.

> +       unsigned long data;
> +       unsigned long dir;
> +       unsigned long int_en;
> +       unsigned long int_mask;
> +       unsigned long int_type;
> +       unsigned long int_pol;
> +       unsigned long int_deb;
> +} saved_regs;

Singleton huh?

Insert this into the dynamically allocated per-port or chip struct
instead.

+       dwapb_write(gpio, GPIO_SWPORTA_DR, saved_regs.data);
+       dwapb_write(gpio, GPIO_SWPORTA_DDR, saved_regs.dir);

And port B, C, D?

This looks like a crude hack.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
