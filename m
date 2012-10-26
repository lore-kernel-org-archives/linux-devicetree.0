From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v5 3/4] misc: sram: Add optional clock
Date: Fri, 26 Oct 2012 11:18:00 -0400
Message-ID: <CAP=VYLo6CRg9goGivS6h0avfP6cqQZzvsTEGQp=Ky3npmtxcDg@mail.gmail.com>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de> <1350570453-24546-4-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1350570453-24546-4-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On some platforms the SRAM needs a clock to be enabled explicitly.

Since this is a file that you've just created in the previous commit,
I don't see why this needs to exist as a standalone commit, vs just
being folded back into the previous commit?

P.
--

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/misc/sram.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index 7a363f2..0cc2e75 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -21,6 +21,8 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -29,6 +31,7 @@
>
>  struct sram_dev {
>         struct gen_pool *pool;
> +       struct clk *clk;
>  };
>
>  static int __devinit sram_probe(struct platform_device *pdev)
> @@ -53,6 +56,10 @@ static int __devinit sram_probe(struct platform_device *pdev)
>         if (!sram)
>                 return -ENOMEM;
>
> +       sram->clk = devm_clk_get(&pdev->dev, NULL);
> +       if (!IS_ERR(sram->clk))
> +               clk_prepare_enable(sram->clk);
> +
>         sram->pool = gen_pool_create(PAGE_SHIFT, -1);
>         if (!sram->pool)
>                 return -ENOMEM;
> @@ -80,6 +87,9 @@ static int __devexit sram_remove(struct platform_device *pdev)
>
>         gen_pool_destroy(sram->pool);
>
> +       if (!IS_ERR(sram->clk))
> +               clk_disable_unprepare(sram->clk);
> +
>         return 0;
>  }
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
