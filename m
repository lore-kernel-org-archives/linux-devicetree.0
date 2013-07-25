Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:57405 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754001Ab3GYWAp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 25 Jul 2013 18:00:45 -0400
Received: by mail-ob0-f169.google.com with SMTP id up14so2825978obb.28
        for <devicetree@vger.kernel.org>; Thu, 25 Jul 2013 15:00:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>
Date: Fri, 26 Jul 2013 00:00:44 +0200
Message-ID: <CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
Subject: Re: pinctrl and device-tree support in qcom drivers
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: "Bird, Tim" <Tim.Bird@sonymobile.com>
Cc: devicetree@vger.kernel.org, Bjorn.Andersson@sonymobile.com, David Brown <davidb@codeaurora.org>, hanumant <hanumant@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 25, 2013 at 11:30 PM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:

>  Qualcomm is just beginning to push
> some pinctrl support based on device tree, for their later SOCs,
> to mainline.

I guess you're referring to this:
http://marc.info/?l=linux-kernel&m=137470211220414&w=2
(Hanumant please include Tim & Bjorn on future postings.)

> My question is this - are all new drivers in mainline expected
> to be based on pinctrl?

Depends on what you mean by that, we certainly do not
allow any more nasty hacks under arch/arm/* or any
custom extenstions to GPIO drivers or such.

> The qcom support looks like its in its
> early stages, and I'm not sure I have the bandwidth to work on
> it, as a precursor to working on the Sony drivers.

Hanumant is working on it I believe, I haven't had time
to review the latest iterations so I don't have a TPS
report on the state and progress as of now ...

> It appears that I could submit a device-tree based driver
> for the Sony hardware, by adding some support for
> device tree to the qcom i2c driver, and then adding the device
> tree support for the sony driver.  But does this lead me into
> a dead end in mainline?  Will I just have to re-write it later
> to base it on pinctrl?

I don't know which driver you are talking about here...
it seems you are referring to drivers which are dependent
on some kind of pin control handle?

Surely, if the I2C driver or so has its pins set up correctly
already at boot or some legacy code that is already
upstream, fine. But expanding and using the legacy
pin control solutions is not encouraged (by me).

The proper pin control framework will grab a "default"
state for the pins when the device (such as I2C) is
probed, making it usable. It's mainly a problem with
dynamic states later on.

> Or am I missing something?  Maybe the migration to the
> pinctrl-based stuff will be trivial once qcom re-implements
> their i2c dirver based on pinctrl - but I've currently got no timeline
> for when that might occur.

Are they calling a lot of custom APIs for this? The device
core will take care of making it usable, it's mainly the
runtime PM aspects that will require drivers to be
pinctrl aware at all. Or some esoteric stuff like
muxing the I2C block across two sets of pins.

Yours,
Linus Walleij
