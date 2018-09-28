Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42985 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbeI1TrN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Sep 2018 15:47:13 -0400
Received: by mail-qt1-f196.google.com with SMTP id z8-v6so6528853qto.9
        for <devicetree@vger.kernel.org>; Fri, 28 Sep 2018 06:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20180925143220.19007-1-linus.walleij@linaro.org> <20180928131809.GJ20825@sirena.org.uk>
In-Reply-To: <20180928131809.GJ20825@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Sep 2018 15:23:15 +0200
Message-ID: <CACRpkdbMSDONQSsga8MkbqCtMuuXng_gX9TD_RJHxekgn0Zfgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: Add a DT binding for high-impedance turn-around
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi <linux-spi@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 28, 2018 at 3:18 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 25, 2018 at 04:32:19PM +0200, Linus Walleij wrote:
> > Some 3WIRE SPI devices require the host to insert a
> > "high-impedance turn-around" essentially a clock pulse after
> > switching the one line from output to input.
>
> > +- spi-3wire-high-impedance-turn-around - Empty property indicating that a
> > +                 3wire host need to insert a high-impedance turn-around
> > +                 clock cycle after turning the one output line into an
> > +                 input line.
>
> Should this not be a flag set through the API rather than a DT property?
> It doesn't look like something that's per system configurable but rather
> something that the device is always going to need to do so every single
> usage of the device is going to need this property.

Good point. Let me take it for a spin using some flag inside Linux
instead and see if it looks better.

Yours,
Linus Walleij
