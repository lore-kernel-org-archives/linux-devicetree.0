From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: meson-g12a: add pinctrl driver support
Date: Mon, 9 Jul 2018 15:35:40 +0200
Message-ID: <CACRpkdauMRnLpfiARG-BWkuJfArri68e9BYx56SCUxJaYWsYYA@mail.gmail.com>
References: <20180704224511.29350-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704224511.29350-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Carlo Caione <carlo@caione.org>, Beniamino Galvani <b.galvani@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 4, 2018 at 4:48 PM Yixun Lan <yixun.lan@amlogic.com> wrote:
>
> This patch series try to add pinctrl driver support for
> the Meson-G12A SoC.
>
>
> Yixun Lan (3):
>   documentation: Add compatibles for Amlogic Meson G12A pin controllers
>   dt-bindings: pinctrl: meson-g12a: document pin name
>   pinctrl: meson-g12a: add pinctrl driver support

Overall this looks good to me, could we get some review or ACKs
from Beniamino, Martin and/or Carlo as an indication that everything
seems all right before I apply the series?

Yours,
Linus Walleij
