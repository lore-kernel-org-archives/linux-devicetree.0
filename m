From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v6] drm/rockchip: hdmi: add Innosilicon HDMI support
Date: Tue, 26 Jan 2016 01:45:19 +0100
Message-ID: <1453769119.17181.37.camel@tiscali.nl>
References: <1453686197-20975-1-git-send-email-ykk@rock-chips.com>
	 <1453686430-21470-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453686430-21470-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ken Mixte <kmixter-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ben Chan <benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Zheng Yang <zhengyang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On ma, 2016-01-25 at 09:47 +0800, Yakir Yang wrote:
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig

> +config ROCKCHIP_INNO_HDMI
> +	tristate "Rockchip specific extensions for Innosilicon HDMI"
> +        depends on DRM_ROCKCHIP
> +        help
> +	  This selects support for Rockchip SoC specific extensions
> +	  for the Innosilicon HDMI driver. If you want to enable
> +	  HDMI on RK3036 based SoC, you should selet this option.

(Really trivial: start indentation with tabs only, please. And
s/selet/select/.)

> --- /dev/null
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c

> + * This software is licensed under the terms of the GNU General
> Public
> + * License version 2, as published by the Free Software Foundation,
> and
> + * may be copied, distributed, and modified under those terms.

This states this file is licensed GPL v2 only.

> +MODULE_LICENSE("GPL");

And, according to include/linux/module.h, this means "GNU Public License
v2 or later".

So I think there's a (subtle) mismatch between the license ident used
for this driver and the comment above.

Thanks,


Paul Bolle
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
