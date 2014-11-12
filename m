From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dmaengine: qcom_bam_dma: Generalize BAM
 register offset calculations
Date: Wed, 12 Nov 2014 16:10:33 +0530
Message-ID: <20141112104033.GF24582@intel.com>
References: <1411037575-13153-1-git-send-email-architt@codeaurora.org>
 <1411965189-24499-1-git-send-email-architt@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411965189-24499-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 10:03:07AM +0530, Archit Taneja wrote:
> The BAM DMA IP comes in different versions. The register offset layout varies
> among these versions. The layouts depend on which generation/family of SoCs they
> belong to.
> 
> The current SoCs(like 8084, 8074) have a layout where the Top level registers
> come in the beginning of the address range, followed by pipe and event
> registers. The BAM revision numbers fall above 1.4.0.
> 
> The older SoCs (like 8064, 8960) have a layout where the pipe registers come
> first, and the top level come later. These have BAM revision numbers lesser than
> 1.4.0.
> 
> It isn't suitable to have macros provide the register offsets with the layouts
> changed. Future BAM revisions may have different register layouts too. The
> register addresses are now calculated by referring a table which contains a base
> offset and multipliers for pipe/evnt/ee registers.
> 
> We have a common function bam_addr() which computes addresses for all the
> registers. When computing address of top level/ee registers, we pass 0 to the
> pipe argument in addr() since they don't have any multiple instances.
> 
> Some of the unused register definitions are removed. We can add new registers as
> we need them.

Applied alll three, thanks

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
