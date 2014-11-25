From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v8 0/4] ARM: mediatek: Add support for interrupt polarity
Date: Tue, 25 Nov 2014 16:04:18 +0800
Message-ID: <1416902662-19281-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series is 8th version of interrupt polarity support for MediaTek SoCs.

I rebased previous version to latest tip/irq/irqdomain, and fix issues
raised by Marc & Mark. The interrupt & irq free work fine on mt8135 board.

Simplified block diagram for interrupt on my system:

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

When using hierarchy irq domain, gic will use irq_domain_add_linear to
create irqdomain and all interrupt numbers must come from device tree. My
/proc/interrupts looks like this now:

# cat /proc/interrupts
           CPU0
 16:     149578  MT_SYSIRQ 113  mtk_timer
 20:       1082  MT_SYSIRQ  54  serial

Changes in v8:
 - Rebased to new tip/irq/irqdomain
 - Update mediatek,sysirq.txt bindinds to document interrupt-cells format
   and interrupt-parents
 - Change interrupt-cells format check in mtk_sysirq.
 - Minor coding style fix

Changes in v7:
 - Discussed in [1]
 - Rebased to tip/irq/irqdomain
 - In mtk_sysirq_domain_alloc, use copy of irq_data to workaound of_node
   check in gic_irq_domain_xlate.

Changes in v6:
 - Discussed in [2]
 - Rebased to tip/irq/irqdomain

Changes in v5:
 - Discussed in [3]
 - Fix bug on mt6589 reported by Matthias
 - Fix bug for irq_find_mapping in irq_create_of_mapping
 - Merge Marc's change to proper handle non-DT case in gic_init_bases

Changes in v4:
 - Discussed in [4]
 - Remove arm,hierarchy-irq-domain. When GIC is probed by DT, it will
support hierarchy irqdomain.

Changes in v3:
 - Discussed in [5]
 - First implementation using hierarchy irqdomain

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/304119.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/302221.html
[3] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/298161.html
[4] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/296911.html
[5] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/293766.html

Yingjoe Chen (4):
  irqchip: gic: Support hierarchy irq domain.
  ARM: mediatek: Add sysirq interrupt polarity support
  ARM: mediatek: Add sysirq in mt6589/mt8135/mt8127 dtsi
  dt-bindings: add bindings for mediatek sysirq

 .../bindings/arm/mediatek/mediatek,sysirq.txt      |  28 ++++
 arch/arm/boot/dts/mt6589.dtsi                      |  14 +-
 arch/arm/boot/dts/mt8127.dtsi                      |  14 +-
 arch/arm/boot/dts/mt8135.dtsi                      |  14 +-
 drivers/irqchip/Kconfig                            |   1 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-gic.c                          |  77 +++++++---
 drivers/irqchip/irq-mtk-sysirq.c                   | 163 +++++++++++++++++++++
 8 files changed, 282 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sysirq.txt
 create mode 100644 drivers/irqchip/irq-mtk-sysirq.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
