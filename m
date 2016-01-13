From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V9 2/5] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Wed, 13 Jan 2016 12:59:24 -0500
Message-ID: <5696907C.6000809@codeaurora.org>
References: <1449850623-32214-1-git-send-email-okaya@codeaurora.org>
 <1449850623-32214-3-git-send-email-okaya@codeaurora.org>
 <20151211164137.GA23638@leverpostej> <566B1F64.9010500@codeaurora.org>
 <20151211193742.GD23638@leverpostej> <566B4ACC.3070005@codeaurora.org>
 <20151214120339.GA21356@leverpostej> <569265D6.5060407@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569265D6.5060407-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orgvinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark, Rob, Frank, Grant and other DT experts;

>>>
>>> I'll add support for both. Both having a parent-child relationship while
>>> inside the hypervisor and flat hierarchy while running in the guest
>>> machine for QEMU.
>>
>> I'm happy with that.
>>
>>> I just created a child object of the management driver and channel
>>> driver got probed properly. So, it just a matter of device-tree
>>> documentation at this point.
>>>
>>> It will be like this though.
>>>
>>>>>> hidma {
>>>>>> 	compatible - "qcom,hidma-1.0";
>>>>>>
>>>>>> 	/* OPTIONAL management interface registers */
>>>>>> 	reg = < ... ... >;
>>>>>>
>>>>>> 	...
>>>>>>
>>>>>> 	channel0 {
>>>>>> 		compatible = "qcom,
>>>>>> 		reg = < ... ... >;
>>>>>>
>>>>>> 		...
>>>>>> 	};
>>>>>>
>>>>>> 	...
>>>>>> };
>>>
>>> This seems to have worked without requiring any work from me.
>>>
>>> I need to associate sysfs next.
>>
>> Ok. I look forward to seeing those patches.
>>
>> Thanks,
>> Mark.
>>
> 
> Mark,
> The patch has been posted here. Please review.
> 
> https://lkml.org/lkml/2016/1/3/246
> 
> Sinan
> 
> 
> 
> 

I have been trying to reach to device tree reviewers without any luck for the last two weeks. 
It must be the holidays. 

I have restructured the code address concerns from Mark Rutland above. The dma-engine maintainer, Vinod Koul;
is looking for an ACK from the DT community before the patches can be incorporated.

Could you please kindly review the series here from DT perspective and ACK it if you are OK?
https://lkml.org/lkml/2016/1/11/517

This document here
https://www.kernel.org/doc/linux/MAINTAINERS

tells me that Rob Herring, Frank Rowand and Grant Likely are the maintainers for device tree.

OPEN FIRMWARE AND FLATTENED DEVICE TREE
M:	Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
M:	Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
M:	Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
L:	devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

That's why, I'm reaching out.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
