Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:59163 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932342Ab3GZWrp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 18:47:45 -0400
Received: by mail-oa0-f49.google.com with SMTP id n12so8584682oag.8
        for <devicetree@vger.kernel.org>; Fri, 26 Jul 2013 15:47:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>
	<CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
	<E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>
Date: Sat, 27 Jul 2013 00:47:44 +0200
Message-ID: <CACRpkdam_ao_HtUaiHg0N6fHPk1Bv5F+bJNrvc8wxT9t5VQiRg@mail.gmail.com>
Subject: Re: pinctrl and device-tree support in qcom drivers
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?ISO-8859-1?Q?Andersson=2C_Bj=F6rn?= <Bjorn.Andersson@sonymobile.com>, David Brown <davidb@codeaurora.org>, hanumant <hanumant@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 26, 2013 at 12:56 AM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
> On Thursday, July 25, 2013 3:00 PM, Linus Walleij [linus.walleij@linaro.org] wrote:

>>> My question is this - are all new drivers in mainline expected
>>> to be based on pinctrl?
>>
>>Depends on what you mean by that, we certainly do not
>>allow any more nasty hacks under arch/arm/* or any
>>custom extenstions to GPIO drivers or such.
>
> What if the driver handles the pins directly itself?  That
> makes the driver platform-specific.  Is this disallowed now,
> or are platform-specific drivers OK?

How can a driver handle its pins "directly itself"? To me
that sounds like it need to be calling a custom API unless the
registers are grouped together with that very hardware it's
driving (which is very uncommon).

I.e. how would it get a handle to go poking the apropriate
pin control registers...

The right API to do that is invariably <linux/pinctrl/consumer.h>
or implicitly by defining a "default" state which will make it
configure into that state during probe() for this struct device *.

>>Surely, if the I2C driver or so has its pins set up correctly
>>already at boot or some legacy code that is already
>>upstream, fine. But expanding and using the legacy
>>pin control solutions is not encouraged (by me).
>
> There is some out-of-tree code called i2c-qup.c, that is
> sort-of device tree aware now, that the Sony code is based
> on now.  The Sony driver I'm looking to contribute is for
> a vibrator module on an i2c bus (it's device tree configuration
> should be trivial.)

I don't know if I really want to see said code, but if it's not
using pinctrl it's probably a NACK from my side on that
thing.

> I don't think there's anything tricky here.  I'm willing to
> do some legwork to get the i2c-qup driver working with
> device tree.  Right now it does a lot of pin handling internally
> itself (I believe it brings up the needed gpios, functions, etc.
> from boot state).
>
> My question is whether I should just do that, or if the pinctrl
> support for these pins is required first, in order to mainline the
> Sony vibrator driver.

If this code is controlling pin registers but not using the
pinctrl subsystem, then don't spend time on trying to mainline
it IMO.

Yours,
Linus Walleij
