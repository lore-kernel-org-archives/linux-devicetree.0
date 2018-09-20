Return-Path: <SRS0=0HR7=MC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:41225 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbeITWMT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Sep 2018 18:12:19 -0400
Received: by mail-io1-f68.google.com with SMTP id q4-v6so8041228iob.8
        for <devicetree@vger.kernel.org>; Thu, 20 Sep 2018 09:28:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACRpkda3seU8adWOT6FR=JUgzrSYnOwynoe2sSFJ-ysf8cwwBQ@mail.gmail.com>
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
 <CAMRc=Mce5hRtD5kydWjiHSv0-po7PcHmK6AtCTzgvqaPYjP-Jw@mail.gmail.com> <CACRpkda3seU8adWOT6FR=JUgzrSYnOwynoe2sSFJ-ysf8cwwBQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Sep 2018 18:28:01 +0200
Message-ID: <CAMRc=MfybdDCf4ZGEPMkLvKMRX=5y+vdRHv2S_U1vUBfqjuMiA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mockup: Allow probing from device tree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vincent Whitchurch <vincent.whitchurch@axis.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

2018-09-10 9:05 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Sep 6, 2018 at 6:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> 2018-09-05 15:26 GMT+02:00 Vincent Whitchurch <vincent.whitchurch@axis.com>:
>
>> > +               ret = of_property_read_u32(node, "nr-gpios", &nr_gpios);
>>
>> In addition to what Linus already said: I think this is a good moment
>> to get rid of the platform data structure and instead use device
>> properties, what do you think?
>
> If you're thinking of fwnode that will not work with static platform devices
> (such as add with board files or other random platform_device_register() etc)
> The fwnode concept only works with DT and ACPI.
>

I was thinking about using generic device properties: add property
entries with platform_device_add_properties() and read them with
device_property_read_*() functions. Is there any reason this wouldn't
work?

Bart
