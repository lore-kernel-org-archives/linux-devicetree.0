From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V13 08/10] dma: qcom_hidma: read the channel id from HW
Date: Mon, 1 Feb 2016 10:46:58 -0500
Message-ID: <56AF7DF2.9020202@codeaurora.org>
References: <1454106914-15857-1-git-send-email-okaya@codeaurora.org>
 <1454106914-15857-9-git-send-email-okaya@codeaurora.org>
 <20160201153542.GA20396@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160201153542.GA20396@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: dmaengine@vger.kernel.org, marc.zyngier@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com, shankerd@codeaurora.org, vikrams@codeaurora.org, eric.auger@linaro.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/1/2016 10:35 AM, Mark Rutland wrote:
> Fold this in to the patches adding the binding and the driver.
> 
> There is no reason to add this then remove it within the same series.
> 
> Mark.

Will do. I was trying to keep changes to the minimum on the other patches to 
help the reviewers.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
