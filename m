From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: socfpga: Enable Arria10 OCRAM ECC on startup
Date: Wed, 30 Mar 2016 12:11:14 -0500
Message-ID: <alpine.DEB.2.02.1603301209360.21508@linux-builds1>
References: <1459351668-14622-1-git-send-email-tthayer@opensource.altera.com> <1459351668-14622-7-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459351668-14622-7-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 30 Mar 2016, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:

> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> Enable ECC for Arria10 On-Chip RAM on machine startup. The ECC has to be
> enabled before data is stored in memory otherwise the ECC will fail
> on reads.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---

[snip]

> +
> +void socfpga_init_arria10_ocram_ecc(void)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	/* Find the OCRAM EDAC device tree node */
> +	np = of_find_compatible_node(NULL, NULL, "altr,socfpga-a10-ocram-ecc");
> +	if (!np) {
> +		pr_err("Unable to find socfpga-a10-ocram-ecc\n");
> +		return;
> +	}
> +
> +	ret = altr_init_a10_ecc_block(np, A10_SYSMGR_ECC_INTSTAT_OCRAM,
> +				      ALTR_A10_OCRAM_ECC_EN_CTL, 0);

I think this is a no-no, you shouldn't be making a call directly into the driver
from here.

BR,
Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
