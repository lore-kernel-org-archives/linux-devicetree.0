From: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: add SMP support for Broadcom mobile SoCs
Date: Fri, 4 Apr 2014 08:30:16 -0700
Message-ID: <CAAYSxhqOh4F=vSDJYUwFE85og-Tgc9Hi8c79biEZYYjb8z1Qkg@mail.gmail.com>
References: <1396577891-2713-1-git-send-email-elder@linaro.org>
	<1396577891-2713-3-git-send-email-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396577891-2713-3-git-send-email-elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 3, 2014 at 7:18 PM, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> diff --git a/arch/arm/mach-bcm/platsmp.c b/arch/arm/mach-bcm/platsmp.c
> new file mode 100644
> index 0000000..46a64f2
> --- /dev/null
> +++ b/arch/arm/mach-bcm/platsmp.c

> +/* Size of mapped Cortex A9 SCU address space */
> +#define SCU_SIZE               0x58

> +/*
> + * Enable the Cortex A9 Snoop Control Unit
> + *
> + * By the time this is called we already know there are multiple
> + * cores present.  We assume we're running on a Cortex A9 processor,
> + * so any trouble getting the base address register or getting the
> + * SCU base is a problem.
> + *
> + * Return 0 if successful or an error code otherwise.
> + */
> +static int __init scu_a9_enable(void)
> +{
> +       unsigned long config_base;
> +       void __iomem *scu_base;
> +
> +       if (!scu_a9_has_base()) {
> +               pr_err("no configuration base address register!\n");
> +               return -ENXIO;
> +       }
> +
> +       /* Config base address register value is zero for uniprocessor */
> +       config_base = scu_a9_get_base();
> +       if (!config_base) {
> +               pr_err("hardware reports only one core; disabling SMP\n");
> +               return -ENOENT;
> +       }
> +
> +       scu_base = ioremap((phys_addr_t)config_base, SCU_SIZE);
> +       if (!scu_base) {
> +               pr_err("failed to remap config base (%lu/%u) for SCU\n",
> +                       config_base, SCU_SIZE);
> +               return -ENOMEM;
> +       }
> +
> +       scu_enable(scu_base);
> +
> +       iounmap(scu_base);      /* That's the last we'll need of this */
> +
> +       return 0;
> +}

This function seems useful for Cortex A9 MPCore in general.

While you gave it a generic name, you put it in a Broadcom file.

Is there a better location for this code?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
