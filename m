Return-Path: <SRS0=oGub=MD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:50648 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390076AbeIUVgF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Sep 2018 17:36:05 -0400
Received: by mail-it1-f194.google.com with SMTP id j81-v6so2449493ite.0
        for <devicetree@vger.kernel.org>; Fri, 21 Sep 2018 08:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180905132618.31274-1-vincent.whitchurch@axis.com>
 <CAMRc=Mce5hRtD5kydWjiHSv0-po7PcHmK6AtCTzgvqaPYjP-Jw@mail.gmail.com>
 <CACRpkda3seU8adWOT6FR=JUgzrSYnOwynoe2sSFJ-ysf8cwwBQ@mail.gmail.com> <CAMRc=MfybdDCf4ZGEPMkLvKMRX=5y+vdRHv2S_U1vUBfqjuMiA@mail.gmail.com>
In-Reply-To: <CAMRc=MfybdDCf4ZGEPMkLvKMRX=5y+vdRHv2S_U1vUBfqjuMiA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Sep 2018 08:46:24 -0700
Message-ID: <CACRpkdbKC7tO2GCWDDebi3=cTdpx_rPRJm5xqBsxY3fdNWo7ew@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mockup: Allow probing from device tree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: vincent.whitchurch@axis.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 20, 2018 at 9:28 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2018-09-10 9:05 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> > On Thu, Sep 6, 2018 at 6:29 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >> 2018-09-05 15:26 GMT+02:00 Vincent Whitchurch <vincent.whitchurch@axis.com>:
> >
> >> > +               ret = of_property_read_u32(node, "nr-gpios", &nr_gpios);
> >>
> >> In addition to what Linus already said: I think this is a good moment
> >> to get rid of the platform data structure and instead use device
> >> properties, what do you think?
> >
> > If you're thinking of fwnode that will not work with static platform devices
> > (such as add with board files or other random platform_device_register() etc)
> > The fwnode concept only works with DT and ACPI.
>
> I was thinking about using generic device properties: add property
> entries with platform_device_add_properties() and read them with
> device_property_read_*() functions. Is there any reason this wouldn't
> work?

Oh I never used that. So I can't tell. It looks neat from a few
grep commands.

This occupies a space similar to fwnode in my perception so
I start to feel there are so many ways to do things now I get all
confused.

Yours,
Linus Walleij
