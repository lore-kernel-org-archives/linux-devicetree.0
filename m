Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:63493 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755750Ab3HOS5D (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 14:57:03 -0400
Received: by mail-qa0-f53.google.com with SMTP id hu14so31859qab.19
        for <devicetree@vger.kernel.org>; Thu, 15 Aug 2013 11:57:02 -0700 (PDT)
Date: Thu, 15 Aug 2013 14:56:59 -0400
From: Tom Rini <trini@ti.com>
Subject: Re: [RFC] Best practices for hardware shipping device trees
Message-ID: <20130815185659.GC9190@bill-the-cat>
References: <20130814151345.GA2983@bill-the-cat>
 <520BB3E6.7000205@wwwdotorg.org>
 <20130814182502.GC2983@bill-the-cat>
 <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg>
 <520C3840.4040309@ti.com>
 <alpine.LFD.2.03.1308142227050.14472@syhkavp.arg>
 <20130815145310.GE2983@bill-the-cat>
 <520CF3F9.5050708@wwwdotorg.org>
 <20130815163713.GA9190@bill-the-cat>
 <520D108A.8060605@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <520D108A.8060605@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tom Rini <tom.rini@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, cross-distro@lists.linaro.org, Mark Rutland <Mark.Rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 15, 2013 at 11:31:54AM -0600, Stephen Warren wrote:
> On 08/15/2013 10:37 AM, Tom Rini wrote:
> > On Thu, Aug 15, 2013 at 09:30:01AM -0600, Stephen Warren wrote:
> ...
> >> On Tegra, there are two DTBs:
> >>
> >> The first is attached to the U-Boot image, and parameterizes U-Boot
> >> itself. The bindings used in this are often quite different from the
> >> kernel:-(
> > [snip]
> >> Perhaps the two should be unified, although there isn't much interest in
> >> bringing the U-Boot DT content up to scratch, it seems:-( I would just
> >> ignore the U-Boot copy for now, and treat it as an internal
> >> implementation detail of U-Boot.
> > 
> > I would very much like to see them unified and used more in U-Boot.
> > Most U-Boot development is about scratching ones own itch, is the
> > biggest hurdle towards mass conversion to DTs (followed by the number of
> > platforms that aren't being updated to DT in the kernel, followed by
> > needing more conversion done in the kernel, bindings finalized, etc).
> 
> I was mainly talking about the people specifically working on Tegra
> support in U-Boot rather than U-Boot as a generality.

Right.  And with my U-Boot guy hat on, I want to be clear that this is a
direction I want to see the project move in, once things have settled
down a bit with the kernel side of things (since we'll have our own
headaches like "how little of the system can we hard-code" and "how can
we merge device trees, or do we discard that first one?").

> ...
> >> We certainly expect U-Boot to update the DT that's passed to the kernel,
> >> for:
> ...
> >> * Possibly to add a "simplefb" node, until the kernel has LCD panel
> >> support (CDF).
> > 
> > Can we talk about that last one more?  That sounds like some sort of
> > temporary binding.  Or am I using the terms wrong?  But, it sounds like
> > we're saying add whatever nodes might be missing?
[snip useful explanation of what simplefb is]
> simplefb information could get into DT in a couple ways:
> 
> 1) The DTB for the platform could include the simplefb node right from
> the start.
> 
> This model would be appropriate for more permanent use of simplefb,
> since the node appears in the orignial DT.
> 
> In this case, the bootloader would at least have to fill in the physical
> memory address of the frame-buffer that it allocated. If the display is
> device with variable resolution, rather than a fixed built-in LCD, the
> bootloader would also have to fill in the resolution properties.
> 
> 2) The DTB for the platform doesn't include the simplefb node.
> 
> This would be appropriate for platforms that use simplefb as a temporary
> step until complete OS support for the display HW is present, so a real
> driver can be used. This prevents DTBs from ever having the
> soon-to-be-removed simplefb node encoded into them.
> 
> In this case, the bootloader would have to add a completely new simplefb
> node to the DT, and fill in all the properties.

OK, now why wouldn't the right thing to do here be to #1 and later in
time, the DT is updated when the better drivers are merged in?

I don't think it's strictly a bad thing to say that firmware/bootloader
is allowed to construct temporary nodes, but we should make it clear
when that's an OK practice.  Yes?

-- 
Tom
