Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:36387 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755734Ab3HWSiG (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 14:38:06 -0400
Received: by mail-oa0-f43.google.com with SMTP id i10so1189958oag.16
        for <devicetree@vger.kernel.org>; Fri, 23 Aug 2013 11:38:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52167A35.2010109@wwwdotorg.org>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de>
	<1507189.CRWvzVJqTV@flatron>
	<521548E3.6010703@wwwdotorg.org>
	<CACRpkdbVYfBS5L+0ejfbTBwPbD9HFB1kV8qnS7DdSydRccxDmg@mail.gmail.com>
	<52167A35.2010109@wwwdotorg.org>
Date: Fri, 23 Aug 2013 20:38:04 +0200
Message-ID: <CACRpkdYAjKhKC+Aaa4iQBXsJ46mgOta_SVztVyB=HZCGJD-b2g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 22, 2013 at 10:53 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 08/21/2013 05:27 PM, Linus Walleij wrote:
>> On Thu, Aug 22, 2013 at 1:10 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>> On Wednesday 21 of August 2013 15:38:54 Lars Poeschel wrote:
>>
>>>>> To solve this dilemma, perform an interrupt consistency check
>>>>> when adding a GPIO chip: if the chip is both gpio-controller and
>>>>> interrupt-controller, walk all children of the device tree,
>>>
>>> It seems a little odd to solve this only for DT. What about the non-DT case?
>>
>> DT is the hardware configuration system that lets you request
>> the same resource in two ways, i.e. it allows one and the same
>> node to be both gpio-controller and interrupt-controller, and
>> start handing out the same line as both GPIO and IRQ
>> independently.
>
> Huh? What stops systems using board files and platform data from having
> this issue?

It can't be stopped but I consider it a bug if they do, as the proper
way to handle such GPIO lines is the sequence:

request_gpio(gpio);
request_irq(gpio_to_irq(gpio));

But I was mainly contrasting against ACPI, where the problem appears
to not exist.

Yours,
Linus Walleij
