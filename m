From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v2 0/4]  Add drive-strength in Meson pinctrl driver
Date: Thu, 18 Apr 2019 14:47:54 +0200
Message-ID: <20190418124758.24022-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The purpose of this patchset is to add drive-strength support in meson pinconf
driver. This is a new feature that was added on the g12a. It is critical for us
to support this since many functions are failing with default pad drive-strength.

The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
'drive-strength' is expressed in mA.
So this patch add another generic property "drive-strength-uA". The change to do so
would be minimal and could be benefit to other platforms later on.

Cheers
Guillaume

Changes since v1:
- fix missing break
- implement new pinctrl generic property "drive-strength-uA"

[1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com

Guillaume La Roque (4):
  dt-bindings: pinctrl: add a 'drive-strength-uA' property
  pinctrl: generic: add new 'drive-strength-uA' property support
  dt-bindings: pinctrl: meson: Add drive-strength-uA property
  pinctrl: meson: add support of drive-strength-uA

 .../bindings/pinctrl/meson,pinctrl.txt        |   3 +
 .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
 drivers/pinctrl/meson/pinctrl-meson.c         | 166 ++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson.h         |  20 ++-
 drivers/pinctrl/pinconf-generic.c             |   2 +
 include/linux/pinctrl/pinconf-generic.h       |   3 +
 7 files changed, 174 insertions(+), 59 deletions(-)

-- 
2.17.1
