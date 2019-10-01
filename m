From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 7/7] irqchip/irq-bcm283x: Add registration prints
Date: Tue,  1 Oct 2019 15:48:42 -0700
Message-ID: <20191001224842.9382-8-f.fainelli@gmail.com>
References: <20191001224842.9382-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001224842.9382-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

With many different kind of interrupt controllers available and used on
7211, add prints to help determine which ones are registered.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm2835.c | 9 +++++++++
 drivers/irqchip/irq-bcm2836.c | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/irqchip/irq-bcm2835.c b/drivers/irqchip/irq-bcm2835.c
index 55afc3487723..ae23e9ec86d0 100644
--- a/drivers/irqchip/irq-bcm2835.c
+++ b/drivers/irqchip/irq-bcm2835.c
@@ -76,6 +76,12 @@ enum armctrl_type {
 	ARMCTRL_BCM7211
 };
 
+static const char *armctrl_type_str[] = {
+	[ARMCTRL_BCM2835] = "BCM2835",
+	[ARMCTRL_BCM2836] = "BCM2836",
+	[ARMCTRL_BCM7211] = "BCM7211",
+};
+
 static const int reg_pending[] __initconst = { 0x00, 0x04, 0x08 };
 static const int reg_enable[] __initconst = { 0x18, 0x10, 0x14 };
 static const int reg_disable[] __initconst = { 0x24, 0x1c, 0x20 };
@@ -205,6 +211,9 @@ static int __init armctrl_of_init(struct device_node *node,
 		set_handle_irq(bcm2835_handle_irq);
 	}
 
+	pr_info("registered %s intc (%pOF)\n", armctrl_type_str[type],
+		node);
+
 	return 0;
 }
 
diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index 77fa395c8f6b..b159dc91919d 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -240,6 +240,8 @@ static int __init arm_irqchip_l1_intc_of_init_smp(struct device_node *node,
 
 	set_handle_irq(bcm2836_arm_irqchip_handle_irq);
 
+	pr_info("Registered BCM2836 intc (%s)\n", node->full_name);
+
 	return 0;
 }
 
-- 
2.17.1
