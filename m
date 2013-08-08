Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:36663 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757642Ab3HHH6e (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 03:58:34 -0400
Received: by mail-oa0-f54.google.com with SMTP id o6so4948737oag.27
        for <devicetree@vger.kernel.org>; Thu, 08 Aug 2013 00:58:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375878679-18098-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1375878679-18098-2-git-send-email-ezequiel.garcia@free-electrons.com>
Date: Thu, 8 Aug 2013 00:58:34 -0700
Message-ID: <CAN8TOE_ZjikTe-+vPrM8HKmJAu_HuiDBhoh8TTJGXKsrTo+Odw@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand'
 compatible string
From: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Lior Amsalem <alior@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Daniel Mack <zonque@gmail.com>, Willy Tarreau <w@1wt.eu>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

+ devicetree list

On Wed, Aug 7, 2013 at 5:31 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> This driver supports NFCv1 (as found in PXA SoC) and NFCv2 (as found in
> Armada 370/XP SoC). As both controller has a few differences, a way of
> distinguishing between the two is needed.
>
> This commit introduces a new compatible string 'marvell,armada370-nand'
> and assigns a compatible data of type enum pxa3xx_nand_variant to allow
> such distinction.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 501e380..2582e1f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -123,6 +123,11 @@ enum {
>         STATE_READY,
>  };
>
> +enum pxa3xx_nand_variant {
> +       PXA3XX_NAND_VARIANT_PXA,
> +       PXA3XX_NAND_VARIANT_ARMADA370,
> +};
> +
>  struct pxa3xx_nand_host {
>         struct nand_chip        chip;
>         struct pxa3xx_nand_cmdset *cmdset;
> @@ -171,6 +176,12 @@ struct pxa3xx_nand_info {
>         struct pxa3xx_nand_host *host[NUM_CHIP_SELECT];
>         unsigned int            state;
>
> +       /*
> +        * This driver supports NFCv1 (as found in PXA SoC)
> +        * and NFCv2 (as found in Armada 370/XP SoC).
> +        */
> +       enum pxa3xx_nand_variant variant;
> +
>         int                     cs;
>         int                     use_ecc;        /* use HW ECC ? */
>         int                     use_dma;        /* use DMA ? */
> @@ -1192,7 +1203,14 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
>
>  #ifdef CONFIG_OF
>  static struct of_device_id pxa3xx_nand_dt_ids[] = {
> -       { .compatible = "marvell,pxa3xx-nand" },
> +       {
> +               .compatible = "marvell,pxa3xx-nand",
> +               .data       = (void *) PXA3XX_NAND_VARIANT_PXA,
> +       },
> +       {
> +               .compatible = "marvell,armada370-nand",
> +               .data       = (void *) PXA3XX_NAND_VARIANT_ARMADA370,
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
> @@ -1221,11 +1239,28 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>
>         return 0;
>  }
> +
> +static enum pxa3xx_nand_variant
> +pxa3xx_nand_get_variant(struct platform_device *pdev)
> +{
> +       const struct of_device_id *of_id =
> +                       of_match_device(pxa3xx_nand_dt_ids, &pdev->dev);
> +       if (!of_id)
> +               return PXA3XX_NAND_VARIANT_PXA;
> +       return (enum pxa3xx_nand_variant) of_id->data;
> +}
>  #else
>  static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
>  {
>         return 0;
>  }
> +
> +static enum pxa3xx_nand_variant
> +pxa3xx_nand_get_variant(struct platform_device *pdev)
> +{
> +       /* Default lefacy (non-DT) variant */
> +       return PXA3XX_NAND_VARIANT_PXA;
> +}
>  #endif
>
>  static int pxa3xx_nand_probe(struct platform_device *pdev)
> @@ -1252,6 +1287,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
>         }
>
>         info = platform_get_drvdata(pdev);
> +       info->variant = pxa3xx_nand_get_variant(pdev);
>         probe_success = 0;
>         for (cs = 0; cs < pdata->num_cs; cs++) {
>                 info->cs = cs;
> --
> 1.8.1.5
>
