Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56981 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967927Ab3HIQbR (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 12:31:17 -0400
Message-ID: <52051950.50501@wwwdotorg.org>
Date: Fri, 09 Aug 2013 10:31:12 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru> <20130730162241.GA13634@quad.lixom.net> <51F7FEE5.1010608@wwwdotorg.org> <20130731155608.GR29859@e106331-lin.cambridge.arm.com> <1375786850.12043.22.camel@hornet> <20130807140702.GE28558@e106331-lin.cambridge.arm.com> <520271DC.2020006@wwwdotorg.org> <20130808091155.GD14648@e106331-lin.cambridge.arm.com> <5203E4B4.6080600@wwwdotorg.org> <20130809090938.GJ27325@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130809090938.GJ27325@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <Pawel.Moll@arm.com>, Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/09/2013 03:09 AM, Mark Rutland wrote:
> On Thu, Aug 08, 2013 at 07:34:28PM +0100, Stephen Warren wrote:
>> On 08/08/2013 03:11 AM, Mark Rutland wrote:
>>> On Wed, Aug 07, 2013 at 05:12:12PM +0100, Stephen Warren wrote:
>>>> On 08/07/2013 08:07 AM, Mark Rutland wrote:
>>>>> On Tue, Aug 06, 2013 at 12:00:50PM +0100, Pawel Moll wrote:
>>>>>> On Wed, 2013-07-31 at 16:56 +0100, Mark Rutland wrote:
>>>>>>>> Ah, I guess the question more: Do we want generic bindings that describe
>>>>>>>> the low-level details of the HW in a completely generic fashion so that
>>>>>>>> new HW can be supported with zero kernel changes, or do we want a simple
>>>>>>>> driver with a lookup table that maps from compatible value to the HW
>>>>>>>> configuration? One of the potential benefits of DT is to be able to
>>>>>>>> support new HW without code changes, although perhaps that's more
>>>>>>>> typically considered in the context of new boards rather than new IP
>>>>>>>> blocks or SoCs.
>>>>>>
>>>>>> ... or FPGAs that can be synthesized with random collection of standard
>>>>>> IP blocks. With Xilinx's Zynq and Altera's SOCFPGA this is getting
>>>>>> simpler and simpler...
>>>>>>
>>>>>>> I think that going forward it would be better to have have a compatible
>>>>>>> string per different device. As Olof pointed out, we're leaking the way
>>>>>>> we currently handle things in Linux into the binding, rather than
>>>>>>> precisely describing the hardware (with a unique compatible string). I'm
>>>>>>> not sure if this is much better than embedding a bytecode describing how
>>>>>>> to poke devices.
>>>>
>>>> This really isn't leaking information about how Linux handles the
>>>> device. It's simply saying that there is a GPIO controller whose HW is
>>>> able to be described by a simple/generic binding, and that binding
>>>> provides full details of the register layout. Other OSs can handle this
>>>> differently; see below ...
>>>
>>> I worry that it doesn't provide a full description, but rather a
>>> description of the subset of the hardware used by the driver.
>>
>> I don't see that as a problem.
>>
>> A particular DT file provides a description of an interface to HW. To my
>> mind, if that particular DT doesn't describe everything about a
>> particular HW module (e.g. some advanced feature can't be enabled),
>> that's basically equivalent to not describing aspect of the board/system
>> (so e.g. some I2C device isn't represented at all, and hence some
>> temperature probe can't be monitored).
> 
> My concern is simply that if people can get basic functionality with the
> generic driver they won't bother describing the details of the more
> specific binding, and you'll never be able to use the board with a
> better driver without having to modify the dt later.
> 
> I guess the question boils down to how much we care about that
> situation.

I personally think it's fine. If people only want to expose the basic
functionality and can do so with simple-gpio, I don't see any problem at
all with that. (Why should we care that a binding doesn't expose all
features of the device? I'm sure there are many undocumented features,
e.g. debug/backdoor, in HW that we don't even know exist and so don't
know aren't exposed by various bindings)

If someone later finds it useful to expose more functionality than is
sensible to expose through simple-gpio, then a HW-specific binding can
be added for that purpose, and the .dts file amended to use that.

The more I think about this, the more I think that simply having
disjoint simple and HW-specific bindings makes sense.

In that case, the new DT won't be compatible with an old kernel, but I
think that's reasonable, since it was explicitly changed to implement
new features.

I think we should resolve this aspect first before considering the
details. I'm curious what other DT maintainers and users think about
this topic?
