From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v3 01/11] dm: serial: Update binding for PL01x
 serial UART
Date: Thu, 13 Aug 2015 13:37:48 -0600
Message-ID: <55CCF20C.9000104@wwwdotorg.org>
References: <1438954951-13329-1-git-send-email-sjg@chromium.org>	 <1438954951-13329-2-git-send-email-sjg@chromium.org>	 <CACRpkdZa2O1MqCVT8q2P0u0ciXK+6HFbQQGXB_-chimg=FbzQg@mail.gmail.com>	 <CAPnjgZ3V1KS7POEhsvj63OSB29MUtyaZGBoFR8JGPnaN=-fXVw@mail.gmail.com>	 <55CCBFB2.7050301@wwwdotorg.org> <20150813181346.GS25532@bill-the-cat> <1439492679.242.35.camel@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439492679.242.35.camel-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Joe Hershberger <joe.hershberger-acOepvfBmUk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/13/2015 01:04 PM, Ian Lepore wrote:
> On Thu, 2015-08-13 at 14:13 -0400, Tom Rini wrote:
>> On Thu, Aug 13, 2015 at 10:02:58AM -0600, Stephen Warren wrote:
>>> On 08/13/2015 09:59 AM, Simon Glass wrote:
>>>> Hi Linus,
>>>>
>>>> On 11 August 2015 at 07:00, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>>> On Fri, Aug 7, 2015 at 3:42 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>>>
>>>>>> This binding differs from that of Linux. Update it and change existing
>>>>>> users.
>>>>>>
>>>>>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>>> (...)
>>>>>>   doc/device-tree-bindings/serial/pl01x.txt | 55 ++++++++++++++++++++++++++++---
>>>>>
>>>>> So why does U-Boot have its own copy of any bindings at all?
>>>>>
>>>>> This is forking the ontology of who gets to define bindings I fear.
>>>>> It's a bit like have two bibles both claiming to be the word of god.
>>>>> (OK maybe a hyperbolic statement, but you see what I mean.)
>>>>>
>>>>> Can't we just have the bindings in the Linux kernel tree please?
>>>>
>>>> Is there any plan to move them out of Linux and put them in a separate place?
>>>>
>>>> We should make an effort to sync the device tree files with Linux periodically.
>>>>
>>>> I quite like having the bindings in U-Boot since it makes people think
>>>> about what they are adding. Are you worried that the bindings in
>>>> U-Boot might evolve separately? Certainly there has been some of that.
>>>>
>>>> However I recently sent a series to add a few things for Raspberry Pi
>>>> ("arm: rpi: Device tree modifications for U-Boot") and I don't yet see
>>>> a willingness to add what some see as 'U-Boot things' to the binding.
>>>> How do we address that?
>>>
>>> DT isn't supposed to contain "U-Boot things", but "an OS-agnostic
>>> description of the hardware". So, I imagine the solution is not to
>>> attempt to do that:-)
>>
>> This always makes me ask if the FreeBSD folks or VxWorks folks have
>> adopted the "Linux" bindings or if the DT files continue to be
>> "OS-agnostic" and "only functional with Linux".  It was a while ago last
>> I looked but it made my head hurt a little doing a quick translation for
>> an SoC that I was familiar with.
>>
>
> As the FreeBSD person who got our first SoC (imx6, only partially
> supported) converted to use the Linux DT files rather than our own
> homebrew mess we started with, I would say that my opinion of the
> existing DT information is that it is an extension of Linux device
> drivers written in a different language.
>
> The information available is in no way independent of the Linux device
> drivers, it is exactly the information those drivers need.  It is often
> not the information needed in another OS with independently written
> drivers.  And especially it is not ordered and structured in a way that
> works well with the device enumeration and instantiation models used by
> another OS.
>
> A great case in point would be i2c eeproms.  What a perfect opportunity
> DT would be to describe everything about the eeprom parts (total
> capacity, page read/write size, whether the page address bits extend
> into the bus-slave address bits, etc).  It seems to me that anything
> claiming to be an independent description of the hardware would have to
> include such things.  Instead, all the bindings define is the compatible
> string.  That's crazy.  Why?  Well, when I went and looked at the Linux
> eeprom drivers it became clear why:  that's all they need to know,
> because everything else is hard-coded in tables in the driver source.
>
> So if I want to write a FreeBSD i2c eeprom driver that uses DT data,
> what are my choices?  I have exactly one:  make my driver essentially a
> clone of the Linux driver, with all the same data hard-coded in source.
>
> All in all, it's not impossible for another OS to work with the DT
> information that begins its life in Linux, but it's not really easy.

In fairness, that's got nothing to do with Linux, but it's a general 
decision re: the level of detail to put into DT. There's always a 
discussion about which level of detail to represent in DT when new 
bindings are created.

The type of an I2C device completely defines all of its properties; the 
model name/... is enough to fully describe its behaviour. That's a good 
reason to put just that information into DT, to avoid redundancy.

In some cases, bindings have tended towards placing just the compatible 
value into the DT (e.g. your example). This does require drivers to be 
able to look up that information from the compatible value.

That case tends to be more common since what's really important about DT 
is cleanly representing the resource interactions between devices; let 
the drivers know all the details of the device's internals, and let DT 
describe any point where the device/driver has to interact with the 
system or other devices/drivers around it.

Often when a driver supports a ton of devices, it needs explicit code to 
deal with each individual device's quirks, so it may as well have the 
table of quirks inside it too, rather than having the table in DT, and 
the code to handle them in the driver, and have to do work to link the 
two together.

In other cases there's a much more generic description in DT, with all 
the device-specific quirks described in DT. This would allow completely 
generic drivers.

This case is less popular, and I'll admit I'm having a hard time quickly 
finding an example in the DT files I deal with day-to-day.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
