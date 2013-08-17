Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:61504 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754681Ab3HQACM (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 16 Aug 2013 20:02:12 -0400
Received: by mail-oa0-f49.google.com with SMTP id n10so2996430oag.36
        for <devicetree@vger.kernel.org>; Fri, 16 Aug 2013 17:02:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376387195-27469-1-git-send-email-larsi@wh2.tu-dresden.de>
References: <1376387195-27469-1-git-send-email-larsi@wh2.tu-dresden.de>
Date: Sat, 17 Aug 2013 02:02:11 +0200
Message-ID: <CACRpkda=OLMXTOCowsv1CKxj5wXE_kOzM8YLBNLhTPh4dQ5e-A@mail.gmail.com>
Subject: Re: [PATCH v2] RFC: interrupt consistency check for OF GPIO IRQs
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Lars Poeschel <larsi@wh2.tu-dresden.de>
Cc: Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hi Lars,

On Tue, Aug 13, 2013 at 11:46 AM, Lars Poeschel <larsi@wh2.tu-dresden.de> wrote:

> From: Linus Walleij <linus.walleij@linaro.org>
>
> Currently the kernel is ambigously treating GPIOs and interrupts
> from a GPIO controller: GPIOs and interrupts are treated as
> orthogonal. This unfortunately makes it unclear how to actually
> retrieve and request a GPIO line or interrupt from a GPIO
> controller in the device tree probe path.

I took the liberty to take your tweaked V2 version of my patch,
tweak it a bit more (addressing some of Tomasz comments)
and re-submit, along with two patches making it do the trick
on my Nomadik test-system.

Yours,
Linus Walleij
