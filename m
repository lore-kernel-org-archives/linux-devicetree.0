Return-Path: <SRS0=dKdi=SG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45585 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfDDFUI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Apr 2019 01:20:08 -0400
Received: by mail-lf1-f67.google.com with SMTP id 5so754287lft.12
        for <devicetree@vger.kernel.org>; Wed, 03 Apr 2019 22:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be>
 <20190321092145.14896-3-geert+renesas@glider.be> <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
In-Reply-To: <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 12:19:55 +0700
Message-ID: <CACRpkdbYD7UAY+sMOOi0kvKmkRzYUHHudBLy19aLsJsgsXpEBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca953x: Add support for CAT9554
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 4, 2019 at 12:19 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Mar 21, 2019 at 4:21 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> > with 8 GPIOs and interrupt functionality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Split DT binding doc and driver update in separate patches.
>
> Patch applied.

Ooops sorry I see Bartosz applied it, backed this out.

Yours,
Linus Walleij
