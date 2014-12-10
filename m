From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC 07/15] ARM: imx6q: Add GPR3 MIPI muxing control register
 field shift bits definition
Date: Wed, 10 Dec 2014 16:37:20 +0800
Message-ID: <1418200648-32656-8-git-send-email-Ying.Liu@freescale.com>
References: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418200648-32656-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, airlied@linux.ie, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, mturquette@linaro.org, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds a macro to define the GPR3 MIPI muxing control register field
shift bits.

Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
---
 include/linux/mfd/syscon/imx6q-iomuxc-gpr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
index ff44374..3b0bed4 100644
--- a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
+++ b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
@@ -207,6 +207,7 @@
 #define IMX6Q_GPR3_LVDS0_MUX_CTL_IPU1_DI1	(0x1 << 6)
 #define IMX6Q_GPR3_LVDS0_MUX_CTL_IPU2_DI0	(0x2 << 6)
 #define IMX6Q_GPR3_LVDS0_MUX_CTL_IPU2_DI1	(0x3 << 6)
+#define IMX6Q_GPR3_MIPI_MUX_CTL_SHIFT		4
 #define IMX6Q_GPR3_MIPI_MUX_CTL_MASK		(0x3 << 4)
 #define IMX6Q_GPR3_MIPI_MUX_CTL_IPU1_DI0	(0x0 << 4)
 #define IMX6Q_GPR3_MIPI_MUX_CTL_IPU1_DI1	(0x1 << 4)
-- 
2.1.0
