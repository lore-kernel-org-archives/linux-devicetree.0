From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] ARM: imx51: Configure M4IF to avoid visual artifacts
Date: Mon,  9 Jul 2018 15:19:15 -0300
Message-ID: <1531160355-12384-3-git-send-email-festevam@gmail.com>
References: <1531160355-12384-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531160355-12384-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Configure the M4IF registers as per the vendor bootloader
to avoid visual artifacts during video playback.

This way we don't need to rely on the bootloader configuration for
optimal IPU/VPU bus priorities.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Tested-by: Sergey Lapin <sergey.lapin@cogentembedded.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---
Changes since v1:
- None

 arch/arm/mach-imx/mach-imx51.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/mach-imx51.c b/arch/arm/mach-imx/mach-imx51.c
index 3835b6a..37ffdfa 100644
--- a/arch/arm/mach-imx/mach-imx51.c
+++ b/arch/arm/mach-imx/mach-imx51.c
@@ -12,6 +12,7 @@
 
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <asm/mach/arch.h>
@@ -48,11 +49,37 @@ static void __init imx51_ipu_mipi_setup(void)
 	iounmap(hsc_addr);
 }
 
+static void __init imx51_m4if_setup(void)
+{
+	void __iomem *m4if_base;
+	struct device_node *np;
+
+	np = of_find_compatible_node(NULL, NULL, "fsl,imx51-m4if");
+	if (!np)
+		return;
+
+	m4if_base = of_iomap(np, 0);
+	if (!m4if_base) {
+		pr_err("Unable to map M4IF registers\n");
+		return;
+	}
+
+	/*
+	 * Configure VPU and IPU with higher priorities
+	 * in order to avoid artifacts during video playback
+	 */
+	writel_relaxed(0x00000203, m4if_base + 0x40);
+	writel_relaxed(0x00000000, m4if_base + 0x44);
+	writel_relaxed(0x00120125, m4if_base + 0x9c);
+	writel_relaxed(0x001901A3, m4if_base + 0x48);
+	iounmap(m4if_base);
+}
+
 static void __init imx51_dt_init(void)
 {
 	imx51_ipu_mipi_setup();
 	imx_src_init();
-
+	imx51_m4if_setup();
 	imx_aips_allow_unprivileged_access("fsl,imx51-aipstz");
 }
 
-- 
2.7.4
