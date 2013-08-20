Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:57434 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751428Ab3HTR3P (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 13:29:15 -0400
Received: by mail-qa0-f53.google.com with SMTP id hu14so493659qab.12
        for <devicetree@vger.kernel.org>; Tue, 20 Aug 2013 10:29:14 -0700 (PDT)
Date: Tue, 20 Aug 2013 13:29:11 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [RFC] Best practices for hardware shipping device trees
In-Reply-To: <CAHCPf3tz-2MZXEKLw3iMJ7b0fD7wKivbOn3ynk7+b6cNA6paqw@mail.gmail.com>
Message-ID: <alpine.LFD.2.03.1308201312430.14472@syhkavp.arg>
References: <20130814151345.GA2983@bill-the-cat> <520BB3E6.7000205@wwwdotorg.org> <20130814182502.GC2983@bill-the-cat> <alpine.LFD.2.03.1308142030020.14472@syhkavp.arg> <520C3840.4040309@ti.com> <alpine.LFD.2.03.1308142227050.14472@syhkavp.arg>
 <20130815235909.GA11437@voom.fritz.box> <alpine.LFD.2.03.1308152241410.14472@syhkavp.arg> <20130819001514.GA9098@voom.fritz.box> <alpine.LFD.2.03.1308191439530.14472@syhkavp.arg> <355F36F8-3C10-4D6D-AF5A-06080BF7AD5F@suse.de> <alpine.LFD.2.03.1308200756400.14472@syhkavp.arg>
 <CAHCPf3tz-2MZXEKLw3iMJ7b0fD7wKivbOn3ynk7+b6cNA6paqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: devicetree-owner@vger.kernel.org
To: Matt Sealey <neko@bakuhatsu.net>
Cc: Alexander Graf <agraf@suse.de>, Mark Rutland <Mark.Rutland@arm.com>, cross-distro@lists.linaro.org, Tom Rini <tom.rini@gmail.com>, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, David Gibson <david@gibson.dropbear.id.au>
List-ID: <devicetree@vger.kernel.org>

On Tue, 20 Aug 2013, Matt Sealey wrote:

> On Tue, Aug 20, 2013 at 7:02 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> > On Tue, 20 Aug 2013, Alexander Graf wrote:
> >
> >
> >> > And if your bootloader produces a bad DTB and you cannot let end users
> >> > upgrade the bootloader then this is certainly against best practice.
> >>
> >> But that's exactly how everyone else works. On x86 you get your ACPI
> >> tables from firmware, on PPC you get your device tree from firmware
> >> and you really don't update your firmware just because your OS thinks
> >> the tables are wrong.
> >
> > And everyone, except maybe yourself, despise that state of affair.
> >
> > Sorry but we ought to push for something better when we can.  As device
> > tree is being established on ARM, now is the time to learn from past
> > mistakes and break away from the broken legacy methods.
> 
> Well, provide support for real OpenFirmware or firmware-provided DTB,
> and allow people to append DTBs to their kernels if they need to
> update them.

Forget about appending DTBs to the kernel.  That's only a temporary 
hack which would add more maintenance work into distro people's plate if 
that was to be promoted as a recommended practice.

> The better state of affairs is that vendors who wish to support Linux
> on the systems they ship would allow the firmware to be upgraded and
> collaborate in the process.

That's what I've been saying all along.  Either the firmware is fixable 
by anyone (meaning source code is available) and upgradeable by end 
users, or the firmware allows for easy update by end users of the DTB it 
passes to the kernel if the OEM is too nervous about firmware upgrades 
or unwilling to publish the source for it.

> If they do not wish this or wish to cooperate with this procedure, you 
> can vote with your wallet; don't buy their systems.

This thread is about providing them with good guidelines they can follow 
_before_ they make bad decisions, most of the time out of ignorance 
rather than malice, about their firmware implementation.

> In the case of a real OpenFirmware implementation it is ridiculously
> easy to either patch the device tree in the firmware (load a Forth
> script - I can point at two examples for this) or do it in the kernel
> via CIF.
> 
> In the case of other bootloaders like U-Boot, libfdt provides the
> ability to modify and insert loaded device trees to match (in which
> case, the DTB bundled in the flash of some board is just a starting
> point).
> 
> The worst case scenario is that it would be completely hosed, and in
> this case an appended (or overridden by loading from filesystem or
> other flash location) DTB is the solution - just like you can load
> ACPI tables for some systems where the vendor shipped version is
> totally broken.

Sure.  But that's not what "best practices for hardware shipping device 
trees" should be about.  Working around a broken one is always possible, 
but if we pass the message to OEMs that we're happy to paper over their 
mistakes with a side channel they might decide not to care about 
providing a method allowing the unavoidable mistakes to be fixed at its 
source.

We want the DTB to live with the firmware or bootloader, and the ability 
to fix a broken DTB at that level.  That's all.


Nicolas
