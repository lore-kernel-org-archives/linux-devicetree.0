From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 2/4] ARM: imx: select HAVE_ARM_ARCH_TIMER if selected i.MX7D
Date: Tue, 5 Jan 2016 11:17:15 -0600
Message-ID: <1452014237-12848-2-git-send-email-Frank.Li@nxp.com>
References: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452014237-12848-1-git-send-email-Frank.Li@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lznuaa@gmail.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, Frank Li <Frank.Li@freescale.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li@freescale.com>

i.MX7D Supported ARCH Timer.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
Change from v1 to v2:
 Sort config

 arch/arm/mach-imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 0ac180f..43ff3cd 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -561,6 +561,7 @@ config SOC_IMX7D
 	bool "i.MX7 Dual support"
 	select PINCTRL_IMX7D
 	select ARM_GIC
+	select HAVE_ARM_ARCH_TIMER
 	select HAVE_IMX_ANATOP
 	select HAVE_IMX_MMDC
 	help
-- 
2.5.2
