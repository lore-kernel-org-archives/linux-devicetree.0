From: Rameshwar Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH] dmaengine: xgene-dma: Add ACPI support for X-Gene DMA
 engine driver
Date: Thu, 13 Aug 2015 12:48:28 +0530
Message-ID: <CAFd313zR468nZN+CZZ+efr9eKoY4N72jQ8+cF=iH+vkZEZ=7Xg@mail.gmail.com>
References: <1437484479-2822-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437484479-2822-1-git-send-email-rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Tue, Jul 21, 2015 at 6:44 PM, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org> wrote:
> This patch adds ACPI support for the APM X-Gene DMA engine driver.
>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
> ---
>  drivers/dma/xgene-dma.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
> index dff22ab..d0a148d 100644
> --- a/drivers/dma/xgene-dma.c
> +++ b/drivers/dma/xgene-dma.c
> @@ -21,6 +21,7 @@
>   * NOTE: PM support is currently not available.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -1944,16 +1945,18 @@ static int xgene_dma_probe(struct platform_device *pdev)
>                 return ret;
>
>         pdma->clk = devm_clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(pdma->clk)) {
> +       if (IS_ERR(pdma->clk) && !ACPI_COMPANION(&pdev->dev)) {
>                 dev_err(&pdev->dev, "Failed to get clk\n");
>                 return PTR_ERR(pdma->clk);
>         }
>
>         /* Enable clk before accessing registers */
> -       ret = clk_prepare_enable(pdma->clk);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to enable clk %d\n", ret);
> -               return ret;
> +       if (!IS_ERR(pdma->clk)) {
> +               ret = clk_prepare_enable(pdma->clk);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "Failed to enable clk %d\n", ret);
> +                       return ret;
> +               }
>         }
>
>         /* Remove DMA RAM out of shutdown */
> @@ -1998,7 +2001,8 @@ err_request_irq:
>
>  err_dma_mask:
>  err_clk_enable:
> -       clk_disable_unprepare(pdma->clk);
> +       if (!IS_ERR(pdma->clk))
> +               clk_disable_unprepare(pdma->clk);
>
>         return ret;
>  }
> @@ -2022,11 +2026,20 @@ static int xgene_dma_remove(struct platform_device *pdev)
>                 xgene_dma_delete_chan_rings(chan);
>         }
>
> -       clk_disable_unprepare(pdma->clk);
> +       if (!IS_ERR(pdma->clk))
> +               clk_disable_unprepare(pdma->clk);
>
>         return 0;
>  }
>
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
> +       {"APMC0D43", 0},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
> +#endif
> +
>  static const struct of_device_id xgene_dma_of_match_ptr[] = {
>         {.compatible = "apm,xgene-storm-dma",},
>         {},
> @@ -2039,6 +2052,7 @@ static struct platform_driver xgene_dma_driver = {
>         .driver = {
>                 .name = "X-Gene-DMA",
>                 .of_match_table = xgene_dma_of_match_ptr,
> +               .acpi_match_table = ACPI_PTR(xgene_dma_acpi_match_ptr),
>         },
>  };
>
> --
> 1.8.2.1


Any Comments on the above patch ??
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
