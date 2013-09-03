From: Fugang Duan <B38611@freescale.com>
Subject: [PATCH v2 3/4] ARM: imx6sl: add imx6sl iomux-gpr field define
Date: Tue, 3 Sep 2013 12:26:24 +0800
Message-ID: <1378182385-9205-4-git-send-email-B38611@freescale.com>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378182385-9205-1-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add imx6sl iomux-gpr register field define in "imx6q-iomuxc-gpr.h" header
file, which is not fully define all iomux-gpr registers and fields, only
add fec related macro define.

Signed-off-by: Fugang Duan  <B38611@freescale.com>
---
 include/linux/mfd/syscon/imx6q-iomuxc-gpr.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
index b6bdcd6..7086b22 100644
--- a/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
+++ b/include/linux/mfd/syscon/imx6q-iomuxc-gpr.h
@@ -363,4 +363,9 @@
 #define IMX6Q_GPR13_SATA_TX_LVL_1_240_V		(0x1f << 2)
 #define IMX6Q_GPR13_SATA_MPLL_CLK_EN		BIT(1)
 #define IMX6Q_GPR13_SATA_TX_EDGE_RATE		BIT(0)
+
+/* For imx6sl iomux gpr register field define */
+#define IMX6SL_GPR1_FEC_CLOCK_MUX1_SEL_MASK    (0x3 << 17)
+#define IMX6SL_GPR1_FEC_CLOCK_MUX2_SEL_MASK    (0x1 << 14)
+
 #endif /* __LINUX_IMX6Q_IOMUXC_GPR_H */
-- 
1.7.1
