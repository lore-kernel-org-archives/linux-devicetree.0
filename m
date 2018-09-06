Return-Path: <SRS0=8xA8=LU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:39674 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbeIFOvv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Sep 2018 10:51:51 -0400
Received: by mail-it0-f67.google.com with SMTP id h1-v6so13424386itj.4
        for <devicetree@vger.kernel.org>; Thu, 06 Sep 2018 03:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180905132618.31274-1-vincent.whitchurch@axis.com> <20180905132618.31274-2-vincent.whitchurch@axis.com>
In-Reply-To: <20180905132618.31274-2-vincent.whitchurch@axis.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Sep 2018 12:16:54 +0200
Message-ID: <CACRpkdaOU+dumvVsrsjm5C=uo-cKLKqG2iwAwy=Xh9vbjq3UtQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: Add binding for gpio-mockup
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: vincent.whitchurch@axis.com, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>
List-ID: <devicetree@vger.kernel.org>

Hi Vincent, thanks for the patch!

Including Bartosz who is kind of default maintainer for this component.

On Wed, Sep 5, 2018 at 3:26 PM Vincent Whitchurch
<vincent.whitchurch@axis.com> wrote:
>
> This is a dummy GPIO controller which can be used in place of the real
> hardware GPIO controller (for example, an external GPIO expander) before
> actual hardware is available.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

This looks generally helpful. I don't know what the DT maintainers
think, but I am positive, I think rapid prototyping is a valid usecase.
We used to have the driver for testing only but this usecase is
just as valid.

> +Required properties:
> +- compatible: Should contain "gpio-mockup"
> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells : Should be two.  The first cell is the pin number and
> +  the second cell is used to specify the gpio polarity:
> +      0 = active high
> +      1 = active low
> +- nr-gpios: The number of dummy GPIOs

For this there is a standardized binding "ngpios" in gpio.txt
so just use that and reference gpio.txt please.

Yours,
Linus Walleij
