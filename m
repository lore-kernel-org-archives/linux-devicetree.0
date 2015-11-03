From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Tue, 3 Nov 2015 16:07:34 -0500
Message-ID: <56392216.8050305@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <17979873.Bg2pv5SLy6@wuerfel> <56384623.80305@codeaurora.org>
 <4135705.fKCjnZtDgZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4135705.fKCjnZtDgZ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/3/2015 5:43 AM, Arnd Bergmann wrote:
> Ok, got it.
>
> Best add an explanation like the above in the interrupt handler,
> to prevent this from accidentally getting 'cleaned up' to use
> readl(), or copied into a driver that uses PCI ordering rules
> where it is actually wrong.
>

I'm adding this disclaimer into the ISR routine.

	/*
	 * Fine tuned for this HW...
	 *
	 * This ISR has been designed for this particular hardware. Relaxed read
	 * and write accessors are used for performance reasons due to interrupt
	 * delivery guarantees. Do not copy this code blindly and expect
	 * that to work.
	 */


> I think it should be done like this:
>
> - anything that is not performance critical, use normal readl/writel
> - in the fast path, add a comment to each readl_relaxed()/writel_relaxed()
>    that is safe in this driver but that would not be safe in a PCI
>    device
> - For the ones that would be safe on PCI as weel, use
>    readl_relaxed()/writel_relaxed() without a comment on each one,
>    but clarify somewhere that these are all intentional.

Makes sense.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
