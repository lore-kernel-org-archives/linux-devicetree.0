From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 0/2] mtd: atmel_nand: remove compatible "atmel,sama5d4-nfc"
Date: Mon, 9 May 2016 14:51:17 +0800
Message-ID: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>, linux-arm-kernel@lists.infradead.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

It is a datasheet bug, for current SoCs, the RB_EDGE3(i.e. bit 27)
of HSMC_SR register does not exist, the RB_EDGE0 (i.e. bit 24) is
the ready/busy line edge status bit. So the compatible
"atmel,sama5d4-nfc" is unneeded.


Wenyou Yang (2):
  Revert "mtd: atmel_nand: Support variable RB_EDGE interrupts"
  ARM: at91/dt: use "atmel,sama5d3-nfc" compatible for nfc

 .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 drivers/mtd/nand/atmel_nand.c                      | 35 +++++-----------------
 drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
 4 files changed, 11 insertions(+), 31 deletions(-)

-- 
2.7.4
