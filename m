From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 2/6] dmaengine: sun6i: Add a quirk for additional mbus clock
Date: Mon, 11 Mar 2019 13:47:43 +0800
Message-ID: <CAGb2v65GNtmDdmnixfdFg6Lt4Rzq_MrUf==fiV=wtgk+uR6WzA@mail.gmail.com>
References: <20190307165829.9086-1-jernej.skrabec@siol.net> <20190307165829.9086-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307165829.9086-3-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, vkoul@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 8, 2019 at 12:58 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> H6 DMA controller needs additional mbus clock to be enabled.
>
> Add a quirk for it and handle it accordingly.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/dma/sun6i-dma.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 0cd13f17fc11..761555080325 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -129,6 +129,7 @@ struct sun6i_dma_config {
>         u32 dst_burst_lengths;
>         u32 src_addr_widths;
>         u32 dst_addr_widths;
> +       bool mbus_clk;

Nit: has_mbus_clk. Be explicit. Leave nothing to assumptions.

>  };
>
>  /*
> @@ -182,6 +183,7 @@ struct sun6i_dma_dev {
>         struct dma_device       slave;
>         void __iomem            *base;
>         struct clk              *clk;
> +       struct clk              *clk_mbus;
>         int                     irq;
>         spinlock_t              lock;
>         struct reset_control    *rstc;
> @@ -1208,6 +1210,14 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>                 return PTR_ERR(sdc->clk);
>         }
>
> +       if (sdc->cfg->mbus_clk) {
> +               sdc->clk_mbus = devm_clk_get(&pdev->dev, "mbus");
> +               if (IS_ERR(sdc->clk_mbus)) {
> +                       dev_err(&pdev->dev, "No mbus clock specified\n");
> +                       return PTR_ERR(sdc->clk_mbus);
> +               }
> +       }
> +
>         sdc->rstc = devm_reset_control_get(&pdev->dev, NULL);
>         if (IS_ERR(sdc->rstc)) {
>                 dev_err(&pdev->dev, "No reset controller specified\n");
> @@ -1312,11 +1322,19 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>                 goto err_reset_assert;
>         }
>
> +       if (sdc->cfg->mbus_clk) {
> +               ret = clk_prepare_enable(sdc->clk_mbus);

The clk API checks for NULL pointer, so you could just drop the
conditional here.

> +               if (ret) {
> +                       dev_err(&pdev->dev, "Couldn't enable mbus clock\n");
> +                       goto err_clk_disable;
> +               }
> +       }
> +
>         ret = devm_request_irq(&pdev->dev, sdc->irq, sun6i_dma_interrupt, 0,
>                                dev_name(&pdev->dev), sdc);
>         if (ret) {
>                 dev_err(&pdev->dev, "Cannot request IRQ\n");
> -               goto err_clk_disable;
> +               goto err_mbus_clk_disable;
>         }
>
>         ret = dma_async_device_register(&sdc->slave);
> @@ -1341,6 +1359,8 @@ static int sun6i_dma_probe(struct platform_device *pdev)
>         dma_async_device_unregister(&sdc->slave);
>  err_irq_disable:
>         sun6i_kill_tasklet(sdc);
> +err_mbus_clk_disable:
> +       clk_disable_unprepare(sdc->clk_mbus);

Since you aren't using it here either.

ChenYu


>  err_clk_disable:
>         clk_disable_unprepare(sdc->clk);
>  err_reset_assert:
> @@ -1359,6 +1379,7 @@ static int sun6i_dma_remove(struct platform_device *pdev)
>
>         sun6i_kill_tasklet(sdc);
>
> +       clk_disable_unprepare(sdc->clk_mbus);
>         clk_disable_unprepare(sdc->clk);
>         reset_control_assert(sdc->rstc);
>
> --
> 2.21.0
>
