Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:52445 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755865Ab3G3R7F (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 13:59:05 -0400
Message-ID: <51F7FEE5.1010608@wwwdotorg.org>
Date: Tue, 30 Jul 2013 11:59:01 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru> <20130730162241.GA13634@quad.lixom.net>
In-Reply-To: <20130730162241.GA13634@quad.lixom.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Alexander Shiyan <shc_work@mail.ru>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 07/30/2013 10:22 AM, Olof Johansson wrote:
> On Tue, Jul 30, 2013 at 03:18:35PM +0400, Alexander Shiyan wrote:
>> This patch adds DT support for generic (MMIO) GPIO driver.

>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-generic.txt b/Documentation/devicetree/bindings/gpio/gpio-generic.txt

>> +Generic memory-mapped GPIO controller
>> +
>> +Required properties:
>> +- compatible: Should be "basic-mmio-gpio" or "basic-mmio-gpio-be".

I think naming this "simple-gpio" would match other simple/basic/generic
bindings better.

>> +- reg: Physical base GPIO controller registers location and length.
>> +- reg-names: Should be the names of reg resources. Each register uses
>> +  its own reg name, so there should be as many reg names as referenced
>> +  registers:
>> +  "dat"		: Input/output register (Required),
>> +  "set"		: Register for set output bits (Optional),
>> +  "clr"		: Register for clear output bits (Optional),
>> +  "dirout"	: Register for setup direction as output (Optional),
>> +  "dirin"	: Register for setup direction as input (Optional).
>> +- gpio-controller: Marks the device node as a gpio controller.
>> +- #gpio-cells: Should be two.
...
> 
> I'm trying to figure out what to say about this binding. It's not really
> describing hardware, instead it's strongly tied to how the basic-mmio-gpio
> driver expects the platform data to look.

I'm not sure; the binding seems to only contain a direct representation
of pure HW properties; the addresses/offsets of various registers in the
HW block.

> It makes more sense to actually describe the hardware in question,
> and then have the driver handle that as expected. I.e. either have a
> small conversion layer that binds to the actual hardware compatible
> value and registers a basic-mmio-gpio device from there, or extend the
> basic-mmio-gpio driver to do it by itself.

Ah, I guess the question more: Do we want generic bindings that describe
the low-level details of the HW in a completely generic fashion so that
new HW can be supported with zero kernel changes, or do we want a simple
driver with a lookup table that maps from compatible value to the HW
configuration? One of the potential benefits of DT is to be able to
support new HW without code changes, although perhaps that's more
typically considered in the context of new boards rather than new IP
blocks or SoCs.

If we reject this driver, we surely have to get rid of pinctrl-single,
and perhaps some others?
