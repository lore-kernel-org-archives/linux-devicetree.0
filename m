From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: memory: da8xx-ddrctl: new driver
Date: Thu, 27 Oct 2016 09:55:58 -0700
Message-ID: <m2insdg28x.fsf@baylibre.com>
References: <1477503355-2600-1-git-send-email-bgolaszewski@baylibre.com>
        <1477503355-2600-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477503355-2600-2-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
        (Bartosz Golaszewski's message of "Wed, 26 Oct 2016 19:35:54 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Create a new driver for the da8xx DDR2/mDDR controller and implement
> support for writing to the Peripheral Bus Burst Priority Register.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

[...]

> +	for (; setting->name; setting++) {
> +		knob = da8xx_ddrctl_match_knob(setting);
> +		if (!knob) {
> +			dev_warn(dev,
> +				 "no such config option: %s\n", setting->name);
> +			continue;
> +		}
> +
> +		if (knob->reg > (res->end - res->start - sizeof(u32))) {

Why the "- sizeof(u32)"?  Shouldn't this just be resource_size(res)?
(c.f. linux/ioport.h)

> +			dev_warn(dev,
> +				 "register offset of '%s' exceeds mapped memory size\n",
> +				 knob->name);
> +			continue;
> +		}
> +
> +		reg = __raw_readl(ddrctl + knob->reg);
> +		reg &= knob->mask;
> +		reg |= setting->val << knob->shift;
> +
> +		dev_dbg(dev, "writing 0x%08x to %s\n", reg, setting->name);
> +
> +		__raw_writel(reg, ddrctl + knob->reg);

Can you use the normal readl/writel here?  Or explain why the raw ones
are needed?

> +	}
> +
> +	return 0;
> +}
> +

Otherwise, looks good to me.  With the changes above, feel free to add

Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
