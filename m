From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V13 08/10] dma: qcom_hidma: read the channel id from HW
Date: Wed, 3 Feb 2016 18:36:50 +0000
Message-ID: <20160203183650.GI1234@leverpostej>
References: <1454106914-15857-1-git-send-email-okaya@codeaurora.org>
 <1454106914-15857-9-git-send-email-okaya@codeaurora.org>
 <20160201153542.GA20396@leverpostej>
 <56B247A1.20503@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56B247A1.20503@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 03, 2016 at 01:32:01PM -0500, Sinan Kaya wrote:
> Hi Mark,
> 
> On 2/1/2016 10:35 AM, Mark Rutland wrote:
> >> Removing the flexibility to choose the event channel as there is no real
> >> > use case right now. We have been using the values in ACPI that match the HW
> >> > defaults. OS is reading the event-channel from the HW register now.
> > Fold this in to the patches adding the binding and the driver.
> > 
> > There is no reason to add this then remove it within the same series.
> > 
> > Mark.
> > 
> 
> Before I post the next rev, I'd like to see if I missed something in the series when 
> it comes to your comments. 
> 
> Can you please take a look and let me know?

Sorry, but it's going to be far easier to review with useless code
removed, so I will wait until the next posting where this patch is
folded in.

Thanks,
Mark.
