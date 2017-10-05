From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/8] pinctrl: meson-gxbb: add missing GPIOX_22 pin
Date: Thu, 5 Oct 2017 13:45:26 +0200
Message-ID: <CACRpkdaiGrR3BOewWOK=VMPEe4QdVeSJVfP9jKi7-RKG9W95=A@mail.gmail.com>
References: <20170920133927.17390-1-jbrunet@baylibre.com> <20170920133927.17390-9-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170920133927.17390-9-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 3:39 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> GPIOX_22 is declared as a gpio but the id is no present in the pin
> table. This hole trigger an error while reading the pingroup debugfs entry
>
> GPIOX_22 is no routed externally. For all we know, it could an internal
> pin of SoC
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
