From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V2 2/3] vfio, platform: make reset driver a requirement
Date: Wed, 16 Mar 2016 10:27:24 -0400
Message-ID: <56E96D4C.3080008@codeaurora.org>
References: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
 <1457715275-11925-3-git-send-email-okaya@codeaurora.org>
 <56E5A271.6000408@codeaurora.org> <56E8E2CD.3020604@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E8E2CD.3020604-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Baptiste,

>> I couldn't see a reset function for AMBA devices.
>>
>> Is there anyway to write reset function for it? I have no experience with 
>> AMBA devices.
> To my knowledge only the PL330 DMA controller (drivers/dma/pl330.c) was
> passthrough'ed at some point, rather for development purpose than
> production purpose. This was done by Virtual Open Systems (ask Baptiste
> for more details). But I don't think this is really used.

Are you OK with requiring reset driver for AMBA devices too? The PL330 
driver won't work until a reset driver is submitted for it.

>>
>> Would you include a reset needed flag and just not require it for AMBA? 
>> (I honestly don't like this idea)
>>
> I think the requirement also makes sense for AMBA.
> 
> Maybe an option would be to add a module parameter that would allow to
> use the vfio platform/amba driver without reset module (with explicit
> opt-in from the user). Maybe this can be done later on.

I can see this flag useful for testing purposes but it should not be used in 
production.

How about I add a module parameter which is not set by default? When set,
I don't perform the reset requirement check.

> 
> FYI I will not have access to my mailbox until the end of the week.

OK, no rush.

> 
> Best Regards
> 
> Eric
> 


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
