From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 2/3] vfio, platform: make reset driver a requirement
Date: Sun, 13 Mar 2016 13:25:05 -0400
Message-ID: <56E5A271.6000408@codeaurora.org>
References: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
 <1457715275-11925-3-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <1457715275-11925-3-git-send-email-okaya@codeaurora.org>
Sender: kvm-owner@vger.kernel.org
To: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/11/2016 11:54 AM, Sinan Kaya wrote:
> The code was allowing platform devices to be used without a supporting VFIO
> reset driver. The hardware can be left in some inconsistent state after a
> guest machine abort.
> 
> The reset driver will put the hardware back to safe state and disable
> interrupts before returning the control back to the host machine.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  drivers/vfio/platform/vfio_platform_common.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
I was looking at the code. It looks like this is going to break VFIO AMBA. The
common implementation is shared with AMBA and platform devices.

I couldn't see a reset function for AMBA devices.

Is there anyway to write reset function for it? I have no experience with 
AMBA devices.

Would you include a reset needed flag and just not require it for AMBA? 
(I honestly don't like this idea)

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
