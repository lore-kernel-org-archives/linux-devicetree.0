From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCh v3 1/4] arm64: add basic Kconfig symbols for i.MX8
Date: Fri, 21 Sep 2018 14:56:23 +0200
Message-ID: <20180921125626.21971-1-l.stach@pengutronix.de>
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
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add basic Kconfig symbols to make the MXC architecture available
in the ARM64 world.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
---
v2: fix "enabled" typo.
v3: use SoC suboption in Kconfig.platforms instead of drivers/soc
---
 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 393d2b524284..210a0145117a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -139,6 +139,20 @@ config ARCH_MVEBU
 	   - Armada 7K SoC Family
 	   - Armada 8K SoC Family
 
+config ARCH_MXC
+	bool "ARMv8 based NXP i.MX SoC family"
+	help
+	  This enables support for the ARMv8 based SoCs in the
+	  NXP i.MX family.
+
+config SOC_IMX8MQ
+	bool "i.MX8MQ support"
+	depends on ARCH_MXC
+	select ARM64_ERRATUM_843419
+	select ARM64_ERRATUM_845719
+	help
+	  This enables support for the i.MX8MQ SoC.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.19.0
