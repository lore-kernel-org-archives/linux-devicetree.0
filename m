From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] mtd: fsmc_nand: fix error return code in fsmc_nand_probe()
Date: Mon, 13 May 2013 13:28:39 +0530
Message-ID: <CAKohponMh0-L-LAYE7Rf3frULQ3WEwJCi+Hfe9qtE+zEWtncrQ@mail.gmail.com>
References: <CAPgLHd_ETnhT-YQgyPKJJ5meTF_mibYipShRO2GPGMhpdGOuyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd_ETnhT-YQgyPKJJ5meTF_mibYipShRO2GPGMhpdGOuyw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, artem.bityutskiy@linux.intel.com, linus.walleij@linaro.org, vipin.kumar@st.com, yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13 May 2013 12:25, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return -ENODEV in the dma channel request error handling
> case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/mtd/nand/fsmc_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 911e243..6988fc8 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -1032,6 +1032,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>         case USE_DMA_ACCESS:
>                 dma_cap_zero(mask);
>                 dma_cap_set(DMA_MEMCPY, mask);
> +               ret = -ENODEV;
>                 host->read_dma_chan = dma_request_channel(mask, filter,
>                                 pdata->read_dma_priv);
>                 if (!host->read_dma_chan) {
>

Better do it for error cases only.. like:

>                 if (!host->read_dma_chan) {
                           ret = -ENODEV;
