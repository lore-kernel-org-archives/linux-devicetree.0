Return-Path: <SRS0=nV3H=HT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180422105330.4712-3-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com> <20180422105330.4712-3-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 10:54:20 +0200
Message-ID: <CACRpkdb+tS_7B+k+Fir71EPavu-1iZOhYJb3aQ2xr2MMtfUwzQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: meson: meson8: add support for the Meson8m2 SoC
Content-Type: text/plain; charset="UTF-8"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 22, 2018 at 12:53 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Add Meson8m2 support to the existing Meson8 pinctrl driver. Since there
> are only very few changes (Meson8m2 has an extra signal on 10 CBUS pins,
> no other differences were found so far).
> Add the new compatible strings for Meson8m2 to the existing Meson8
> driver so we don't have to duplicate the whole driver.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
