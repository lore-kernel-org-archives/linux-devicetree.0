From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 4/5] soc: ti: Add Support for AM654 SoC config option
Date: Tue, 19 Jun 2018 14:42:52 -0500
Message-ID: <20180619194253.27288-5-nm@ti.com>
References: <20180619194253.27288-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619194253.27288-1-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Add option to build AM6 SoC specific components

Signed-off-by: Benjamin Fair <b-fair@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
(new patch broken out from: https://patchwork.kernel.org/patch/10447719/)

 drivers/soc/ti/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 92770d84a288..be4570baad96 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -1,3 +1,17 @@
+# 64-bit ARM SoCs from TI
+if ARM64
+
+if ARCH_K3
+
+config ARCH_K3_AM6_SOC
+	bool "K3 AM6 SoC"
+	help
+	  Enable support for TI's AM6 SoC Family support
+
+endif
+
+endif
+
 #
 # TI SOC drivers
 #
-- 
2.15.1
