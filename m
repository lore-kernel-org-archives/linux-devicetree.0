From: Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] devicetree: bindings: Document qcom,msm-id
 and qcom,board-id
Date: Fri, 06 Mar 2015 10:09:36 -0500
Message-ID: <54F9C330.5090208@codeaurora.org>
References: <1425503602-24916-1-git-send-email-galak@codeaurora.org>	<7h8ufbjkod.fsf@deeprootsystems.com>	<07D4E4D1-BF8C-4583-9505-9F321DB10406@codeaurora.org>	<CAOesGMgy3VY=4-t+N0BYqCuSLQkh-rYe8nd9iJh1mMeBFz_sWQ@mail.gmail.com> <CAF6AEGssMoo6c3nf_7fcATwocuETGZ8nbpGQpUO=KcKWC+rvHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF6AEGssMoo6c3nf_7fcATwocuETGZ8nbpGQpUO=KcKWC+rvHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/05/2015 09:28 PM, Rob Clark wrote:
> On Thu, Mar 5, 2015 at 8:59 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> On Thu, Mar 5, 2015 at 12:23 PM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>>
>>> On Mar 5, 2015, at 1:42 PM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>>
>>>> Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>>>
>>>>> The top level qcom,msm-id and qcom,board-id are utilized by bootloaders
>>>>> on Qualcomm MSM platforms to determine which device tree should be
>>>>> utilized and passed to the kernel.
>>>>>
>>>>> Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>>>>> Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>>>
>>>> Is this the special magic that allows qcom bootloaders to take a kernel
>>>> plus multiple DTBs and figure out which DTB to pass?
>>>>
>>>> Kevin
>>>
>>> yes
>>
>> That's a bummer.
>>
>> Luckily, the solution for upstream is still quite simple: Provide only
>> one devicetree, and it'll be used, right?
>>
> 
> I never managed to figure out how to get that to work (at least on my
> apq8074 dragonboard.. fortunately ifc6540 seems to work w/ appended
> dtb).. kind of a pita because it is a bit of a non-standard boot.img
> format too..

I think you're talking about the boot flow from plain poweron which I wish I
knew more about, but in case it's any help, here are some fastboot boot steps
what worked for me a while back.

http://elinux.org/Dragonboard/APQ8074

Chris

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
