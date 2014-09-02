From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3] hwspinlock: qcom: Add support for Qualcomm HW Mutex
 block
Date: Tue, 02 Sep 2014 17:24:54 -0600
Message-ID: <540651C6.1000000@codeaurora.org>
References: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1409688246-16530-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Eric Holmberg <eholmber@codeaurora.org>, Courtney Cavin <courtney.cavin@sonymobile.com>
List-Id: devicetree@vger.kernel.org

On 9/2/2014 2:04 PM, Bjorn Andersson wrote:
> From: Kumar Gala <galak@codeaurora.org>
>
> Add driver for Qualcomm Hardware Mutex block that exists on newer
> Qualcomm SoCs.
>
> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
> Cc: Eric Holmberg <eholmber@codeaurora.org>
> Cc: Courtney Cavin <courtney.cavin@sonymobile.com>
> Signed-off-by: Kumar Gala <galak@codeaurora.org>
> [bjorn: added pm_runtime calls, from Courtney,
> 	added sfpb-mutex compatible,
> 	updated DT binding documentation formatting,
> 	based stride on resource size instead of hardcoded values,
> 	replaced msm prefix with qcom,
> 	cleaned up includes]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
<snip>

For what its worth, this looks good to me.

Jeffrey Hugo
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation.
