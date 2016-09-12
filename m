From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH 1/3] misc: Add Aspeed BT IPMI host driver
Date: Mon, 12 Sep 2016 17:06:36 -0500
Message-ID: <88ec11d5-3683-7ad3-341e-42d951b6574e@acm.org>
References: <1472664259-23933-1-git-send-email-clg@kaod.org>
 <c06a8afb-9143-6aef-3425-ad1e50cae35d@kaod.org>
 <1ce6c4b4-5938-22fc-7467-d1efc220b772@gmail.com> <4727554.yt7pF8chOH@wuerfel>
 <7db5ada0-49ea-55eb-089e-d979941ceff5@gmail.com>
 <b42f1b61-8b00-2412-d51d-6207da8afcd6@kaod.org>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b42f1b61-8b00-2412-d51d-6207da8afcd6-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2016 04:23 PM, Cédric Le Goater wrote:
> Hello,
>
> On 09/12/2016 10:33 PM, Corey Minyard wrote:
>> On 09/12/2016 02:15 PM, Arnd Bergmann wrote:
>>> On Monday, September 12, 2016 1:55:40 PM CEST Corey Minyard wrote:
>>>> On 09/02/2016 08:22 AM, Cédric Le Goater wrote:
>>>>> Hello,
>>>>>
>>>>> Adding Corey in cc: . I guess I should have done that in the first place.
>>>> Yes, probably so.  I've been travelling and didn't see it on the mailing
>>>> lists until now.
>>>>
>>>> There is already a BT driver in the kernel, in drivers/char/ipmi, why
>>>> won't that work?
>>> The new driver is the host side (running on the BMC), the existing one
>>> is the client (running on the PC).
>>>
>>>      Arnd
>> Ok, that's not really clear from the documentation or the Kconfig.
>> In the IPMI spec the "host" side is the computer side, not the BMC
>> side.  Like:
>>
>>     11.6.1 BT Host Interface Registers
>>     The Host BT interface provides an independent set of registers and
>>     interrupts to allow the Host driver to
>>     communicate with the baseboard management controller without
>>     conflicting with the O/S ACPI driver.
>>
>> In light of that, this should probably be named the bt-bmc driver.
>>
>> I haven't reviewed this in detail, but I'm ok with putting it in
>> drivers/char/ipmi.  The state machine part looks reasonably
>> generic.  The configuration part isn't, but that could be split
>> out later if necessary.
>>
>> The biggest thing I don't like is the byte at a time interfaces
>> from userspace.  That seems fairly inefficient if the system
>> does extra work for each userspace access.  IIRC some
>> systems do and some don't.
> What about the ioctl to send an SMS ATN event to the host ? Is
> that ok for you ?

Yeah, that's necessary, there's no way the low-level driver can
know when to do that.

I have a similar piece of code in the qemu IPMI emulator, even
the external IPMI emulator has a message it sends to set ATTN.

I did look at similarities between the two pieces of code, but
the qemu one has to be register-read/write driven, so it's
completely different in design.

-corey

> Thanks,
>
> C.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
