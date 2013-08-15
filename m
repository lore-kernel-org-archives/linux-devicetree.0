Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:47422 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757666Ab3HORb7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 13:31:59 -0400
Message-ID: <520D108A.8060605@wwwdotorg.org>
Date: Thu, 15 Aug 2013 11:31:54 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC] Best practices for hardware shipping device trees
References: <20130814151345.GA2983@bill-the-cat> <520BB3E6.7000205@wwwdotorg.org> <20130814182502.GC2983@bill-the-cat> <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg> <520C3840.4040309@ti.com> <alpine.LFD.2.03.1308142227050.14472@syhkavp.arg> <20130815145310.GE2983@bill-the-cat> <520CF3F9.5050708@wwwdotorg.org> <20130815163713.GA9190@bill-the-cat>
In-Reply-To: <20130815163713.GA9190@bill-the-cat>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tom Rini <trini@ti.com>
Cc: Tom Rini <tom.rini@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, cross-distro@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 08/15/2013 10:37 AM, Tom Rini wrote:
> On Thu, Aug 15, 2013 at 09:30:01AM -0600, Stephen Warren wrote:
...
>> On Tegra, there are two DTBs:
>>
>> The first is attached to the U-Boot image, and parameterizes U-Boot
>> itself. The bindings used in this are often quite different from the
>> kernel:-(
> [snip]
>> Perhaps the two should be unified, although there isn't much interest in
>> bringing the U-Boot DT content up to scratch, it seems:-( I would just
>> ignore the U-Boot copy for now, and treat it as an internal
>> implementation detail of U-Boot.
> 
> I would very much like to see them unified and used more in U-Boot.
> Most U-Boot development is about scratching ones own itch, is the
> biggest hurdle towards mass conversion to DTs (followed by the number of
> platforms that aren't being updated to DT in the kernel, followed by
> needing more conversion done in the kernel, bindings finalized, etc).

I was mainly talking about the people specifically working on Tegra
support in U-Boot rather than U-Boot as a generality.

...
>> We certainly expect U-Boot to update the DT that's passed to the kernel,
>> for:
...
>> * Possibly to add a "simplefb" node, until the kernel has LCD panel
>> support (CDF).
> 
> Can we talk about that last one more?  That sounds like some sort of
> temporary binding.  Or am I using the terms wrong?  But, it sounds like
> we're saying add whatever nodes might be missing?

For Tegra, this should be temporary, although temporary will probably be
a long time! For other SoCs, it may be a reasonable long-term solution.

The simplefb DT binding and associated Linux driver simply defines a
memory region as being the frame-buffer, so that the OS can just write
pixels to the memory region, and they'll be displayed. It's assumed that
the HW to do the scanout is already set up before the OS starts.

For Tegra, this is useful on some platforms that have built-in LCDs,
since the kernel support for LCDs, which has to be the CDF (Common
Display Framework) under the new DT and common driver regime, is
perpetually missing. Having U-Boot create a simplefb node in DT and
enabling the simplefb driver in the kernel is a way of getting useful
display support prior to CDF getting merged.

The same argument applies to upstream kernel support for the Samsung
Exynos CPU used in the ARM ChromeBook.

For the Raspberry Pi, I wanted to avoid defining DT bindings for the RPC
communication channel out to the VideoCore co-processor which controls
the display path. Relying on simplefb for the display allowed me to
defer creating bindings/drivers for the RPC channel etc.

On other HW, the display HW may be so simple that it's just not worth
writing an OS driver; the best way to support the HW may always be to
have a simplefb node in DT and have a single driver in the bootloader
that's already initialized the HW, rather than writing an OS driver just
to re-do what the bootloader already did.

simplefb information could get into DT in a couple ways:

1) The DTB for the platform could include the simplefb node right from
the start.

This model would be appropriate for more permanent use of simplefb,
since the node appears in the orignial DT.

In this case, the bootloader would at least have to fill in the physical
memory address of the frame-buffer that it allocated. If the display is
device with variable resolution, rather than a fixed built-in LCD, the
bootloader would also have to fill in the resolution properties.

2) The DTB for the platform doesn't include the simplefb node.

This would be appropriate for platforms that use simplefb as a temporary
step until complete OS support for the display HW is present, so a real
driver can be used. This prevents DTBs from ever having the
soon-to-be-removed simplefb node encoded into them.

In this case, the bootloader would have to add a completely new simplefb
node to the DT, and fill in all the properties.
