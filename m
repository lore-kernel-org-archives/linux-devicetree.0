Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56187 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab3IFTie (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2013 15:38:34 -0400
Message-ID: <522A2F36.8070605@wwwdotorg.org>
Date: Fri, 06 Sep 2013 13:38:30 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] dt: add a binding review checklist
References: <1378334532-21025-1-git-send-email-swarren@wwwdotorg.org> <20130905111918.GQ18206@e106331-lin.cambridge.arm.com> <20130906100902.13eb3c7a@skate> <52299CE1.7000007@gmail.com>
In-Reply-To: <52299CE1.7000007@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 09/06/2013 03:14 AM, Sebastian Hesselbarth wrote:
> On 09/06/13 10:09, Thomas Petazzoni wrote:
>> On Thu, 5 Sep 2013 12:19:18 +0100, Mark Rutland wrote:
>>> On Wed, Sep 04, 2013 at 11:42:12PM +0100, Stephen Warren wrote:
>>>> +Compatible Property
>>>> +-------------------
>>>> +
>>>> +A compatible value identifies a hardware module. It needs to
>>>> identify the
>>>> +vendor (e.g. NVIDIA), type or name of device (e.g. I2C), and
>>>> version of the
>>>> +device (e.g. an IP block version number or chip name). The
>>>> following formats
>>>> +of compatible value are acceptable:
>>>> +
>>>> +* ${vendor},${device}-${version} (e.g. ti,omap4-i2c)
>>>> +* ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
>>>> +* ${vendor},${device}-${version} (e.g. synopsis,dwc3)
> 
> BTW, the examples above look strange and rather should be
> 
> * ${vendor},${device}-${version} (e.g. ti,i2c-omap4)
> * ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
> * ${vendor},${device} (e.g. synopsis,dwc3)
> 
>>> It would be nice to make it clear that the compatible string for a
>>> device should (wherever possible) be the name of the specific IP block,
>>> which isn't completely clear above (e.g. "arm,pl011" is preferred to
>>> "arm,vexpress-v2m-serial"). It would be nice if we could avoid examples
>>> with SoC names for this reason.
>>>
>>> Obviously there will be SoC-specific devices that will have SoC names in
>>> their bindings. But those bindings should be considered carefully.
>>
>> I agree that it would be nice to make it clear that using the name of
>> an SoC family in the compatible string is not a good idea, and that
>> instead the name of the particular SoC that originally introduced the
>> IP block should be used. I.e nvidia,tegra20-i2c is fine, but
>> nvidia,tegra-i2c is not, because we have no idea what I2C controllers
>> will be used on future Tegra SoCs.
> 
> Speaking of "the particular SoC that originally introduced the IP
> block", do you mean physically first or supported first?

I think preferably whichever HW shipped (or was designed?) first that
contained the IP.

Certainly for HW where the community has developed the DT binding
without good visibility into the range of vendor HW, and without vendor
engagement during binding development, then picking the first chip that
a binding was written for would be about as good as we can do.

...
> Also, IP is reused so often and possibly over decades with minor
> improvements. Just take mv643xx_eth as an example, it was introduced
> as a up to 4 port ethernet ip in powerpc system controllers. Marvell
> decided to reuse it as 1 port ethernet ip in its Orion SoCs.

Port count (unless encoded into a separate DT property) sounds like
something that would require a separate compatible value, since the
driver needs some way to know how many ports are present.

...
> Is the compatibility just by the fact, that we look at the _current_
> _linux_ driver and see no difference - just because the driver ignored
> the differences for ages?

compatible should be based on the entire SW-visible interface to the HW.
The fact that one particular OS's driver didn't use some feature in the
HW and hence wasn't affected by a HW change between two HW versions does
not remove the need to give those two HW versions different compatible
values.

Put another way, if a (hypothetical) driver that used every feature of
HW version 1 to the full could work 100% successfully on HW version 2,
then those HW versions are compatible. HW version 2 can add new features
and still be compatible with HW version 1. HW version 2 cannot remove or
modify features (in a non-compatible and SW-/user-visible fashion) and
still be compatible.

When unsure, I suspect it's better to err on the side of adding new
compatible values rather than assuming compatibility of new HW versions
with old compatible values.
