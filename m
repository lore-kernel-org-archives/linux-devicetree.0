Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40726 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758051Ab3HHSed (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 8 Aug 2013 14:34:33 -0400
Message-ID: <5203E4B4.6080600@wwwdotorg.org>
Date: Thu, 08 Aug 2013 12:34:28 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru> <20130730162241.GA13634@quad.lixom.net> <51F7FEE5.1010608@wwwdotorg.org> <20130731155608.GR29859@e106331-lin.cambridge.arm.com> <1375786850.12043.22.camel@hornet> <20130807140702.GE28558@e106331-lin.cambridge.arm.com> <520271DC.2020006@wwwdotorg.org> <20130808091155.GD14648@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130808091155.GD14648@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <Pawel.Moll@arm.com>, Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/08/2013 03:11 AM, Mark Rutland wrote:
> On Wed, Aug 07, 2013 at 05:12:12PM +0100, Stephen Warren wrote:
>> On 08/07/2013 08:07 AM, Mark Rutland wrote:
>>> On Tue, Aug 06, 2013 at 12:00:50PM +0100, Pawel Moll wrote:
>>>> On Wed, 2013-07-31 at 16:56 +0100, Mark Rutland wrote:
>>>>>> Ah, I guess the question more: Do we want generic bindings that describe
>>>>>> the low-level details of the HW in a completely generic fashion so that
>>>>>> new HW can be supported with zero kernel changes, or do we want a simple
>>>>>> driver with a lookup table that maps from compatible value to the HW
>>>>>> configuration? One of the potential benefits of DT is to be able to
>>>>>> support new HW without code changes, although perhaps that's more
>>>>>> typically considered in the context of new boards rather than new IP
>>>>>> blocks or SoCs.
>>>>
>>>> ... or FPGAs that can be synthesized with random collection of standard
>>>> IP blocks. With Xilinx's Zynq and Altera's SOCFPGA this is getting
>>>> simpler and simpler...
>>>>
>>>>> I think that going forward it would be better to have have a compatible
>>>>> string per different device. As Olof pointed out, we're leaking the way
>>>>> we currently handle things in Linux into the binding, rather than
>>>>> precisely describing the hardware (with a unique compatible string). I'm
>>>>> not sure if this is much better than embedding a bytecode describing how
>>>>> to poke devices.
>>
>> This really isn't leaking information about how Linux handles the
>> device. It's simply saying that there is a GPIO controller whose HW is
>> able to be described by a simple/generic binding, and that binding
>> provides full details of the register layout. Other OSs can handle this
>> differently; see below ...
> 
> I worry that it doesn't provide a full description, but rather a
> description of the subset of the hardware used by the driver.

I don't see that as a problem.

A particular DT file provides a description of an interface to HW. To my
mind, if that particular DT doesn't describe everything about a
particular HW module (e.g. some advanced feature can't be enabled),
that's basically equivalent to not describing aspect of the board/system
(so e.g. some I2C device isn't represented at all, and hence some
temperature probe can't be monitored).

I think both the simple(!) simple-gpio interface to HW, and the more
complex tegra20-gpio interface are both equally valid interfaces; they
simply allow a different set of features to be accessed.

>> ...
>>>> Frankly speaking I don't know where to draw the line, but I feel that in
>>>> this particular case - a "generic" GPIO binding - is worth the effort.
>>>> SOCs are literally littered with control registers driving random bits.
>>>> My favourite example - Versatile Express ;-) - have random registers
>>>> representing things like LEDs or MMC status lines. Depending on the
>>>> motherboard/FPGA version they can live in different places. And yes, I
>>>> can have a Versatile Express "platform" driver registering different set
>>>> of them depending on the particular variant of the FPGA bitfile. Or try
>>>> to represent them in the tree...
>>>
>>> I worry that going down that route encourages bindings to describe a
>>> single way to use a given device, rather than describing the device
>>> itself and allowing the OS to decide how to use it. This limits what we
>>> can do in future, and I worry about how we can handle quirks sanely if
>>> we describe devices in this way.
>>
>> Well, each DT node that uses this binding must still have a compatible
>> property that fully defines the exact instance of the HW. In other
>> words, assuming this binding worked fine for Tegra, the DT must contain:
>>
>> compatible = "nvidia,tegra20-gpio", "simple-gpio";
>>
>> and not just:
>>
>> compatible = "simple-gpio";
>>
>> In that case, an OS could choose to match on "nvidia,tegra20-gpio" and
>> ignore most of the other properties to instantiate a more "custom"
>> driver, or to enable HW-specific quirks.
> 
> In that case, does the "nvidia,tegra20-gpio" require any extra reg
> fields for registers not used by the "simple-gpio" binding? If peopel
> are given a shortcut, I don't see why they'd bother to describe the
> hardware they're not using.

Do you mean entries in the reg field itself, or the various
dat/set/clr/... properties that describe the register layout?

I would expect the reg property for a DT node to be entirely complete in
all cases, even if writing a simple-gpio node when the HW could instead
be later described as a tegra20-gpio node. In other words, if the GPIO
HW block has 2 sets of disjoint registers, then the DT should include
those both in reg even if features accessible through the simple-gpio
view don't need the second bank.

Re: dat/set/clr/... - yes, I imagine the whole point of later switching
to a more specific binding would be to enable more features, which would
likely in turn require the use of more registers. However, I would
expect the tegra20-gpio binding to embody the specific set of registers
that are present in HW. In other words, the simple-gpio binding would
require dat/set/clr/... properties and drivers would solely use those to
know how to access the various registers. However, use of the more
specific tegra20-gpio interface would entail the user having pre-defined
explicit knowledge of the register layout, and hence it would entirely
ignore dat/set/clr/... properties, and use its own built-in layout
knowledge.

> What about the case where some mfd IP block can act as a gpio
> controller, compatible with simple-gpio, and also provides some other
> functionality requiring a separate driver? I suspect people will
> describe this as two devices, mirroring the Linux driver model, rather
> than describing the hardware itself.

Are the GPIO registers truly an entirely separate HW block? If so,
simple-gpio v.s. something else shouldn't matter.

If the GPIO registers are co-mingled with other features, then I think
that it'd be legal for the DT to contain either:

a)

Just a simple-gpio block. The other features would not be available.

b)

A more precise compatible value, thus allowing SW to expose all the
features.

The one issue here is that perhaps we could never "re-purpose" a plain
simple-gpio node simply by binding a different driver to it; all the
other properties could be missing. As such, perhaps when using
simple-gpio we shouldn't actually include the more precise entry in the
compatible property.

The possible solutions would be:

a) Very carefully craft every GPIO-related binding so that all
properties beyond what simple-gpio provides were optional, and hence a
pure simple-gpio node would work fine with the more complex driver. This
could be difficult.

b) Make sure that the DT already contained the union of the properties
required by simple-gpio and the more complex binding from the start. In
this case, there might not be much point doing simple-gpio; just use the
more advanced binding from the start.

I guess this boils down to: When an old DT is used with a new kernel, is
the minimum expectation that all previous functionality will still
operate correctly, *or* that no DT changes are required to enable any
new functionality that the new kernel could provide on that hardware?

I'd tend to lean towards new kernels maintaining at least old
functionality, rather than requiring that no DT changes are required to
enable new functionality.

> As I see it, a "simple-gpio" compatible string says "I can be driven by
> the Linux simple-gpio driver", and the rest of the description is a
> reflection of the structure of the simple-gpio driver rather than the
> device.

