Return-Path: <devicetree-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([212.209.106.2]:3544 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758153Ab3GYXGL convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Thu, 25 Jul 2013 19:06:11 -0400
From: "Bird, Tim" <Tim.Bird@sonymobile.com>
Date: Fri, 26 Jul 2013 00:56:07 +0200
Subject: RE: pinctrl and device-tree support in qcom drivers
Message-ID: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250CA@seldmbx01.corpusers.net>
References: <E12ED16DF2DF754897A674F2B0E8F6C446AFF250C9@seldmbx01.corpusers.net>,<CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
In-Reply-To: <CACRpkdZgyP1547td+XfjaUJXPEWjzTPyDV2BSjBBkWSSqYYJCQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?=22Andersson=2C_Bj=F6rn=22?= <Bjorn.Andersson@sonymobile.com>, David Brown <davidb@codeaurora.org>, hanumant <hanumant@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Thursday, July 25, 2013 3:00 PM, Linus Walleij [linus.walleij@linaro.org] wrote:
>
>On Thu, Jul 25, 2013 at 11:30 PM, Bird, Tim <Tim.Bird@sonymobile.com> wrote:
>
>>  Qualcomm is just beginning to push
>> some pinctrl support based on device tree, for their later SOCs,
>> to mainline.
>
>I guess you're referring to this:
>http://marc.info/?l=linux-kernel&m=137470211220414&w=2
>(Hanumant please include Tim & Bjorn on future postings.)

That's exactly right.

>> My question is this - are all new drivers in mainline expected
>> to be based on pinctrl?
>
>Depends on what you mean by that, we certainly do not
>allow any more nasty hacks under arch/arm/* or any
>custom extenstions to GPIO drivers or such.

What if the driver handles the pins directly itself?  That
makes the driver platform-specific.  Is this disallowed now,
or are platform-specific drivers OK?

>> The qcom support looks like its in its
>> early stages, and I'm not sure I have the bandwidth to work on
>> it, as a precursor to working on the Sony drivers.
>
>Hanumant is working on it I believe, I haven't had time
>to review the latest iterations so I don't have a TPS
>report on the state and progress as of now ...

:-)  I am all out of TPS cover sheets myself...

>> It appears that I could submit a device-tree based driver
>> for the Sony hardware, by adding some support for
>> device tree to the qcom i2c driver, and then adding the device
>> tree support for the sony driver.  But does this lead me into
>> a dead end in mainline?  Will I just have to re-write it later
>> to base it on pinctrl?
>
>I don't know which driver you are talking about here...
>it seems you are referring to drivers which are dependent
>on some kind of pin control handle?
>
>Surely, if the I2C driver or so has its pins set up correctly
>already at boot or some legacy code that is already
>upstream, fine. But expanding and using the legacy
>pin control solutions is not encouraged (by me).

There is some out-of-tree code called i2c-qup.c, that is
sort-of device tree aware now, that the Sony code is based 
on now.  The Sony driver I'm looking to contribute is for
a vibrator module on an i2c bus (it's device tree configuration
should be trivial.)

>The proper pin control framework will grab a "default"
>state for the pins when the device (such as I2C) is
>probed, making it usable. It's mainly a problem with
>dynamic states later on.
>
>> Or am I missing something?  Maybe the migration to the
>> pinctrl-based stuff will be trivial once qcom re-implements
>> their i2c dirver based on pinctrl - but I've currently got no timeline
>> for when that might occur.
>
>Are they calling a lot of custom APIs for this? The device
>core will take care of making it usable, it's mainly the
>runtime PM aspects that will require drivers to be
>pinctrl aware at all. Or some esoteric stuff like
>muxing the I2C block across two sets of pins.

I don't think there's anything tricky here.  I'm willing to
do some legwork to get the i2c-qup driver working with
device tree.  Right now it does a lot of pin handling internally
itself (I believe it brings up the needed gpios, functions, etc.
from boot state).

My question is whether I should just do that, or if the pinctrl
support for these pins is required first, in order to mainline the
Sony vibrator driver.

Thanks,
 -- Tim

Senior Software Engineer, Sony Mobile
