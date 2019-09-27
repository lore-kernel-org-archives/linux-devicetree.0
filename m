From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 0/5] LogiCVC mfd and GPIO support
Date: Fri, 27 Sep 2019 12:04:02 +0200
Message-ID: <20190927100407.1863293-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

This series introduces support for the LogiCVC GPIO block to the syscon GPIO
driver, with dt bindings documentation also including the top-level mfd
component.

Changes since v2:
- Fixed dt schema examples.

Changes since v1:
- Converted dt bindings documentation to dt schemas;
- Used BIT macro and removed version from structure name;
- Improved documentation example with gpio-line-names;
- Added vendor prefix to dt bindings;
- Added mfd component dt bindings documentation.

Cheers,

Paul


Paul Kocialkowski (5):
  dt-bindings: Add Xylon vendor prefix
  dt-bindings: mfd: Document the Xylon LogiCVC multi-function device
  gpio: syscon: Add support for a custom get operation
  dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
  gpio: syscon: Add support for the Xylon LogiCVC GPIOs

 .../bindings/gpio/xylon,logicvc-gpio.yaml     | 69 +++++++++++++++++
 .../bindings/mfd/xylon,logicvc.yaml           | 50 +++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpio/gpio-syscon.c                    | 75 ++++++++++++++++++-
 4 files changed, 193 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml

-- 
2.23.0
