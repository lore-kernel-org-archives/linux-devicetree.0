From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/2] mtd: rawnand: meson: add Amlogic NAND driver support
Date: Wed, 13 Jun 2018 16:13:12 +0000
Message-ID: <20180613161314.14894-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: Yixun Lan <yixun.lan@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Liang Yang <liang.yang@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

  These two patches try to add initial NAND driver support for Amlogic Meson
SoCs, current it has been tested on GXL(p212) and AXG(s400) platform.

Liang Yang (2):
  dt-bindings: nand: meson: add Amlogic NAND controller driver
  mtd: rawnand: meson: add support for Amlogic NAND flash controller

 .../bindings/mtd/amlogic,meson-nand.txt       |  118 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    3 +
 drivers/mtd/nand/raw/meson_nand.c             | 1422 +++++++++++++++++
 4 files changed, 1551 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
 create mode 100644 drivers/mtd/nand/raw/meson_nand.c

-- 
2.17.1
