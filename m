From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 1/3] power-domain: add power domain drivers for
 Rockchip platform
Date: Wed, 22 Oct 2014 10:17:57 -0700
Message-ID: <CAD=FV=Urn8_F+g0G08MLG3TeJsycpoa5K8+rwGDeG=Pk7dFCqA@mail.gmail.com>
References: <1413964424-7599-1-git-send-email-jinkun.hong@rock-chips.com>
	<1413964424-7599-2-git-send-email-jinkun.hong@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413964424-7599-2-git-send-email-jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jinkun,

On Wed, Oct 22, 2014 at 12:53 AM, jinkun.hong
<jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> +#define to_rockchip_pd(_gpd) container_of(_gpd, struct rockchip_domain, base)
> +
> +static int rockchip_pmu_set_idle_request(struct rockchip_domain *pd,
> +                                        bool idle)
> +{
> +       u32 idle_mask = BIT(pd->idle_shift);
> +       u32 idle_target = idle << (pd->idle_shift);
> +       u32 ack_mask = BIT(pd->ack_shift);
> +       u32 ack_target = idle << (pd->ack_shift);
> +       unsigned int mask = BIT(pd->req_shift);
> +       unsigned int val;
> +       unsigned long flags;

warning: unused variable 'flags'


> +static int rockchip_pmu_set_power_domain(struct rockchip_domain *pd,
> +                                        bool on)
> +{
> +       unsigned long flags;

warning: unused variable 'flags'


I haven't done any review of these patches, but I'll say that I did
pick your patches (along with "PM / clock_ops: Add pm_clk_add_clk()"
from https://patchwork.kernel.org/patch/5105401/) and I was able to
boot up my system.  Also, your series plus a patch to set the GPU
power domain on rk3288 made suspend/resume work better.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
