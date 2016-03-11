From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V14 5/9] dma: qcom_hidma: implement lower level hardware
 interface
Date: Fri, 11 Mar 2016 07:36:50 +0530
Message-ID: <20160311020650.GG11154@localhost>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <1454646882-24369-6-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454646882-24369-6-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 04, 2016 at 11:34:36PM -0500, Sinan Kaya wrote:

> +
> +#define EVRE_SIZE			16	/* each EVRE is 16 bytes */
> +
> +#define TRCA_CTRLSTS_OFFSET		0x000
> +#define TRCA_RING_LOW_OFFSET		0x008
> +#define TRCA_RING_HIGH_OFFSET		0x00C
> +#define TRCA_RING_LEN_OFFSET		0x010
> +#define TRCA_READ_PTR_OFFSET		0x018
> +#define TRCA_WRITE_PTR_OFFSET		0x020
> +#define TRCA_DOORBELL_OFFSET		0x400
> +
> +#define EVCA_CTRLSTS_OFFSET		0x000
> +#define EVCA_INTCTRL_OFFSET		0x004
> +#define EVCA_RING_LOW_OFFSET		0x008
> +#define EVCA_RING_HIGH_OFFSET		0x00C
> +#define EVCA_RING_LEN_OFFSET		0x010
> +#define EVCA_READ_PTR_OFFSET		0x018
> +#define EVCA_WRITE_PTR_OFFSET		0x020
> +#define EVCA_DOORBELL_OFFSET		0x400
> +
> +#define EVCA_IRQ_STAT_OFFSET		0x100
> +#define EVCA_IRQ_CLR_OFFSET		0x108
> +#define EVCA_IRQ_EN_OFFSET		0x110
> +
> +#define EVRE_CFG_IDX			0
> +#define EVRE_LEN_IDX			1
> +#define EVRE_DEST_LOW_IDX		2
> +#define EVRE_DEST_HI_IDX		3
> +
> +#define EVRE_ERRINFO_BIT_POS		24
> +#define EVRE_CODE_BIT_POS		28
> +
> +#define EVRE_ERRINFO_MASK		GENMASK(3, 0)
> +#define EVRE_CODE_MASK			GENMASK(3, 0)

These are rest here are not namespace properly...

> +static int hidma_ll_enable(struct hidma_lldev *lldev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	val = readl(lldev->evca + EVCA_CTRLSTS_OFFSET);
> +	val &= ~(CH_CONTROL_MASK << 16);
> +	val |= CH_ENABLE << 16;
> +	writel(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
> +
> +	ret = readl_poll_timeout(lldev->evca + EVCA_CTRLSTS_OFFSET, val,
> +				 (HIDMA_CH_STATE(val) == CH_ENABLED) ||
> +				 (HIDMA_CH_STATE(val) == CH_RUNNING), 1000,
> +				 10000);
> +	if (ret) {
> +		dev_err(lldev->dev, "event channel did not get enabled\n");
> +		return ret;
> +	}
> +
> +	val = readl(lldev->trca + TRCA_CTRLSTS_OFFSET);
> +	val &= ~(CH_CONTROL_MASK << 16);
> +	val |= CH_ENABLE << 16;
> +	writel(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
> +
> +	ret = readl_poll_timeout(lldev->trca + TRCA_CTRLSTS_OFFSET, val,
> +				 (HIDMA_CH_STATE(val) == CH_ENABLED) ||
> +				 (HIDMA_CH_STATE(val) == CH_RUNNING), 1000,
> +				 10000);

first arg for readl_poll_timeout is accessor fn to do read, which doesnt
seem to be here... so what did i miss?


> +void hidma_ll_queue_request(struct hidma_lldev *lldev, u32 tre_ch)
> +{
> +	struct hidma_tre *tre;
> +	unsigned long flags;
> +
> +	tre = &lldev->trepool[tre_ch];
> +
> +	/* copy the TRE into its location in the TRE ring */
> +	spin_lock_irqsave(&lldev->lock, flags);
> +	tre->tre_index = lldev->tre_write_offset / TRE_SIZE;
> +	lldev->pending_tre_list[tre->tre_index] = tre;
> +	memcpy(lldev->tre_ring + lldev->tre_write_offset, &tre->tre_local[0],
> +	       TRE_SIZE);
> +	lldev->tx_status_list[tre->idx].err_code = 0;
> +	lldev->tx_status_list[tre->idx].err_info = 0;
> +	tre->queued = 1;
> +	lldev->pending_tre_count++;
> +	lldev->tre_write_offset = (lldev->tre_write_offset + TRE_SIZE)
> +	    % lldev->tre_ring_size;

These and above one should be right justfied per coding style

-- 
~Vinod
