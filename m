Return-Path: <SRS0=nV3H=HT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180422105330.4712-2-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com> <20180422105330.4712-2-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 10:52:46 +0200
Message-ID: <CACRpkdZt7kj0FBRfBqgmxYVMt4yiBPyVsvVdgyzgJGiiErdB=A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: meson: add support for the
 Meson8m2 SoC
Content-Type: text/plain; charset="UTF-8"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 22, 2018 at 12:53 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The Meson8m2 SoC is a variant of Meson8 with some updates from Meson8b
> (such as the Gigabit capable DesignWare MAC).
> It is mostly pin compatible with Meson8, only 10 (existing) CBUS pins
> get an additional function (four of these are Ethernet RXD2, RXD3, TXD2
> and TXD3 which are required when the board uses an RGMII PHY).
> The AOBUS pins seem to be identical on Meson8 and Meson8m2.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Rob's and Kevin's ACKs.

Yours,
Linus Walleij
