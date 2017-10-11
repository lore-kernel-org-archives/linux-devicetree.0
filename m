From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Add support for USB OTG on STM32F7
Date: Wed, 11 Oct 2017 16:26:53 +0300
Message-ID: <87sheplsrm.fsf@linux.intel.com>
References: <1503930018-536-1-git-send-email-amelie.delaunay@st.com> <878tgim24i.fsf@linux.intel.com> <04a49088-b615-d7b8-0387-e7bfa32ee19f@st.com> <87vajllx8t.fsf@linux.intel.com> <1c4180ef-2da6-b420-7c6e-41769608384a@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1c4180ef-2da6-b420-7c6e-41769608384a-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org> writes:
> Hi
>
> On 10/11/2017 01:50 PM, Felipe Balbi wrote:
>> 
>> Hi,
>> 
>> Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org> writes:
>>> Hi Felip
>>>
>>> On 10/11/2017 12:04 PM, Felipe Balbi wrote:
>>>>
>>>> Hi,
>>>>
>>>> Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org> writes:
>>>>> The STM32F7 MCU family embeds two DWC2 USB OTG cores. One core is USB
>>>>> OTG FS and the other is USB OTG HS. The USB FS core only works with its
>>>>> internal phy whilst the USB HS core can work in HS with external ULPI phy
>>>>> or in FS/LS with the on-chip FS phy.
>>>>>
>>>>> Amelie Delaunay (7):
>>>>>     dt-bindings: usb: Document the STM32F7 DWC2 USB OTG HS core binding
>>>>>     usb: dwc2: add support for STM32F7 USB OTG HS
>>>>>     ARM: dts: stm32: Add USB HS support for STM32F746 MCU
>>>>
>>>> I have applied these three patches. Should I take the rest? They seems
>>>> like they could go upstream through the ARM maintainers.
>>>>
>>>
>>> I will take other DT patches in my PR.
>>>
>>> Concerning "ARM: dts: stm32: Add USB HS support for STM32F746 MCU" patch
>>> I prefer also to take it. This patch adds some pinctrl groups but stm32
>>> pinctrl bindings will change in my next PR (we will use a macro to
>>> define pins instead of using defined values). So if you push the DT
>>> patch through your pull request there will be a merge issue.
>>> It is possible that I take also this one ?
>> 
>> In that case, it's best if you take them all :-) Here's my Ack:
>> 
>> Acked-by: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> 
>> I'll drop them from my tree now
>
> Ok perfect, I will take DT patches (3 to 7) and I let you take patch 1&2 
> in your tree.

Well, I have dropped them from my tree. Please two 1-7 through yours.

-- 
balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
