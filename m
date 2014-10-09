From: Joe.C <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 0/7] ARM: mediatek: Add support for interrupt polarity
Date: Thu, 9 Oct 2014 22:29:33 +0800
Message-ID: <1412864980-20273-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sricharan R <r.sricharan@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, yingjoe.chen@gmail.com, yh.chen@mediatek.com, nathan.chung@mediatek.com, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Matt Porter <mporter@linaro.org>, Marc Carino <marc.ceeeee@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, hc.yen@mediatek.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

This series is 3rd version of interrupt polarity support for MediaTek
SoCs. Unlike previous attempts[1], this version is implemented with hierarchy
irqdomain. This is based on Jiang's hierarchy irqdomain v2 [2] and my
mediatek SoC basic support [3].

Simplified block diagram for interrupt:

    +-------+      +-------+
 ---| SYSIRQ|------|ARM GIC|
 ---|       |------|       |
 ---|       |------|       |
 ---|       |------|       |
 ---|       |------|       |
    +-------+      +-------+

In device tree, interrupt-parent for other devices is sysirq, child of gic.
This describe HW better and allow device to specify polarity as it is sent
by the device.

In order to use hierarchy irq domain, gic can't use legacy irq domain anymore.
When arm,hierarchy-irq-domain property is specified, GIC will work in hierarchy
way and all interrupt numbers must be set by device tree. My /proc/interrupts
looks like this:

# cat /proc/interrupts
           CPU0
 16:       1862  MT_SYSIRQ 113  mtk_timer
 17:         67  MT_SYSIRQ  54  mtk-uart

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-August/279052.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/290832.html
[3] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-September/284553.html

Joe.C (7):
  irqdomain: Fix irq_domain_alloc_irqs return check.
  genirq: Add more helper functions to support stacked irq_chip
  irqchip: gic: Support hierarchy irq domain.
  ARM: mediatek: Add sysirq interrupt polarity support
  ARM: mediatek: Add sysirq in mt6589/mt8135/mt8127 dtsi
  dt-bindings: add irq domain parent binding
  dt-bindings: add bindings for mediatek sysirq

 Documentation/devicetree/bindings/arm/gic.txt      |   2 +
 .../bindings/arm/mediatek/mediatek,sysirq.txt      |  19 +++
 arch/arm/boot/dts/mt6589.dtsi                      |  14 +-
 arch/arm/boot/dts/mt8127.dtsi                      |  14 +-
 arch/arm/boot/dts/mt8135.dtsi                      |  14 +-
 arch/arm/mach-mediatek/Kconfig                     |   1 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-gic.c                          |  56 ++++++-
 drivers/irqchip/irq-mt65xx-sysirq.c                | 170 +++++++++++++++++++++
 include/linux/irq.h                                |   5 +
 kernel/irq/chip.c                                  |  28 ++++
 kernel/irq/irqdomain.c                             |   2 +-
 12 files changed, 311 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
 create mode 100644 drivers/irqchip/irq-mt65xx-sysirq.c
