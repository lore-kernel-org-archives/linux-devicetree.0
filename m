Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:38121 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab3HOWel (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 18:34:41 -0400
Message-ID: <520D577B.2080903@wwwdotorg.org>
Date: Thu, 15 Aug 2013 16:34:35 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC] Best practices for hardware shipping device trees
References: <20130814151345.GA2983@bill-the-cat> <520BB3E6.7000205@wwwdotorg.org> <20130814182502.GC2983@bill-the-cat> <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg> <520C3840.4040309@ti.com> <alpine.LFD.2.03.1308142227050.14472@syhkavp.arg> <20130815145310.GE2983@bill-the-cat> <520CF3F9.5050708@wwwdotorg.org> <20130815163713.GA9190@bill-the-cat> <520D108A.8060605@wwwdotorg.org> <20130815185659.GC9190@bill-the-cat>
In-Reply-To: <20130815185659.GC9190@bill-the-cat>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <trini@ti.com>
Cc: Tom Rini <tom.rini@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, cross-distro@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 08/15/2013 12:56 PM, Tom Rini wrote:
> On Thu, Aug 15, 2013 at 11:31:54AM -0600, Stephen Warren wrote:
>> On 08/15/2013 10:37 AM, Tom Rini wrote:
>>> On Thu, Aug 15, 2013 at 09:30:01AM -0600, Stephen Warren wrote:
...
>>>> We certainly expect U-Boot to update the DT that's passed to the kernel,
>>>> for:
>> ...
>>>> * Possibly to add a "simplefb" node, until the kernel has LCD panel
>>>> support (CDF).
>>>
>>> Can we talk about that last one more?  That sounds like some sort of
>>> temporary binding.  Or am I using the terms wrong?  But, it sounds like
>>> we're saying add whatever nodes might be missing?
> [snip useful explanation of what simplefb is]
>> simplefb information could get into DT in a couple ways:
>>
>> 1) The DTB for the platform could include the simplefb node right from
>> the start.
>>
>> This model would be appropriate for more permanent use of simplefb,
>> since the node appears in the orignial DT.
>>
>> In this case, the bootloader would at least have to fill in the physical
>> memory address of the frame-buffer that it allocated. If the display is
>> device with variable resolution, rather than a fixed built-in LCD, the
>> bootloader would also have to fill in the resolution properties.
>>
>> 2) The DTB for the platform doesn't include the simplefb node.
>>
>> This would be appropriate for platforms that use simplefb as a temporary
>> step until complete OS support for the display HW is present, so a real
>> driver can be used. This prevents DTBs from ever having the
>> soon-to-be-removed simplefb node encoded into them.
>>
>> In this case, the bootloader would have to add a completely new simplefb
>> node to the DT, and fill in all the properties.
> 
> OK, now why wouldn't the right thing to do here be to #1 and later in
> time, the DT is updated when the better drivers are merged in?
> 
> I don't think it's strictly a bad thing to say that firmware/bootloader
> is allowed to construct temporary nodes, but we should make it clear
> when that's an OK practice.  Yes?

For systems where simplefb is a transitional measure (i.e. where it
would eventually make sense to define a complete binding for the HW),
I'd prefer to avoid churn in the *.dts files by never including the
simplefb node in them, but rather adding it dynamically. In other words,
we don't add something to the file just to take it away later.

That's the logic behind why I wrote separate "add node" and "fill in
node" functions for the simplefb in U-Boot.

One thing that's slightly different about simplefb is that the node
isn't useful without the bootloader filling in some information, which
generally isn't true of DT content.

It'd certainly be technically possible to just add the simplefb node
into DT in all cases, then swap it out later when something else came along.

