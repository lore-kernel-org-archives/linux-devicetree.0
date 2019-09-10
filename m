From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v2 0/3] Amazon's Annapurna Labs POS Driver
Date: Tue, 10 Sep 2019 22:05:07 +0300
Message-ID: <1568142310-17622-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, talel@amazon.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Amazon's Annapurna Labs SoCs includes Point Of Serialization error
logging unit that reports an error in case of write error (e.g. attempt to
write to a read only register).

This patch series introduces the support for this unit.

Changes since v1: =================
- move MODULE_ to the end of the file
- simplified resource remapping devm_platform_ioremap_resource()
- use platform_get_irq() instead of irq_of_parse_and_map()
- removed the use of _relaxed accessor in favor to the regular ones
- removed driver selected based on arch
- added casting to u64 before left shifting (reported by kbuild test robot)


Talel Shenhar (3):
  dt-bindings: soc: al-pos: Amazon's Annapurna Labs POS
  soc: amazon: al-pos: Introduce Amazon's Annapurna Labs POS driver
  soc: amazon: al-pos: cast to u64 before left shifting

 .../bindings/soc/amazon/amazon,al-pos.txt          |  18 +++
 MAINTAINERS                                        |   7 ++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/amazon/Kconfig                         |   5 +
 drivers/soc/amazon/Makefile                        |   1 +
 drivers/soc/amazon/al_pos.c                        | 127 +++++++++++++++++++++
 7 files changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
 create mode 100644 drivers/soc/amazon/Kconfig
 create mode 100644 drivers/soc/amazon/Makefile
 create mode 100644 drivers/soc/amazon/al_pos.c

-- 
2.7.4
