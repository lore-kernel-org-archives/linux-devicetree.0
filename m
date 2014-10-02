From: Andy Gross <agross@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dmaengine: qcom_bam_dma: Generalize BAM register
 offset calculations
Date: Thu, 2 Oct 2014 00:24:26 -0500
Message-ID: <20141002052426.GB28494@qualcomm.com>
References: <1411037575-13153-1-git-send-email-architt@codeaurora.org>
 <1411965189-24499-1-git-send-email-architt@codeaurora.org>
 <20140929221406.GE11142@qualcomm.com>
 <542BB9C7.2000600@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <542BB9C7.2000600@smartplayin.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Archit Taneja <architt@codeaurora.org>, vinod.koul@intel.com, galak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 01, 2014 at 01:52:31PM +0530, Pramod Gurav wrote:
> Andy,
> With your change "dmaengine: qcom_bam_dma: Add v1.3.0 driver support"
> and enabling qcom_bam_dma driver i was seeing some crashes in the kernel
> on IFC6410. But after reverting you change and applying these changes
> from Vinod I see IFC6410 booting fine.

We're dropping my changes in favor of these.  So please do revert my change and
pull in this.

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
