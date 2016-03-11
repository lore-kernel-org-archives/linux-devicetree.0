From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V2 3/3] vfio, platform: add QTI HIDMA reset driver
Date: Fri, 11 Mar 2016 12:00:57 -0500
Message-ID: <56E2F9C9.4070208@codeaurora.org>
References: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
 <1457715275-11925-4-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1457715275-11925-4-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/11/2016 11:54 AM, Sinan Kaya wrote:
> VFIO_PLATFORM_MODULE_ALIAS("qcom,hidma-1.0");
> +VFIO_PLATFORM_MODULE_ALIAS("QCOM8061");

I forgot to rename these to MODULE_ALIAS_VFIO_PLATFORM_RESET.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
