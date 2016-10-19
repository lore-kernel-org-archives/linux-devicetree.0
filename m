From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5 00/10] dmaengine: qcom_hidma: add MSI interrupt support
Date: Wed, 19 Oct 2016 08:36:24 -0700
Message-ID: <ec05315c-a527-f107-6cf3-ac71803d0a57@codeaurora.org>
References: <1475817915-11976-1-git-send-email-okaya@codeaurora.org>
 <20161019133406.GO2467@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161019133406.GO2467@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/19/2016 6:34 AM, Vinod Koul wrote:
> On Fri, Oct 07, 2016 at 01:25:05AM -0400, Sinan Kaya wrote:
>> The new version of the HW supports MSI interrupts instead of wired
>> interrupts. The MSI interrupts are especially useful for the guest machine
>> execution. The wired interrupts usually trap to the hypervisor and then are
>> relayed to the actual interrupt.
>>
>> The MSI interrupts can be directly fed into the interrupt controller.
>>
>> Adding a new OF compat string (qcom,hidma-1.1) and ACPI string (QCOM8062)
>> to distinguish newer HW from the older ones.
> 
> I was only able to apply 6 patches in this series. Which tree were these
> generated against?
> 
> Please rebase rest..
> 

Sure, let me do that. The other two patches (sysfs and debugfs) probably broke
the git merge.

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
