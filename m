Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-qa0-f51.google.com ([209.85.216.51]:40616 "EHLO
	mail-qa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320Ab3HTRCW (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 13:02:22 -0400
Received: by mail-qa0-f51.google.com with SMTP id f11so476605qae.10
        for <devicetree@vger.kernel.org>; Tue, 20 Aug 2013 10:02:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.03.1308200756400.14472@syhkavp.arg>
References: <20130814151345.GA2983@bill-the-cat>
	<520BB3E6.7000205@wwwdotorg.org>
	<20130814182502.GC2983@bill-the-cat>
	<alpine.LFD.2.03.1308142030020.14472@syhkavp.arg>
	<520C3840.4040309@ti.com>
	<alpine.LFD.2.03.1308142227050.14472@syhkavp.arg>
	<20130815235909.GA11437@voom.fritz.box>
	<alpine.LFD.2.03.1308152241410.14472@syhkavp.arg>
	<20130819001514.GA9098@voom.fritz.box>
	<alpine.LFD.2.03.1308191439530.14472@syhkavp.arg>
	<355F36F8-3C10-4D6D-AF5A-06080BF7AD5F@suse.de>
	<alpine.LFD.2.03.1308200756400.14472@syhkavp.arg>
Date: Tue, 20 Aug 2013 12:02:21 -0500
Message-ID: <CAHCPf3tz-2MZXEKLw3iMJ7b0fD7wKivbOn3ynk7+b6cNA6paqw@mail.gmail.com>
Subject: Re: [RFC] Best practices for hardware shipping device trees
From: Matt Sealey <neko@bakuhatsu.net>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Alexander Graf <agraf@suse.de>, Mark Rutland <Mark.Rutland@arm.com>, cross-distro@lists.linaro.org, Tom Rini <tom.rini@gmail.com>, Ian Campbell <ian.campbell@citrix.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, David Gibson <david@gibson.dropbear.id.au>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 7:02 AM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> On Tue, 20 Aug 2013, Alexander Graf wrote:
>
>
>> > And if your bootloader produces a bad DTB and you cannot let end users
>> > upgrade the bootloader then this is certainly against best practice.
>>
>> But that's exactly how everyone else works. On x86 you get your ACPI
>> tables from firmware, on PPC you get your device tree from firmware
>> and you really don't update your firmware just because your OS thinks
>> the tables are wrong.
>
> And everyone, except maybe yourself, despise that state of affair.
>
> Sorry but we ought to push for something better when we can.  As device
> tree is being established on ARM, now is the time to learn from past
> mistakes and break away from the broken legacy methods.

Well, provide support for real OpenFirmware or firmware-provided DTB,
and allow people to append DTBs to their kernels if they need to
update them.

The better state of affairs is that vendors who wish to support Linux
on the systems they ship would allow the firmware to be upgraded and
collaborate in the process. If they do not wish this or wish to
cooperate with this procedure, you can vote with your wallet; don't
buy their systems.

The idea that you could say "we accept some device trees but not all"
even if they follow standards at the time and the standards changed is
not going to fly, simply because what you're pushing is device trees,
and yes.. sometimes things change, and bindings move on, and they may
not be compatible.

In the case of a real OpenFirmware implementation it is ridiculously
easy to either patch the device tree in the firmware (load a Forth
script - I can point at two examples for this) or do it in the kernel
via CIF.

In the case of other bootloaders like U-Boot, libfdt provides the
ability to modify and insert loaded device trees to match (in which
case, the DTB bundled in the flash of some board is just a starting
point).

The worst case scenario is that it would be completely hosed, and in
this case an appended (or overridden by loading from filesystem or
other flash location) DTB is the solution - just like you can load
ACPI tables for some systems where the vendor shipped version is
totally broken.

There isn't a way around this, it's a fact of life in an imperfect
world. What you can do is keep Linux clean and move all device tree
modification/fixup crap to the vendor/bootloader responsibility where
it should be. If any of the above is not possible then it's going to
be incredibly difficult - to the point that insisting on complete
simplification and standardization of bootloader configurations and
"sanity" of device trees doesn't apply anyway. Sometimes vendors will
do what they want to do and not what you want to do; Linux no work,
and that is that.
