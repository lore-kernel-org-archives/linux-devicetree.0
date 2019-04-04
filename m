Return-Path: <SRS0=Z6F2=SG=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190319134851.10420-1-ckeepax@opensource.cirrus.com> <20190319134851.10420-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190319134851.10420-2-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 12:10:22 +0700
Message-ID: <CACRpkdbx80oykN9ByAu-oqueTfQpjvumwc8ChqXWjxNonZJ-9Q@mail.gmail.com>
Subject: Re: [PATCH v8 RESEND 2/2] pinctrl: lochnagar: Add support for the
 Cirrus Logic Lochnagar
Content-Type: text/plain; charset="UTF-8"
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 19, 2019 at 8:49 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
>
> Lochnagar provides many pins which can generally be used for an
> audio function such as an AIF or a PDM interface, but also as
> GPIOs.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
