From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [Patch v6 2/2] dmaengine: Add ADM driver
Date: Wed, 1 Apr 2015 09:02:30 +0530
Message-ID: <20150401033230.GS7192@intel.com>
References: <1426571172-9711-1-git-send-email-agross@codeaurora.org>
 <1426571172-9711-3-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426571172-9711-3-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 12:46:12AM -0500, Andy Gross wrote:

> +static enum dma_status adm_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
> +	struct dma_tx_state *txstate)
> +{
> +	struct adm_chan *achan = to_adm_chan(chan);
> +	struct virt_dma_desc *vd;
> +	enum dma_status ret;
> +	unsigned long flags;
> +	size_t residue = 0;
> +
> +	ret = dma_cookie_status(chan, cookie, txstate);
> +	if (ret == DMA_COMPLETE || !txstate)
> +		return ret;
> +
> +	spin_lock_irqsave(&achan->vc.lock, flags);
> +
> +	vd = vchan_find_desc(&achan->vc, cookie);
> +	if (vd)
> +		residue = container_of(vd, struct adm_async_desc, vd)->length;
> +
> +	spin_unlock_irqrestore(&achan->vc.lock, flags);
> +
> +	/*
> +	 * residue is either the full length if it is in the issued list, or 0
> +	 * if it is in progress.  We have no reliable way of determining
> +	 * anything inbetween
> +	*/
> +	dma_set_residue(txstate, residue);
> +
> +	if (achan->error)
> +		return DMA_ERROR;
but this may not be for the current descriptor right, which is queued?

-- 
~Vinod
