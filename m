Return-Path: <SRS0=nV3H=HT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180422105330.4712-4-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com> <20180422105330.4712-4-martin.blumenstingl@googlemail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 10:55:32 +0200
Message-ID: <CACRpkdbqvq4gp58F39VeHRFdwU+O7tDUBu7L_Vg7+ZKjUy2Vtw@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: meson: meson8: add the RGMII RXD2/RXD3 and
 TXD2/TXD3 signals
Content-Type: text/plain; charset="UTF-8"
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Apr 22, 2018 at 12:53 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> These are only available on the Meson8m2 SoC (which uses the same
> DesignWare Ethernet MAC as Meson8b).
> The "eth_tx_clk_50m" signal either provides a 50MHz clock for the RMII
> PHYs or the RGMII TX clock (as far as we know the frequency is
> controlled by the PRG_ETHERNET registers in the Ethernet MAC "glue" IP
> block).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied with Kevin's ACK.

Yours,
Linus Walleij
