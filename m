Return-Path: <SRS0=Fqr3=HL=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] pinctrl: meson: add support for the Meson8m2 SoC
Date: Sun, 22 Apr 2018 12:53:27 +0200
Message-Id: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

The Meson8m2 SoC is a variant of Meson8 with some updates from Meson8b
(such as the Gigabit capable DesignWare MAC).
It is mostly pin compatible with Meson8, only 10 (existing) CBUS pins
get an additional function. Four of these are Ethernet RXD2, RXD3, TXD2
and TXD3 (GPIOZ_0..GPIOZ_3) which are required when the board uses an
RGMII PHY. GPIODV_24 and GPIODV_25 provide "VGA" support on Meson8,
which doesn't seem to be supported on Meson8m2 anymore.
The other 4 are GPIOH_9 (reg 3 bit 19), CARD_4 (reg 8 bit 8),
CARD_5 (reg 8 bit 7) and GPIOY_3 (reg 3 bit 11). Their function is
currently unknown.

The AOBUS pins seem to be identical on Meson8 and Meson8m2. However,
since there's no official documentation I decided to add a new compatible
string.


Martin Blumenstingl (3):
  dt-bindings: pinctrl: meson: add support for the Meson8m2 SoC
  pinctrl: meson: meson8: add support for the Meson8m2 SoC
  pinctrl: meson: meson8: add the RGMII RXD2/RXD3 and TXD2/TXD3 signals

 .../bindings/pinctrl/meson,pinctrl.txt        |  2 ++
 drivers/pinctrl/meson/pinctrl-meson8.c        | 23 +++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.17.0
