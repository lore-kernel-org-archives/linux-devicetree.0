From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v7 2/2] dmaengine: add Qualcomm BAM dma driver
Date: Wed, 26 Feb 2014 11:06:56 -0600
Message-ID: <20140226170656.GA21772@qualcomm.com>
References: <1393283500-18599-1-git-send-email-agross@codeaurora.org>
 <1393283500-18599-3-git-send-email-agross@codeaurora.org>
 <530E1BAB.6040609@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <530E1BAB.6040609@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 26, 2014 at 06:51:55PM +0200, Stanimir Varbanov wrote:
> > +	/* read revision and configuration information */
> > +	val = readl_relaxed(bdev->regs + BAM_REVISION) & NUM_EES_MASK;
> > +
> 
> The ees shit is not zero and you got wrong ee. Could you add the line
> below or something similar:
> 
> val = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
> 

Good catch.  I missed the shift when I reworked and got lucky that the revision
is in the lower 8 bits and is non-zero.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
