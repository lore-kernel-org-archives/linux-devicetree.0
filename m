From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH 1/2] dmaengine: qcom_bam_dma: Add v1.3.0 driver support
Date: Fri, 18 Apr 2014 14:41:01 -0500
Message-ID: <20140418194101.GA12607@qualcomm.com>
References: <1397684719-30065-1-git-send-email-agross@codeaurora.org>
 <1397684719-30065-2-git-send-email-agross@codeaurora.org>
 <53505D3F.9000108@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53505D3F.9000108@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Vabanov <svarbanov@mm-sol.com>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 18, 2014 at 02:01:19AM +0300, Stanimir Vabanov wrote:

<snip>

> >  
> >  static const struct of_device_id bam_of_match[] = {
> > +	{ .compatible = "qcom,bam-v1.3.0", },
> >  	{ .compatible = "qcom,bam-v1.4.0", },
> 
> you could use the of_device_id::data field to switch between different
> versions.
> 
> I mean this:
> 
> static const struct of_device_id bam_of_match[] = {
> 	{ .compatible = "qcom,bam-v1.3.0", .data = &reg_offs_v1_3 },
>   	{ .compatible = "qcom,bam-v1.4.0", .data = &reg_offs_v1_4 },
> }
> 
> and during .probe you will get the correct offsets per version. It then
> could be assigned to a variable in bdev.
> 
> Then the defines could be:
> 
> #define BAM_CTRL(bdev)	(bdev->reg_offs->ctrl_offs + 0x00)
> 
> I'm not sure how many additional code this will be but it looks clearer.


That's not a bad idea.  I'll try this out and see how it looks.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
