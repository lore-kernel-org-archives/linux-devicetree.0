From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] dmaengine: qcom_bam_dma: clear BAM interrupt only if it is rised
Date: Tue, 01 Dec 2015 11:29:41 +0100
Message-ID: <6461444.oollnBsbrb@wuerfel>
References: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org> <1448961299-15161-3-git-send-email-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448961299-15161-3-git-send-email-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 01 December 2015 11:14:57 Stanimir Varbanov wrote:
> +       if (srcs & BAM_IRQ) {
>                 clr_mask = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_STTS));
>  
> -       /* don't allow reorder of the various accesses to the BAM registers */
> -       mb();
> +               /*
> +                * don't allow reorder of the various accesses to the BAM
> +                * registers
> +                */
> +               mb();
>  
> -       writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
> +               writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
> +       }
> 

I think the comment here should be moved: change the writel_relaxed()
to writel(), which already includes the appropriate barriers, and
add a comment at the readl_relaxed() to explain why it doesn't need
a barrier.

	Arnd
