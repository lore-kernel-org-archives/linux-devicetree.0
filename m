Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56724 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab3IFTtr (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 6 Sep 2013 15:49:47 -0400
Message-ID: <522A31D7.5030107@wwwdotorg.org>
Date: Fri, 06 Sep 2013 13:49:43 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] dt: add a binding review checklist
References: <1378334532-21025-1-git-send-email-swarren@wwwdotorg.org> <20130905111918.GQ18206@e106331-lin.cambridge.arm.com> <5228F91A.5060302@wwwdotorg.org> <20130906105053.GT18206@e106331-lin.cambridge.arm.com>
In-Reply-To: <20130906105053.GT18206@e106331-lin.cambridge.arm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 09/06/2013 04:50 AM, Mark Rutland wrote:
> On Thu, Sep 05, 2013 at 10:35:22PM +0100, Stephen Warren wrote:
>> On 09/05/2013 05:19 AM, Mark Rutland wrote:
>>> On Wed, Sep 04, 2013 at 11:42:12PM +0100, Stephen Warren wrote:

...
>>>> +Valid values for a vendor prefix are:
>>>> +
>>>> +* A short, yet not obscure or obfuscated, representation of the vendor's name,
>>>> +  in lower-case. Stock tickers may be used in lower-case.
>>>> +* The vendor's stock ticker, in upper-case.
>>>
>>> We've got plenty of stock ticker names in lower case. The only prefix I
>>> can see documented with any upper case part is "GEFanuc" (though "SUNW"
>>> is an obvious undocumented example...).
>>
>> Should we document what we hope to be standard procedure going forward,
>> or also write the document to encompass existing bindings? Perhaps we
>> just shouldn't mention upper-case stock tickers at all? I did because of
>> David's comments in:
>>
>> http://www.spinics.net/lists/devicetree/msg00097.html
> 
> I think the key point is that a string is stable once defined, I'm not
> sure the distinction between upper/lower case adds anything.

Should we just say that going forward, prefixes are lower-case then?

...
>>>> +Compatible Property
...
>> I guess I should expand upon the difference between the IP block
>> version, perhaps:
>>
>> nvidia,i2c-v1 # NV I2C IP block version 1
>>
>> and the "instance" version, perhaps:
>>
>> nvidia,i2c-tegra20 # That same thing, but when it's part of Tegra20 SoC.
>>
>> since I believe we're agreed that both should be present; the IP block
>> compatible value for a driver to bind against (typically), but the
>> "instance" value to allow quirks/WARs to be enabled if the SoC
>> integration causes some issue.
> 
> That sounds like a good idea. Ideally, a platform shouldn't require a
> SoC-specific compatible entry (or we're just distributing board file
> entries into each driver...).
> 
> What kind of quirks/differences are we handling currently with
> "instance" compatible strings?

I'm not actually aware of any, but I'm certainly not familiar enough
with every driver to guarantee that:-) This is just a rule that I've
seen discussed a few times.

Perhaps we should just drop the rule, and tell people to look at the
root node compatible value[1] if they need to quirk on some integration
issue.

[1] for on-SoC peripherals; for MFD components, presumably the root node
of the MFD device? I'm not sure how that works if a driver has no idea
whether the device is embedded into an SoC, or is in some external MMIO
peripheral, and hence has no idea which node to look at...

...
> For the above reasons, I think preferring the presence of ${X}-names in
> bindings for devices with more than one entry in some property list
> makes sense, but it needs to be dealt with on a case-by-case basis.

Well, given the future extensibility argument (that I didn't quote),
your statement above (that I did quote) implies we should always use
${X}-names going forward, since you never know that some future HW
revision won't add some extra potentially optional interrupts/..., and
hence all bindings should allow for multiple interrupts from the start.
