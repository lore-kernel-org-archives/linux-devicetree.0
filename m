From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V5 3/4] drm/bridge: Add driver for GE B850v3 LVDS/DP++
 Bridge
Date: Mon, 26 Sep 2016 15:58:04 +0530
Message-ID: <8a7a0b02-5b9f-4266-75a2-42f26fcbc352@codeaurora.org>
References: <3a56-57e8e300-3-10c8a340@87357206>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3a56-57e8e300-3-10c8a340@87357206>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 09/26/2016 02:28 PM, Peter Senna Tschudin wrote:
>  Hi Archit,
>
> On Monday, September 26, 2016 10:31 CEST, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
>> Hi Peter,
>>
>> On 09/26/2016 01:57 PM, Peter Senna Tschudin wrote:
>>> Patch 1/4 is already on linux-next, but what about this one? Ping?
>
>>
>> I'd posted some queries a couple of times which you didn't answer to.
>> Could you please respond to them before we try to get this merged?
>
> Your queries were already answered by similar questions. The commit messages and cover letter also addresses the design decisions of the code. But basically the driver usefulness to other scenarios is severely limited by the firmware used by both chips. And when using the firmware that goes with this specific hardware, then yes, the two chips are always expected to work together. But the main point is that with the custom firmware each chip do not behave as independent bridges anymore.

Thanks for the reply.

It wasn't entirely clear from the commit message that a custom firmware
was exclusively used on this board to program these chips in order to
get these 2 working together.

I browsed the earlier versions of the patch and saw you explained
the same thing to someone else. Sorry about that, I missed reading
that before.

Could you please specify this explicitly in the commit message? Perhaps,
also mention that there is an external microcontroller with a custom
firmware that manages most of the video operations. For the sake of
completeness, could you also mention the part name of the controller
that's running this firmware?

Also, in the comments in the beginning of the driver:

"However the physical bridges are automatically configured by the input 
video signal, and the driver has no access to the video processing 
pipeline."

Is the automatic configuration done by the firmware, or is it a
feature of the chips itself?

>
> On the other side, I was careful to use meaningful names for the registers, so a future implementation based on same chips can take the basics from this work, at least as a starting point.

Thanks, that would be handy for later.

I had some comments on the code. I'll share those in another reply.

Archit

>
> Thanks,
>
> Peter
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
