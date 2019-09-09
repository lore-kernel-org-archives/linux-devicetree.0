From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 0/3] Amazon's Annapurna Labs POS Driver
Date: Mon, 9 Sep 2019 12:10:17 +0300
Message-ID: <1568020220-7758-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mchehab+samsung@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, tglx@linutronix.de, arnd@arndb.de, venture@google.com, linus.walleij@linaro.org, olof@lixom.net, mripard@kernel.org, ssantosh@kernel.org, paul.kocialkowski@bootlin.com, mjourdan@baylibre.com, catalin.marinas@arm.com, will@kernel.org, talel@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

The Amazon's Annapurna Labs SoCs includes Point Of Serialization error
logging unit that reports an error in case of write error (e.g. attempt to
write to a read only register).

This patch series introduces the support for this unit.


Talel Shenhar (3):
  dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
  soc: amazon: al-pos: Introduce Amazon's Annapurna Labs POS driver
  arm64: alpine: select AL_POS

 .../bindings/soc/amazon/amazon,al-pos.txt          |  18 +++
 MAINTAINERS                                        |   6 +
 arch/arm64/Kconfig.platforms                       |   1 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/amazon/Kconfig                         |   5 +
 drivers/soc/amazon/Makefile                        |   1 +
 drivers/soc/amazon/al_pos.c                        | 129 +++++++++++++++++++++
 8 files changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
 create mode 100644 drivers/soc/amazon/Kconfig
 create mode 100644 drivers/soc/amazon/Makefile
 create mode 100644 drivers/soc/amazon/al_pos.c

-- 
2.7.4
