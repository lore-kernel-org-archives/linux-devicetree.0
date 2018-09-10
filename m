Return-Path: <SRS0=auRG=LY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-io1-f65.google.com ([209.85.166.65]:39252 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbeIJL6f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Sep 2018 07:58:35 -0400
Received: by mail-io1-f65.google.com with SMTP id l7-v6so6175094iok.6
        for <devicetree@vger.kernel.org>; Mon, 10 Sep 2018 00:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180905132618.31274-1-vincent.whitchurch@axis.com> <CAMRc=Mce5hRtD5kydWjiHSv0-po7PcHmK6AtCTzgvqaPYjP-Jw@mail.gmail.com>
In-Reply-To: <CAMRc=Mce5hRtD5kydWjiHSv0-po7PcHmK6AtCTzgvqaPYjP-Jw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Sep 2018 09:05:50 +0200
Message-ID: <CACRpkda3seU8adWOT6FR=JUgzrSYnOwynoe2sSFJ-ysf8cwwBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mockup: Allow probing from device tree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: vincent.whitchurch@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 6, 2018 at 6:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2018-09-05 15:26 GMT+02:00 Vincent Whitchurch <vincent.whitchurch@axis.com>:

> > +               ret = of_property_read_u32(node, "nr-gpios", &nr_gpios);
>
> In addition to what Linus already said: I think this is a good moment
> to get rid of the platform data structure and instead use device
> properties, what do you think?

If you're thinking of fwnode that will not work with static platform devices
(such as add with board files or other random platform_device_register() etc)
The fwnode concept only works with DT and ACPI.

Yours,
Linus Walleij
