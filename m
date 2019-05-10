From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v5 0/6] Add drive-strength in Meson pinctrl driver
Date: Fri, 10 May 2019 10:23:18 +0200
Message-ID: <20190510082324.21181-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-microamp". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v4:
- fix dt-binding documentation
- rename drive-strength-uA to drive-strength-microamp in coverletter

Changes since v3:
- remove dev_err in meson_get_drive_strength
- cleanup code

Changes since v2:
- rename driver-strength-uA property to drive-strength-microamp
- rework patch series for better understanding
- rework set_bias function

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (6):
  dt-bindings: pinctrl: add a 'drive-strength-microamp' property
  pinctrl: generic: add new 'drive-strength-microamp' property support
  dt-bindings: pinctrl: meson: Add drive-strength-microamp property
  pinctrl: meson: Rework enable/disable bias part
  pinctrl: meson: add support of drive-strength-microamp
  pinctrl: meson: g12a: add DS bank value

 .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.17.1
