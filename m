From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Tue, 3 Nov 2015 20:04:49 -0500
Message-ID: <563959B1.5020101@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <9016417.z9Hz6MbmvQ@wuerfel> <56383BDD.9090903@codeaurora.org>
 <4010471.Nu3L6CWPWG@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4010471.Nu3L6CWPWG@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/3/2015 7:42 AM, Arnd Bergmann wrote:
> You have a distinct "compatible" string for qemu, right? It sounds like
> this is not the same device if the dependencies are different, and
> you could just have two ways to probe the same device.
>
No, it is the same dma channel object that gets probed by the same name 
like the hypervisor. The channel object gets unbound from the 
hypervisor, it then gets bound to VFIO. Then, eventually QEMU takes 
over. The channel driver does not know under which OS it is running and 
it works in both environments as it is without any code changes at this 
moment.

> The split between the two drivers still feels a little awkward overall,
> it might be good to give it some more thought.

I see. I'd like to keep the management driver as independent as possible 
from the channel driver for security and functionality reasons. I need 
to keep the management addresses and functionality in the hypervisor only.

> > Would it work to describe the combination of the channel and management
> registers as a single device with a single driver, but the management
> parts being optional? That way, the management registers could be
> intergrated better into the dmaengine framework, to provide a consistent
> API to user space.

I can compile both management driver and channel driver into the same 
module if it sounds better. I can probe one with channel and another 
with the management name. I just need to be careful about not sharing 
any kind of data structure between them otherwise virtualization will break.

I consider the management driver a client of the DMA engine API at this 
moment.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
