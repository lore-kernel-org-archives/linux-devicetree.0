From: Arun Ramamurthy <arun.ramamurthy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCHv1] rtc: bcm-iproc: Add support for Broadcom iproc rtc
Date: Thu, 12 Feb 2015 14:17:41 -0800
Message-ID: <54DD2685.6020207@broadcom.com>
References: <1418757750-3628-1-git-send-email-arun.ramamurthy@broadcom.com> <549095CA.7090505@broadcom.com> <5490A9FC.6030305@broadcom.com> <1603624.EMYvBCWhuM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1603624.EMYvBCWhuM@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Arun Ramamurthy <arunrama-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd

My apologies for the late reply, I was moved to other work items. I 
wanted to get more clarification on the syscon issue so that I can 
submit the next patch set. If I understand correctly, you would like
me to move the CRMU logic to a new driver under mfd/ and use the syscon
api calls in my rtc driver? Thanks

Arun

On 14-12-17 06:31 AM, Arnd Bergmann wrote:
> On Tuesday 16 December 2014 13:54:04 Arun Ramamurthy wrote:
>> On 14-12-16 12:27 PM, Ray Jui wrote:
>>> On 12/16/2014 12:19 PM, Arnd Bergmann wrote:
>>>>
>>>> It sounds like CRMU is some other unit aside from the RTC. Could this
>>>> be something like a generic system controller? I think it should
>>>> either have its own driver or use the syscon logic if that is what
>>>> this is.
>>>>
>>> Giving that CRMU has scattered, miscellaneous control logic for multiple
>>> different peripherals, it probably makes more sense to use the syscon
>>> logic here.
>>>
>> Arnd, thanks for the feedback. If I was to write a separate driver for
>> the CRMU, I would have to export certain functions and create an api
>> that only this RTC driver would use. I am not sure that is efficient or
>> required. What is your opinion?
>> Would it be better if I use the syson api in my current driver and move
>> the CRMU registers to separate syscon device tree entry?
>>
>
> This is something that's normally up to the platform maintainers, depending
> on what works best for a given SoC. If you have a control block that
> wants to export the same high-level API for multiple drivers, that's
> fine, but if literally every register does something different, a syscon
> driver works best.
>
> It's also possible that some of the functions of the CRMU already have
> abstractions, like system-reset, device-reset, regulator or clock support.
> In that case, you can still use syscon but have the more other drivers
> use that for accessing the registers.
>
> 	Arnd
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
