From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Wed, 19 Jul 2017 20:29:08 +0530
Message-ID: <596F73BC.1000305@nvidia.com>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com> <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com> <20170719131640.GA2533@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170719131640.GA2533@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Wednesday 19 July 2017 06:55 PM, Johan Hovold wrote:
> On Fri, Apr 07, 2017 at 12:25:49PM +0200, Linus Walleij wrote:
>> On Thu, Apr 6, 2017 at 3:35 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>>> Currently, the GPIO interface is said to Open Drain if it is Single
>>> Ended and active LOW. Similarly, it is said as Open Source if it is
>>> Single Ended and active HIGH.
>>>
>>> The active HIGH/LOW is used in the interface for setting the pin
>>> state to HIGH or LOW when enabling/disabling the interface.
>>>
>>> In Open Drain interface, pin is set to HIGH by putting pin in
>>> high impedance and LOW by driving to the LOW.
>>>
>>> In Open Source interface, pin is set to HIGH by driving pin to
>>> HIGH and set to LOW by putting pin in high impedance.
>>>
>>> With above, the Open Drain/Source is unrelated to the active LOW/HIGH
>>> in interface. There is interface where the enable/disable of interface
>>> is ether active LOW or HIGH but it is Open Drain type.
>>>
>>> Hence decouple the Open Drain with Single Ended + Active LOW and
>>> Open Source with Single Ended + Active HIGH.
>>>
>>> Adding different flag for the Open Drain/Open Source which is valid
>>> only when Single ended flag is enabled.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Patch applied.
>>
>> Good that you found this and fixed it before someone git hurt.
> Well, while decoupling single-endedness from polarity was the right
> thing to do, this change did actually break the DT binary interface.
>
> If you have an old compiled dtb whose source used GPIO_OPEN_DRAIN, you
> now instead get *open-source* behaviour on 4.12:
>
> 	GPIO_OPEN_DRAIN = GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW
> 	
> 		=> active-low, but *open source*
>
> while if you recompile that source against 4.12 you do get the expected
> open-drain behaviour, but now with inverted polarity:
>
> 	GPIO_OPEN_DRAIN = GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN
> 	
> 		=> open drain, but *active high*
>
> requiring the device tree to be updated by specifying
>
> 	(GPIO_OPEN_DRAIN | GPIO_ACTIVE_LOW)
>
> I guess the latter is fine, even if it is likely to amount to a fair bit
> of debugging world wide.
>
> Perhaps all this can still be avoided by adding further flags and
> deprecating others before people start migrating to 4.12 (after all,
> GPIO_OPEN_DRAIN has been around since 4.4 even if there are no in-kernel
> users).
>
> Or we accept the binary interface breakage -- it probably is pretty rare
> that people update the kernel without updating the dtb. I can just
> update the dts on the system that broke for me, and hopefully anyone
> debugging this issue while updating to 4.12 will find this mail quickly.
>

Yes, it breaks the older DTS with new kernel. However,  this point was 
discussed before sending patch. As there was no user in the mainline DTs 
for these macros, we made change.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
