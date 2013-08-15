Return-Path: <devicetree-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:47621 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759979Ab3HOCJW (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Wed, 14 Aug 2013 22:09:22 -0400
Message-ID: <520C3840.4040309@ti.com>
Date: Wed, 14 Aug 2013 22:09:04 -0400
From: Tom Rini <trini@ti.com>
MIME-Version: 1.0
Subject: Re: [RFC] Best practices for hardware shipping device trees
References: <20130814151345.GA2983@bill-the-cat> <520BB3E6.7000205@wwwdotorg.org> <20130814182502.GC2983@bill-the-cat> <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg>
In-Reply-To: <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, cross-distro@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, Tom Rini <tom.rini@gmail.com>, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 08:37 PM, Nicolas Pitre wrote:
> On Wed, 14 Aug 2013, Tom Rini wrote:
> 
>> On Wed, Aug 14, 2013 at 10:44:22AM -0600, Stephen Warren wrote:
>>> On 08/14/2013 09:13 AM, Tom Rini wrote:
>>>> Hey all,
>>>>
>>>> Do we have a document yet talking about the best practices for how we
>>>> would like a hardware vendor to ship, store and possibly update a device
>>>> tree, on the hardware?  "However they like" seems likely to invite
>>>> problems down the line with everyone trying their own thing.  Thanks!
>>>
>>> I don't believe there's any written guidance, no.
>>>
>>> The initial guidance Grant gave (IIRC at the first Linaro Connect last
>>> year, or perhaps the ARM workshop in Prague, or perhaps also in various
>>> ARM kernel list threads?) was that the DTBs should be stored/accessed in
>>> exactly the same way as the kernel, which on many systems implies it's a
>>> file in /boot (although MTD partitions, ... are also possible kernel
>>> locations). The idea here was to explicitly make upgrading the DTB as
>>> easy as upgrading the kernel, and explicitly without having to upgrade
>>> any firmware, since that's a more dangerous process in most cases.
>>>
>>> Now perhaps that advice was only intended to apply very early on when DT
>>> was really new on ARM, and has "aged out" by now? If so, I don't recall
>>> that every being explicitly mentioned or communicated later.
>> [snip out a bit more of Stephen's answer]
>>
>> Yes, this notion certainly is the opposite of what was suggested on the
>> cross-distro list, both as part of a "what should a bootloader provide
>> to get commodity distros to support the board" thread and the "where
>> should a device tree live in the filesystem" thread.  Cc'ing them now
>> because this is one of those things that feels like it needs solving,
>> solving soon, and done in a way the least number of folks get surprised
>> about it.
> 
> I don't think the "however they like" approach is that bad.  It is 
> certainly less of a problem than "exactly the same way as the kernel" is.
> 
> Using /boot implies a distro filesystem and we'd rather wish for DT to 
> be independent from a distro or even Linux.  The DTB should therefore be 
> stored and accessed in a way which is hardware/bootloader specific.  The 
> distro being installed on top shouldn't have to care.

Right, the expectation has been set that the DT isn't supposed to be
tied to the kernel and I don't wish to re-hash that.  I'm asking, should
we provide some expectations / guidance on how to store the DT?  Should
quirks be expected to be worked around at the DT consumer level (kernel,
bootloader, whatever) or in updating the stored copy?  That there rules
out, or not, certain choices.

-- 
Tom
