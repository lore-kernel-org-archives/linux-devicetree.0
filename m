From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 10/10] soc: ti: am6: Enable interrupt controller drivers
Date: Tue, 12 Feb 2019 13:12:37 +0530
Message-ID: <20190212074237.2875-11-lokeshvutla@ti.com>
References: <20190212074237.2875-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212074237.2875-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

Select all the TISCI dependent interrupt controller drivers
for AM6 SoC.

Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v4:
- None
 drivers/soc/ti/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 7640490c2a6a..145b701a3d96 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -5,6 +5,11 @@ if ARCH_K3
 
 config ARCH_K3_AM6_SOC
 	bool "K3 AM6 SoC"
+	select MAILBOX
+	select TI_MESSAGE_MANAGER
+	select TI_SCI_PROTOCOL
+	select TI_SCI_INTR_IRQCHIP
+	select TI_SCI_INTA_IRQCHIP
 	help
 	  Enable support for TI's AM6 SoC Family support
 
-- 
2.19.2
