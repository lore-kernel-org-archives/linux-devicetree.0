From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC][PATCH 0/4] SRAM based reboot reason driver for HiKey
Date: Mon, 8 Aug 2016 16:48:17 +0300
Message-ID: <0378e50e-c115-196c-d831-ed15dc660ca4@mentor.com>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <8107419f-ded4-6d0f-d2da-7e51bc3f418e@mentor.com>
 <CAL_JsqLL01G_=b6tV_qsKmPCEJa2Fhp_zk5u9s1-eYdzfHjbxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLL01G_=b6tV_qsKmPCEJa2Fhp_zk5u9s1-eYdzfHjbxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishal Bhoj <vishal.bhoj-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 08/06/2016 01:37 AM, Rob Herring wrote:
> On Fri, Aug 5, 2016 at 7:46 AM, Vladimir Zapolskiy
> <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>> Hi John,
>>
>> On 08/04/2016 02:05 AM, John Stultz wrote:
>>>
>>> Now that Andy's reboot reason core driver has landed, I wanted
>>> to resubmit a reworked version of my SRAM based reboot reason
>>> driver.
>>>
>>> This allows the kernel to communicate to the bootloader what mode
>>> it should reboot to using some reserved memory.
>>>
>>> Feedback would be very much appreciated!
>>
>>
>> in my opinion the taken approach is wrong, and I've already explained
>> why and how to rework your driver to shrink the change, please see
>> https://lkml.org/lkml/2016/1/27/133
>>
>> In this case I think that a SRAM device node should just contain
>> a plain description of partitions, compatible = "sram-reboot-mode" is
>> clearly not a device on "SRAM bus", it is not a device at all, so
>> please let's separate policy from mechanism
>
> Having a 2nd node for the driver is still not a device on a bus. It
> adds unneeded complexity to the binding IMO.

What second node for the driver do you mean here? If you reference
a reset/syscon driver then there should be only a property pointing
to a partition on SRAM, similar case is found in CODA driver, see
Documentation/devicetree/bindings/media/coda.txt and in my short term
plans to do the same for lpc-eth driver.

And a node which describes an area on SRAM is generally needed in both
cases, however note that with my approach techincally it is possible to
specify the entire SRAM device as a target partition, sometimes it is
sufficient but here it is not wanted, because there will be no control
on offset/size of the particular data stored on SRAM. The essential
part is the meaning of this added second node, either it is a reserved
partition (= unified definition independently on consumers) or
a description with a compatible property for some arbitrary device.
Why zoo of compatibles under SRAM node should be accepted? Why SRAM
should be converted to a bus type device? Should be the same done
with e.g. MTD or NVMEM devices? IMHO clear separation between data
proiders and data consumers should be preserved if possible, and here
it appears to be a simpler solution for the given technical problem.

> The current approach also follows the model ramoops is using. Right
> now it's using reserved-memory, but that could easily be extended to
> SRAM region as well.
>
>> Because my proposed alternative approach separates policy from
>> mechanism, it for instanse allows to avoid overlappings on SRAM areas,
>> and still other drivers may serve as consumers of partitions on SRAM.
>
> You could still have multiple consumers and having a compatible string
> doesn't necessarily imply a driver. Though multiple consumers without
> something arbitrating access sounds like broken design to me.
>

Not in this case, the interface to SRAM partitions and/or SRAM as
a whole deliberately assumes that a memory area is shared among all
consumers in sense of a memory pool, data resides within the
given area but it is not inter-shared among consumers.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
