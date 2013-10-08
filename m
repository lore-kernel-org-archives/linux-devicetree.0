From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] ARM: integrator: delete non-devicetree boot path
Date: Tue, 8 Oct 2013 10:51:48 +0100
Message-ID: <20131008095148.GD28972@e106331-lin.cambridge.arm.com>
References: <1380816202-3128-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380816202-3128-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[Adding devicetree to Cc]

On Thu, Oct 03, 2013 at 05:03:22PM +0100, Linus Walleij wrote:
> The Device Tree boot path now supports everything the ATAG
> boot can provide, and the two are equivalent. This deletes
> the ATAG boot path from the Integrator/AP and
> Integrator/CP platforms to move them on to the future.
> 
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/Kconfig                         |   1 +
>  arch/arm/mach-integrator/core.c          |  57 ----------
>  arch/arm/mach-integrator/integrator_ap.c | 135 ------------------------
>  arch/arm/mach-integrator/integrator_cp.c | 173 -------------------------------
>  arch/arm/mach-integrator/pci_v3.c        | 122 +++++-----------------
>  5 files changed, 25 insertions(+), 463 deletions(-)
> 

[...]

> +static int __init pci_v3_probe(struct platform_device *pdev)
>  {
> +       struct device_node *np = pdev->dev.of_node;
>         struct of_pci_range_parser parser;
>         struct of_pci_range range;
>         struct resource *res;
>         int irq, ret;
> 
> +       /* Remap the Integrator system controller */
> +       ap_syscon_base = ioremap(INTEGRATOR_SC_BASE, 0x100);

It seems a shame that this didn't get described in the DT. This hasn't
been fully moved over...

> +       if (!ap_syscon_base) {
> +               dev_err(&pdev->dev, "unable to remap the AP syscon for PCIv3\n");
> +               return -ENODEV;
> +       }
> +
> +       /* Device tree probe path */
> +       if (!np) {
> +               dev_err(&pdev->dev, "no device tree node for PCIv3\n");
> +               return -ENODEV;
> +       }

We didn't unmap the syscon registers, yet we mapped them here. Either
we've got a useless mapping, or we're mapping it from the wrong block of
code...

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
