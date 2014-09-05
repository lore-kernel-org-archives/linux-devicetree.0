From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] Documentation: bcm7120-l2: Add Broadcom BCM7120-style
 L2 binding
Date: Fri, 05 Sep 2014 12:57:30 -0700
Message-ID: <540A15AA.4000805@gmail.com>
References: <1409265326-7579-1-git-send-email-f.fainelli@gmail.com> <1409265326-7579-3-git-send-email-f.fainelli@gmail.com> <alpine.DEB.2.10.1409031410580.3333@nanos> <20140903124317.GB3127@leverpostej> <5407490E.7060505@gmail.com> <20140905090528.GG2172@leverpostej> <5409FA82.6000703@gmail.com> <alpine.DEB.2.10.1409052113210.5472@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1409052113210.5472@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/05/2014 12:21 PM, Thomas Gleixner wrote:
> On Fri, 5 Sep 2014, Florian Fainelli wrote:
>> On 09/05/2014 02:05 AM, Mark Rutland wrote:
>>>>>>> +- brcm,irq-can-wake: if present, this means the L2 controller can be used as a
>>>>>>> +  wakeup source for system suspend/resume.
>>>>>
>>>>> How variable is this?
>>>>
>>>> There's two instances of this interrupt controller on most SoCs, one
>>>> that can wake up the system, one that cannot, see below.
>>>>
>>>>>
>>>>> I realise have properties like this elsewhere, but it seems to be
>>>>> hacking around the lack of a decent power domain interface for figuring
>>>>> this out.
>>>>
>>>> Humm, I kind of see your point here with the power domains, I don't see
>>>> a big problem with specifying that property though, at most this becomes
>>>> redundant when we have a power domain representation (which will be very
>>>> simple: always-on and everything else).
>>>
>>> Sure, we seem to have done that elsewhere.
>>>
>>>>>>> +- brcm,int-fwd-mask: if present, a 32-bits bit mask describing the interrupts
>>>>>>> +  which need to be enabled in this controller to flow to the higher level
>>>>>>> +  interrupt controller. This is typically needed for the UARTs interrupts to
>>>>>>> +  flow through the top-level interrupt controller (e.g: ARM GIC on ARM-based
>>>>>>> +  platforms).
>>>>>>> +
>>>>>
>>>>> I don't follow why this property is needed at all. Is this a mechanism
>>>>> to bypass this controller entirely? Why should this be described as a
>>>>> fixed HW property?
>>>>
>>>> This interrupt controller has traditionally (not necessarily for good
>>>> reasons) been the placeholder for special bits that control whether our
>>>> UARTs level 1 interrupts (wired to the ARM GIC) will flow to the L1
>>>> interrupt.
>>>
>>> So basically setting these bits unmasks some irq lines inpout to the
>>> GIC?
>>
>> Right, this is what happens. We prefer to use the GIC interrupts because
>> that provides more flexibility.
>>
>>>
>>>> We discussed initially with Arnd Bergman about how to best approach
>>>> this, and he was happy with a bitmask since:
>>>>
>>>> a) that is a one-time initialization thing that can happen anywhere in
>>>> the kernel before UART interrupts get used (so before user-space gets
>>>> scheduled)
>>>
>>> That feels a little dodgy to me, but perhaps that's ok.
>>
>> The other approach was to use the "interrupt-extended" property for the
>> UART nodes and have them reference both their GIC interrupt, and the
>> BCM7120-L2 interrupt, but that also requires UART driver/platform
>> modifications to account for that extra "interrupt", on which we are
>> only ever going to call enable_irq() and nothing more.
>>
>> So, in the end, this turned out to be simpler to just read the
>> "brcm,irq-fwd-mask" property and apply it to the relevant register.
> 
> So if I understand correctly what you have is:
> 
>                           /- GIC------------->   
>  Device-irq ---- [routing]
>                           \- BC irq chip ---->
> 
> and you implement it as
> 
>  Device-irq ---- [BC irq chip] ---- [GIC] --->
>                             |
>                             ----------------->
> 
> And the fwd mask is to tell the BC chip to use the GIC and which irq
> of the GIC, so it can fiddle with the GIC under the hood, right?

The forward mask really is to tell the BCM7120 l2 interrupt controller:
bypass me, and output the UART interrupts directly at the GIC level, so
I think this does match your understanding.

Not setting the forward mask means you would get the UART interrupts at
the BCM7120 l2 interrupt controller level, and have to handle them here.

Hope this helps clarify what this funky piece of hardware does.
--
Florian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
