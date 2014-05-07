From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 7 May 2014 10:55:27 -0700
Message-ID: <CAOesGMhMeLkzEeVKHM2G9Vqth6qypURN6mxbNdySVvKhQBCs5A@mail.gmail.com>
References: <536A697D.3020002@boundarydevices.com>
	<CAOesGMiHRQV+XngH4ABSeT8KDeP=iKn1ogvTA0j1BdyBwAaWSA@mail.gmail.com>
	<536A71AF.1010907@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536A71AF.1010907-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 7, 2014 at 10:47 AM, Eric Nelson
<eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> Hi Olof,
>
>
> On 05/07/2014 10:24 AM, Olof Johansson wrote:
>>
>> Hi,
>>
>> On Wed, May 7, 2014 at 10:12 AM, Eric Nelson
>> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
>>>
>>> Hi all,
>>>
>>> I suspect that this has been discussed previously, but I'm a
>>> N00b to DT and Google hasn't helped identify a discussion
>>> on the list.
>>>
>>> While getting my feet wet with DTS, I was quite surprised to
>>> see that there's no support for making parts of DTS files
>>> conditional on the kernel configuration.
>>>
>>> We often cost-optimize BOMs for our standard boards and omit
>>> bits and pieces not needed for a particular build, and
>>> it would be nice to surround optional components with
>>> conditionals:
>>>
>>>      #ifdef CONFIG_BLAH
>>>      #endif
>>>
>>> Please advise,
>>
>>
>> The DTS is independent on what drivers the kernel is actually
>> enabling. It should focus on what is actually there on hardware, and
>> not what is enabled in software.
>>
>> I think I know where you're coming from on this -- on some board-file
>> setups people used to not register the platform_device if the driver
>> wasn't configured. That was also not really a good way to do it, but
>> it made a bit more sense there, since you'd save the few bytes used by
>> the platform_device/platform_data structures.
>>
>
> It's not a question of space, but functionality.
>
> We had this come up recently when optimizing a BOM for use
> without Wi-Fi. If we omit the device and associated buffers,
> the SDIO lines are left floating, so the detection code will
> complain.
>
> It seems reasonable to tell the kernel to skip this if the
> WiFi driver isn't configured into the kernel (i.e. there's
> no point in enumerating), so I was hoping to surround this
> USDHC2 block with #ifdefs:
>
>
> https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_3.10.17_1.0.0_ga/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi#L640
>
> The alternative aren't very nice:
>         populate extra parts to drive these signals, or
>         copy the DTB and strip out the unused parts
>
> The first is wasteful (and environmentally un-friendly), and
> the second doesn't scale very well and pollutes the Git tree.
>
> Prior to DT, we surrounded the device startup calls with #ifdefs
> like this:
>
> https://github.com/boundarydevices/linux-imx6/blob/boundary-jb4.3_1.0.0-ga/arch/arm/mach-mx6/board-mx6_nitrogen6x.c#L1409

It is really annoying that you can't include a DTS in another DTS
(only DTSIs). This is a major shortcoming of the tools, as far as I am
concerned.

So, the best way we've found to do this is to create a shared dtsi
that has practically everything in it, then a skeleton DTS for the
"full" product, and a separate DTS for the cost-reduced version. The
cost-reduced DTS would insert a status = "disabled"; for the sdio
controller. That's a solution that scales very poorly as well, though.

Best would be if a DTS could just include another DTS for minor
updates, such as disabling the sdio controller in this case. I'm sure
there were some language-puritan reasons for not allowing that though.
Someone care to fill in the history?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
