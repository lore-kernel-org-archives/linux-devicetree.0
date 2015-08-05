From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: mediatek: add smp bringup code
Date: Wed, 5 Aug 2015 23:26:46 +0100
Message-ID: <20150805222646.GA4699@n2100.arm.linux.org.uk>
References: <1436851111-2369-1-git-send-email-yingjoe.chen@mediatek.com>
 <1436851111-2369-4-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1436851111-2369-4-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 14, 2015 at 01:18:29PM +0800, Yingjoe Chen wrote:
> +static void __init __mtk_smp_prepare_cpus(unsigned int max_cpus, int trustzone)
> +{
> +	int i, num;
> +	const struct of_device_id *infos;
> +
> +	if (trustzone) {
> +		num = ARRAY_SIZE(mtk_tz_smp_boot_infos);
> +		infos = mtk_tz_smp_boot_infos;
> +	} else {
> +		num = ARRAY_SIZE(mtk_smp_boot_infos);
> +		infos = mtk_smp_boot_infos;
> +	}
> +
> +	/* Find smp boot info for this SoC */
> +	for (i = 0; i < num; i++) {
> +		if (of_machine_is_compatible(infos[i].compatible)) {
> +			mtk_smp_info = infos[i].data;
> +			break;
> +		}
> +	}
> +
> +	if (!mtk_smp_info) {
> +		pr_err("%s: Device is not supported\n", __func__);
> +		return;
> +	}
> +
> +	if (trustzone) {
> +		if (memblock_reserve(mtk_smp_info->smp_base, MTK_SMP_REG_SIZE)) {

Strong NAK.

This is _FAR_ too late to be calling memblock_reserve().  You won't be
reserving memory as you think you are (it's already handed over to the
kernel's allocators by this stage.)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
