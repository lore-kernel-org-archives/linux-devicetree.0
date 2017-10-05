From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 7/8] pinctrl: meson-gx: TEST_N belongs to the AO controller
Date: Thu, 5 Oct 2017 13:44:15 +0200
Message-ID: <CACRpkdZ-Gc7O=2GEQDX42zHwXcF=karpW-D2LxSW-7+HL5rjBA@mail.gmail.com>
References: <20170920133927.17390-1-jbrunet@baylibre.com> <20170920133927.17390-8-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170920133927.17390-8-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 3:39 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On meson-gx platforms, TEST_N has been incorrectly declared in the EE
> controller while it belongs to AO controller.
>
> Move the pin to the appropriate controller
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij
