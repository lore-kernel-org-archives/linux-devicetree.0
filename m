Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56535 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826Ab3HSQAN (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 12:00:13 -0400
Message-ID: <52123EAA.10507@wwwdotorg.org>
Date: Mon, 19 Aug 2013 09:50:02 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] of: add vendor prefix for Mentor Graphics
References: <1376572427-17689-1-git-send-email-bigeasy@linutronix.de> <520EAD1D.2090802@wwwdotorg.org> <520F41F0.8080707@linutronix.de>
In-Reply-To: <520F41F0.8080707@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>, sergei.shtylyov@cogentembedded.com, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/17/2013 03:27 AM, Sebastian Andrzej Siewior wrote:
> On 08/17/2013 12:52 AM, Stephen Warren wrote:
>> On 08/15/2013 07:13 AM, Sebastian Andrzej Siewior wrote:
>>> This prefix is currently used for the musb driver.
>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>
>>> +mg	Mentor Graphics
>>
>> It's slightly short; I would have preferred "mentor" I think. but I
>> guess it's fine.
>>
>> I see that both values are already used though:
>>
>>> arch/arm/boot/dts/am33xx.dtsi:375:					compatible = "mg,musbmhdrc";
>>> arch/arm/boot/dts/am33xx.dtsi:430:					compatible = "mg,musbmhdrc";
>>
>>> arch/arm/boot/dts/dbx5x0.dtsi:181:				"mentor,musb";
>>
>> Should both be documented? Should the bindings for those devices be
>> unified on one vendor prefix, with the old one perhaps still documented
>> as deprecated depending on how long it's been around?
> 
> I wasn't aware of the dbx5x0 mentor,usb binding. As far as the am33xx
> is concerned, it has been prepared for the next merge window and can be
> changed.

OK, changing it to mentor, seems simplest and most convenient then.

> However the mentor,usb binding isn't documented either.

Presumably you can just adjust this patch to document it.

