Return-Path: <devicetree-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:50509 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851Ab3HSROa (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 13:14:30 -0400
Message-ID: <52125271.404@linutronix.de>
Date: Mon, 19 Aug 2013 19:14:25 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] of: add vendor prefix for Mentor Graphics
References: <1376572427-17689-1-git-send-email-bigeasy@linutronix.de> <520EAD1D.2090802@wwwdotorg.org> <520F41F0.8080707@linutronix.de> <52123EAA.10507@wwwdotorg.org>
In-Reply-To: <52123EAA.10507@wwwdotorg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>, sergei.shtylyov@cogentembedded.com, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 08/19/2013 05:50 PM, Stephen Warren wrote:
>>>> arch/arm/boot/dts/am33xx.dtsi:375:					compatible = "mg,musbmhdrc";
>>>> arch/arm/boot/dts/am33xx.dtsi:430:					compatible = "mg,musbmhdrc";
>>>
>>>> arch/arm/boot/dts/dbx5x0.dtsi:181:				"mentor,musb";
>>>
>>> Should both be documented? Should the bindings for those devices be
>>> unified on one vendor prefix, with the old one perhaps still documented
>>> as deprecated depending on how long it's been around?
>>
>> I wasn't aware of the dbx5x0 mentor,usb binding. As far as the am33xx
>> is concerned, it has been prepared for the next merge window and can be
>> changed.
> 
> OK, changing it to mentor, seems simplest and most convenient then.

Okay.

>> However the mentor,usb binding isn't documented either.
> 
> Presumably you can just adjust this patch to document it.

Okay. That means if we stick to that hierarchy given my dbx5x0 (which
makes sense after thinking for a while) I'm going to shift my devices a
little to fit this. Once this is done I document it and post patches.

Sebastian
