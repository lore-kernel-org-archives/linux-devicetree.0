From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v9 1/6] clk: hisilicon: export some hisilicon APIs to
 modules
Date: Thu, 25 Feb 2016 15:42:44 -0800
Message-ID: <20160225234244.GL28849@codeaurora.org>
References: <1456127280-23275-1-git-send-email-xuejiancheng@huawei.com>
 <1456127280-23275-2-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456127280-23275-2-git-send-email-xuejiancheng@huawei.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com, lidongpo@hisilicon.com
List-Id: devicetree@vger.kernel.org

On 02/22, Jiancheng Xue wrote:
> Change some arguments to constant type.
> Export some hisilicon APIs to modules.
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
>  drivers/clk/hisilicon/clk.c | 23 +++++++++++++++--------
>  drivers/clk/hisilicon/clk.h | 14 +++++++-------
>  2 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
> index 9f8e766..06ec3fe 100644
> --- a/drivers/clk/hisilicon/clk.c
> +++ b/drivers/clk/hisilicon/clk.c
> @@ -37,7 +37,7 @@
>  
>  static DEFINE_SPINLOCK(hisi_clk_lock);
>  
> -struct hisi_clock_data __init *hisi_clk_init(struct device_node *np,
> +struct hisi_clock_data *hisi_clk_init(struct device_node *np,
>  					     int nr_clks)
>  {
>  	struct hisi_clock_data *clk_data;
> @@ -71,8 +71,9 @@ err_data:
>  err:
>  	return NULL;
>  }
> +EXPORT_SYMBOL(hisi_clk_init);

Why not EXPORT_SYMBOL_GPL?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
