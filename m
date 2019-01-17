From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] pinctrl: meson: g12a fixes
Date: Thu, 17 Jan 2019 11:23:12 +0100
Message-ID: <20190117102315.1833-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset fixes the initial pinctrl support added for th g12a SoC
family, which is mainly around the register regions claimed by the
driver.

Linus, would it possible for you to provide a tag with these changes to
Kevin ?

ATM, we can only use the devices for which the pinmux is already set by
the bootloader. Enabling the broken pinctrl driver could cause regressions
in kernelCI. Having a tag, would allow us to start using pinctrl on this
SoC in this cycle, w/o regression. It would be nice :)

Jerome

Jerome Brunet (2):
  dt-bindings: pinctrl: meson: update register descriptions
  pinctrl: meson: add optional region for drive strength

Xingyu Chen (1):
  pinctrl: meson: fix G12A ao pull registers base address

 .../bindings/pinctrl/meson,pinctrl.txt        | 10 ++++----
 drivers/pinctrl/meson/pinctrl-meson.c         | 24 ++++++++++++-------
 drivers/pinctrl/meson/pinctrl-meson.h         |  1 +
 3 files changed, 22 insertions(+), 13 deletions(-)

-- 
2.20.1
