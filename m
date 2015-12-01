From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] dmaengine: qcom_bam_dma: use correct pipe FIFO size
Date: Tue, 01 Dec 2015 11:28:32 +0100
Message-ID: <1971752.Auss6gPApO@wuerfel>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org> <1448961299-15161-4-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1448961299-15161-4-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andy Gross <agross@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 01 December 2015 11:14:58 Stanimir Varbanov wrote:
> 
> diff --git a/drivers/dma/qcom_bam_dma.c b/drivers/dma/qcom_bam_dma.c
> index 0f06f3b7a72b..6d290de9ab2b 100644
> --- a/drivers/dma/qcom_bam_dma.c
> +++ b/drivers/dma/qcom_bam_dma.c
> @@ -458,7 +458,7 @@ static void bam_chan_init_hw(struct bam_chan *bchan,
>          */
>         writel_relaxed(ALIGN(bchan->fifo_phys, sizeof(struct bam_desc_hw)),
>                         bam_addr(bdev, bchan->id, BAM_P_DESC_FIFO_ADDR));
> -       writel_relaxed(BAM_DESC_FIFO_SIZE,
> +       writel_relaxed(BAM_MAX_DATA_SIZE,
>                         bam_addr(bdev, bchan->id, BAM_P_FIFO_SIZES));
>  
>         /* enable the per pipe interrupts, enable EOT, ERR, and INT irqs */

I'm looking at that now and fail to see why these have to use writel_relaxed().

Could you add a patch to use readl/writel by default?

	Arnd
