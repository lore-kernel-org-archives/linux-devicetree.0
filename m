From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC/PATCH 2/3] arm: Add ARCH_WANT_OF_RANDOMNESS
Date: Wed, 12 Feb 2014 16:54:07 -0800
Message-ID: <52FC17AF.1080508@codeaurora.org>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org> < 1392168805-14200-3-git-send-email-lauraa@codeaurora.org> <20140212164907.0E958C407C9@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212164907.0E958C407C9-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2/12/2014 8:49 AM, Grant Likely wrote:
> On Tue, 11 Feb 2014 17:33:24 -0800, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> The stack canary for ARM is currently the same across reboots
>> due to lack of randomness early enough. Add ARCH_WANT_OF_RANDOMNESS
>> to allow devices to add whatever randomness they need.
>>
>> Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>
> Do you have a draft patch for a user of this yet?
>

I had a particular patch in mind but I need to re-work it to work with 
the upstream tree. I wanted to at least send out the infrastructure to 
see how open people were to the idea. After reading the comments, I have 
a couple more ideas of users as well. I'll see if I can work that in for v2.

> g.
>

Thanks,
Laura


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
