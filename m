From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 10/10] soc: ti: am6: Enable interrupt controller drivers
Date: Thu, 18 Oct 2018 21:10:17 +0530
Message-ID: <20181018154017.7112-11-lokeshvutla@ti.com>
References: <20181018154017.7112-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018154017.7112-1-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
List-Id: devicetree@vger.kernel.org

Select all the TISCI dependent interrupt controller drivers
for AM6 SoC.

Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes since v1:
- new patch

 drivers/soc/ti/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index be4570baad96..9ef2a8a92eb4 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -5,6 +5,9 @@ if ARCH_K3
 
 config ARCH_K3_AM6_SOC
 	bool "K3 AM6 SoC"
+	select TI_SCI_PROTOCOL
+	select TI_SCI_INTR_IRQCHIP
+	select TI_SCI_INTA_IRQCHIP
 	help
 	  Enable support for TI's AM6 SoC Family support
 
-- 
2.19.1
