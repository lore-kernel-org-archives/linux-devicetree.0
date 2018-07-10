From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 0/2] regulator: add new UniPhier regulator support
Date: Tue, 10 Jul 2018 10:27:15 +0900
Message-ID: <1531186037-16630-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

This series add new regulator controller support for UniPhier SoCs.
Currently this supports USB3 VBUS controller only. This USB3 VBUS belongs to
USB3 glue layer.

Changes since v1:
- dt-bindings: add description of glue layer
- replace read/write accesses with regmap_mmio
- rewrite a header with C++ comment style
- reuse soc_data for pxs2, ld20 and pxs3
- replace clk operations with clk_bulk
- move nclks and nrsts to soc_data

Kunihiko Hayashi (2):
  dt-bindings: regulator: add DT bindings for UniPhier regulator
  regulator: uniphier: add regulator driver for UniPhier SoC

 .../bindings/regulator/uniphier-regulator.txt      |  57 +++++
 drivers/regulator/Kconfig                          |   8 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/uniphier-regulator.c             | 247 +++++++++++++++++++++
 4 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/uniphier-regulator.txt
 create mode 100644 drivers/regulator/uniphier-regulator.c

-- 
2.7.4
