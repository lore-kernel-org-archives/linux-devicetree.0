Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:38484 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788Ab3IFJOO (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2013 05:14:14 -0400
Received: by mail-ea0-f173.google.com with SMTP id g10so1447715eak.32
        for <devicetree@vger.kernel.org>; Fri, 06 Sep 2013 02:14:13 -0700 (PDT)
Message-ID: <52299CE1.7000007@gmail.com>
Date: Fri, 06 Sep 2013 11:14:09 +0200
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [RFC PATCH] dt: add a binding review checklist
References: <1378334532-21025-1-git-send-email-swarren@wwwdotorg.org> <20130905111918.GQ18206@e106331-lin.cambridge.arm.com> <20130906100902.13eb3c7a@skate>
In-Reply-To: <20130906100902.13eb3c7a@skate>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 09/06/13 10:09, Thomas Petazzoni wrote:
> On Thu, 5 Sep 2013 12:19:18 +0100, Mark Rutland wrote:
 >> On Wed, Sep 04, 2013 at 11:42:12PM +0100, Stephen Warren wrote:
>>> +Compatible Property
>>> +-------------------
>>> +
>>> +A compatible value identifies a hardware module. It needs to identify the
>>> +vendor (e.g. NVIDIA), type or name of device (e.g. I2C), and version of the
>>> +device (e.g. an IP block version number or chip name). The following formats
>>> +of compatible value are acceptable:
>>> +
>>> +* ${vendor},${device}-${version} (e.g. ti,omap4-i2c)
>>> +* ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
>>> +* ${vendor},${device}-${version} (e.g. synopsis,dwc3)

BTW, the examples above look strange and rather should be

* ${vendor},${device}-${version} (e.g. ti,i2c-omap4)
* ${vendor},${version}-${device} (e.g. nvidia,tegra20-i2c)
* ${vendor},${device} (e.g. synopsis,dwc3)

>> It would be nice to make it clear that the compatible string for a
>> device should (wherever possible) be the name of the specific IP block,
>> which isn't completely clear above (e.g. "arm,pl011" is preferred to
>> "arm,vexpress-v2m-serial"). It would be nice if we could avoid examples
>> with SoC names for this reason.
>>
>> Obviously there will be SoC-specific devices that will have SoC names in
>> their bindings. But those bindings should be considered carefully.
>
> I agree that it would be nice to make it clear that using the name of
> an SoC family in the compatible string is not a good idea, and that
> instead the name of the particular SoC that originally introduced the
> IP block should be used. I.e nvidia,tegra20-i2c is fine, but
> nvidia,tegra-i2c is not, because we have no idea what I2C controllers
> will be used on future Tegra SoCs.

Speaking of "the particular SoC that originally introduced the IP
block", do you mean physically first or supported first?

Working on Armada 1500 support, there will be compatibles for
88de3100, while 88de3010 was (maybe) released before. It is just that
no one ever worked on that and I am not going to flip through hundreds
of LOC, just to find out which one was first.

Also, IP is reused so often and possibly over decades with minor
improvements. Just take mv643xx_eth as an example, it was introduced
as a up to 4 port ethernet ip in powerpc system controllers. Marvell
decided to reuse it as 1 port ethernet ip in its Orion SoCs.

Strictly speaking, you would have "marvell,kirkwood-eth", 
"marvell,mv64300-eth" (or was mv64360 first? ;-) ).
Or even "marvell,88f6281-eth", "marvell,mv64300-eth" because 88f6282
has fixed something you not know of, yet.
Or even "marvell,88f6281a0-eth" because A1 stepping... I think you get
the point.
Or should you rather drop "marvell,mv64300-eth" compatibility because
the ip has evolved enough to call it a different ip?

Is the compatibility just by the fact, that we look at the _current_
_linux_ driver and see no difference - just because the driver ignored
the differences for ages?

As a vendor it may be easy to find _the_ best compatible, for others
it's not. Unclear datasheets, weird numbering, hidden ip reuse, IMHO
this should be a really weak rule in any way.

Sebastian
