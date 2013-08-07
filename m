Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:58496 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756979Ab3HGQMR (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 12:12:17 -0400
Message-ID: <520271DC.2020006@wwwdotorg.org>
Date: Wed, 07 Aug 2013 10:12:12 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru> <20130730162241.GA13634@quad.lixom.net> <51F7FEE5.1010608@wwwdotorg.org> <20130731155608.GR29859@e106331-lin.cambridge.arm.com> <1375786850.12043.22.camel@hornet> <20130807140702.GE28558@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130807140702.GE28558@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <Pawel.Moll@arm.com>, Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/07/2013 08:07 AM, Mark Rutland wrote:
> On Tue, Aug 06, 2013 at 12:00:50PM +0100, Pawel Moll wrote:
>> On Wed, 2013-07-31 at 16:56 +0100, Mark Rutland wrote:
>>>> Ah, I guess the question more: Do we want generic bindings that describe
>>>> the low-level details of the HW in a completely generic fashion so that
>>>> new HW can be supported with zero kernel changes, or do we want a simple
>>>> driver with a lookup table that maps from compatible value to the HW
>>>> configuration? One of the potential benefits of DT is to be able to
>>>> support new HW without code changes, although perhaps that's more
>>>> typically considered in the context of new boards rather than new IP
>>>> blocks or SoCs.
>>
>> ... or FPGAs that can be synthesized with random collection of standard
>> IP blocks. With Xilinx's Zynq and Altera's SOCFPGA this is getting
>> simpler and simpler...
>>
>>> I think that going forward it would be better to have have a compatible
>>> string per different device. As Olof pointed out, we're leaking the way
>>> we currently handle things in Linux into the binding, rather than
>>> precisely describing the hardware (with a unique compatible string). I'm
>>> not sure if this is much better than embedding a bytecode describing how
>>> to poke devices.

This really isn't leaking information about how Linux handles the
device. It's simply saying that there is a GPIO controller whose HW is
able to be described by a simple/generic binding, and that binding
provides full details of the register layout. Other OSs can handle this
differently; see below ...

...
>> Frankly speaking I don't know where to draw the line, but I feel that in
>> this particular case - a "generic" GPIO binding - is worth the effort.
>> SOCs are literally littered with control registers driving random bits.
>> My favourite example - Versatile Express ;-) - have random registers
>> representing things like LEDs or MMC status lines. Depending on the
>> motherboard/FPGA version they can live in different places. And yes, I
>> can have a Versatile Express "platform" driver registering different set
>> of them depending on the particular variant of the FPGA bitfile. Or try
>> to represent them in the tree...
> 
> I worry that going down that route encourages bindings to describe a
> single way to use a given device, rather than describing the device
> itself and allowing the OS to decide how to use it. This limits what we
> can do in future, and I worry about how we can handle quirks sanely if
> we describe devices in this way.

Well, each DT node that uses this binding must still have a compatible
property that fully defines the exact instance of the HW. In other
words, assuming this binding worked fine for Tegra, the DT must contain:

compatible = "nvidia,tegra20-gpio", "simple-gpio";

and not just:

compatible = "simple-gpio";

In that case, an OS could choose to match on "nvidia,tegra20-gpio" and
ignore most of the other properties to instantiate a more "custom"
driver, or to enable HW-specific quirks.
