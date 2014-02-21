From: Andy Gross <agross@codeaurora.org>
Subject: Re: [Patch v6 1/2] dmaengine: qcom_bam_dma: Add device tree binding
Date: Fri, 21 Feb 2014 13:02:06 -0600
Message-ID: <20140221190206.GC3102@qualcomm.com>
References: <1392964986-5207-1-git-send-email-agross@codeaurora.org>
 <1392964986-5207-2-git-send-email-agross@codeaurora.org>
 <20140221092657.GD7541@e106331-lin.cambridge.arm.com>
 <20140221163053.GA3102@qualcomm.com>
 <20140221173647.GC28555@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140221173647.GC28555@e106331-lin.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 21, 2014 at 05:36:47PM +0000, Mark Rutland wrote:
[snip]
> > 
> > Yes only a single interrupt.  I can remove the s.
> 
> Please don't, the interrupts proeprty is standard and shouldn't change.
> 
> I was only asking to ensure that all interrupts were described in the
> binding, which they are. :)
> 

Responding to emails before coffee is bad.....

-- 
sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
