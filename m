From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] firmware: of: populate /firmware/ node during init
Date: Fri, 11 Aug 2017 16:37:15 +0100
Message-ID: <01aa3488-944e-b98c-65a4-7ec1b31af208@arm.com>
References: <1502458237-1683-1-git-send-email-sudeep.holla@arm.com>
 <1502458237-1683-2-git-send-email-sudeep.holla@arm.com>
 <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a1p8xS4u5EQ9auqgcmhXaybhDdsa6ah3G-7TeEf+ko9kA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/08/17 15:37, Arnd Bergmann wrote:
> On Fri, Aug 11, 2017 at 3:30 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> Since "/firmware" does not have its own "compatible" property as it's
>> just collection of nodes representing firmware interface, it's sub-nodes
>> are not populated during system initialization.
>>
>> Currently different firmware drivers search the /firmware/ node and
>> populate the sub-node devices selectively. Instead we can populate
>> the /firmware/ node during init to avoid more drivers continuing to
>> populate the devices selectively.
>>
>> This patch adds initcall to achieve the same.
> 
> Hmm, I'm a bit skeptical whether representing anything under /firmware
> as a platform device is a good idea. Having a more structured way to
> probe those seems like a good idea, but maybe a different subsystem
> would be more appropriate.
> 

Just a vague thought: if we go to an extent of creating a bus to deal
with these, won't we need to be more formal and create compatible for that ?

If we do that, then how do we support existing device trees ? Again we
are back to the same point but I do agree with your views.

> I do realize that a 'platform_device' has become a rather generic abstraction
> for almost anything, but at some point we might want to draw the line
> of what is a platform_device.
> 

As Rob pointed out it's already being handled as platform_devices in
many cases and my aim was just to reduce the duplication.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
