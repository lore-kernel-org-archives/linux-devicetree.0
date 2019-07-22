From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ath10k: Move regulator config to driver private data
Date: Mon, 22 Jul 2019 16:57:35 -0700
Message-ID: <20190722235735.GA5828@builder>
References: <20190703035711.25592-1-govinds@codeaurora.org>
 <20190703035711.25592-3-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190703035711.25592-3-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 02 Jul 20:57 PDT 2019, Govind Singh wrote:

> WCN3990 Regulator config is varying b/w different MSM platforms.
> In order to have scalable config, move regulator config to driver
> private data.
> 

Regulators supplying clients with fixed voltage requirements should be
specified in the board devicetree with these required voltage values,
rather than in the driver.  So the appropriate solution is not to add
and adjust these values but rather to drop this code from the driver.

I was about to send a patch that does this, because I have an SDM845
device where the voltage constraints specified on board level does not
meet the ranges specified here in the driver.

Regards,
Bjorn

> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 38 +++++++++++++++++++++-----
>  drivers/net/wireless/ath/ath10k/snoc.h | 23 +++++++++-------
>  2 files changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index ca1186ec4129..bd7d97924fe0 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -36,13 +36,20 @@ static char *const ce_name[] = {
>  	"WLAN_CE_11",
>  };
>  
> -static struct ath10k_vreg_info vreg_cfg[] = {
> +static struct ath10k_vreg_info sdm845_reg_cfg[] = {
>  	{NULL, "vdd-0.8-cx-mx", 800000, 850000, 0, 0, false},
>  	{NULL, "vdd-1.8-xo", 1800000, 1850000, 0, 0, false},
>  	{NULL, "vdd-1.3-rfa", 1300000, 1350000, 0, 0, false},
>  	{NULL, "vdd-3.3-ch0", 3300000, 3350000, 0, 0, false},
>  };
>  
> +static struct ath10k_vreg_info qcs40x_reg_cfg[] = {
> +	{NULL, "vdd-0.8-cx-mx", 1224000, 1224000, 0, 0, false},
> +	{NULL, "vdd-1.8-xo", 1800000, 1850000, 0, 0, false},
> +	{NULL, "vdd-1.3-rfa", 1300000, 1350000, 0, 0, false},
> +	{NULL, "vdd-3.3-ch0", 3300000, 3350000, 0, 0, false},
> +};
> +
>  static struct ath10k_clk_info clk_cfg[] = {
>  	{NULL, "cxo_ref_clk_pin", 0, false},
>  };
> @@ -54,10 +61,20 @@ static void ath10k_snoc_htt_rx_cb(struct ath10k_ce_pipe *ce_state);
>  static void ath10k_snoc_htt_htc_rx_cb(struct ath10k_ce_pipe *ce_state);
>  static void ath10k_snoc_pktlog_rx_cb(struct ath10k_ce_pipe *ce_state);
>  
> -static const struct ath10k_snoc_drv_priv drv_priv = {
> +static const struct ath10k_snoc_drv_priv sdm845_wcn39xx_drv_priv = {
> +	.hw_rev = ATH10K_HW_WCN3990,
> +	.dma_mask = DMA_BIT_MASK(35),
> +	.msa_size = 0x100000,
> +	.vreg_cfg = sdm845_reg_cfg,
> +	.vreg_count = ARRAY_SIZE(sdm845_reg_cfg),
> +};
> +
> +static const struct ath10k_snoc_drv_priv qcs40x_wcn39xx_drv_priv = {
>  	.hw_rev = ATH10K_HW_WCN3990,
>  	.dma_mask = DMA_BIT_MASK(35),
>  	.msa_size = 0x100000,
> +	.vreg_cfg = qcs40x_reg_cfg,
> +	.vreg_count =  ARRAY_SIZE(qcs40x_reg_cfg),
>  };
>  
>  #define WCN3990_SRC_WR_IDX_OFFSET 0x3C
> @@ -1465,7 +1482,7 @@ static int ath10k_snoc_vreg_on(struct ath10k *ar)
>  	int ret = 0;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(vreg_cfg); i++) {
> +	for (i = 0; i < ar_snoc->vreg_count; i++) {
>  		vreg_info = &ar_snoc->vreg[i];
>  
>  		if (!vreg_info->reg)
> @@ -1498,7 +1515,7 @@ static int ath10k_snoc_vreg_off(struct ath10k *ar)
>  	int ret = 0;
>  	int i;
>  
> -	for (i = ARRAY_SIZE(vreg_cfg) - 1; i >= 0; i--) {
> +	for (i = ar_snoc->vreg_count - 1; i >= 0; i--) {
>  		vreg_info = &ar_snoc->vreg[i];
>  
>  		if (!vreg_info->reg)
> @@ -1616,7 +1633,13 @@ static int ath10k_hw_power_off(struct ath10k *ar)
>  
>  static const struct of_device_id ath10k_snoc_dt_match[] = {
>  	{ .compatible = "qcom,wcn3990-wifi",
> -	 .data = &drv_priv,
> +	 .data = &sdm845_wcn39xx_drv_priv,
> +	},
> +	{ .compatible = "qcom,sdm845-wcn39xx-wifi",
> +	 .data = &sdm845_wcn39xx_drv_priv,
> +	},
> +	{ .compatible = "qcom,qcs40x-wcn39xx-wifi",
> +	 .data = &qcs40x_wcn39xx_drv_priv,
>  	},
>  	{ }
>  };
> @@ -1680,8 +1703,9 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
>  		goto err_release_resource;
>  	}
>  
> -	ar_snoc->vreg = vreg_cfg;
> -	for (i = 0; i < ARRAY_SIZE(vreg_cfg); i++) {
> +	ar_snoc->vreg = drv_data->vreg_cfg;
> +	ar_snoc->vreg_count = drv_data->vreg_count;
> +	for (i = 0; i < ar_snoc->vreg_count; i++) {
>  		ret = ath10k_get_vreg_info(ar, dev, &ar_snoc->vreg[i]);
>  		if (ret)
>  			goto err_free_irq;
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
> index d62f53501fbb..0bdada11985c 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.h
> +++ b/drivers/net/wireless/ath/ath10k/snoc.h
> @@ -10,10 +10,22 @@
>  #include "ce.h"
>  #include "qmi.h"
>  
> +struct ath10k_vreg_info {
> +	struct regulator *reg;
> +	const char *name;
> +	u32 min_v;
> +	u32 max_v;
> +	u32 load_ua;
> +	unsigned long settle_delay;
> +	bool required;
> +};
> +
>  struct ath10k_snoc_drv_priv {
>  	enum ath10k_hw_rev hw_rev;
>  	u64 dma_mask;
>  	u32 msa_size;
> +	struct ath10k_vreg_info *vreg_cfg;
> +	u8 vreg_count;
>  };
>  
>  struct snoc_state {
> @@ -42,16 +54,6 @@ struct ath10k_snoc_ce_irq {
>  	u32 irq_line;
>  };
>  
> -struct ath10k_vreg_info {
> -	struct regulator *reg;
> -	const char *name;
> -	u32 min_v;
> -	u32 max_v;
> -	u32 load_ua;
> -	unsigned long settle_delay;
> -	bool required;
> -};
> -
>  struct ath10k_clk_info {
>  	struct clk *handle;
>  	const char *name;
> @@ -77,6 +79,7 @@ struct ath10k_snoc {
>  	struct ath10k_ce ce;
>  	struct timer_list rx_post_retry;
>  	struct ath10k_vreg_info *vreg;
> +	u8 vreg_count;
>  	struct ath10k_clk_info *clk;
>  	struct ath10k_qmi *qmi;
>  	unsigned long flags;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
