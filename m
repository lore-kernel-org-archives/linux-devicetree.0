From: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 1/2] nvmem: imx-ocotp: clear error bit after reading locked values
Date: Mon, 27 Mar 2017 15:31:30 +0200
Message-ID: <1490621491-28247-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, dev@g0hl1n.net, Richard Leitner <richard.leitner@skidata.com>
List-Id: devicetree@vger.kernel.org

When reading a "read locked" value from the OCOTP controller on i.MX6
SoC's an error bit is set. This bit has to be cleared by software before
any new write, read or reload access can be issued.

Therefore clear it after we detect such an "locked read".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/nvmem/imx-ocotp.c | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index b8ca1e6..e2b62b3 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -25,6 +25,19 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
+					       * OTP Bank0 Word0
+					       */
+#define IMX_OCOTP_OFFSET_PER_WORD	0x10  /* Offset between the start addr
+					       * of two consecutive OTP words.
+					       */
+#define IMX_OCOTP_ADDR_CTRL		0x0000
+#define IMX_OCOTP_ADDR_CTRL_CLR		0x0008
+
+#define IMX_OCOTP_BM_CTRL_ERROR		0x00000200
+
+#define IMX_OCOTP_READ_LOCKED_VAL	0xBADABADA
+
 struct ocotp_priv {
 	struct device *dev;
 	struct clk *clk;
@@ -32,6 +45,17 @@ struct ocotp_priv {
 	unsigned int nregs;
 };
 
+static void imx_ocotp_clr_err_if_set(void __iomem *base)
+{
+	u32 c;
+
+	c = readl(base + IMX_OCOTP_ADDR_CTRL);
+	if (!(c & IMX_OCOTP_BM_CTRL_ERROR))
+		return;
+
+	writel(IMX_OCOTP_BM_CTRL_ERROR, base + IMX_OCOTP_ADDR_CTRL_CLR);
+}
+
 static int imx_ocotp_read(void *context, unsigned int offset,
 			  void *val, size_t bytes)
 {
@@ -52,11 +76,22 @@ static int imx_ocotp_read(void *context, unsigned int offset,
 		dev_err(priv->dev, "failed to prepare/enable ocotp clk\n");
 		return ret;
 	}
-	for (i = index; i < (index + count); i++)
-		*buf++ = readl(priv->base + 0x400 + i * 0x10);
 
-	clk_disable_unprepare(priv->clk);
+	for (i = index; i < (index + count); i++) {
+		*buf++ = readl(priv->base + IMX_OCOTP_OFFSET_B0W0 +
+			       i * IMX_OCOTP_OFFSET_PER_WORD);
+
+		/* 47.3.1.2
+		 * For "read locked" registers 0xBADABADA will be returned and
+		 * HW_OCOTP_CTRL[ERROR] will be set. It must be cleared by
+		 * software before any new write, read or reload access can be
+		 * issued
+		 */
+		if (*(buf - 1) == IMX_OCOTP_READ_LOCKED_VAL)
+			imx_ocotp_clr_err_if_set(priv->base);
+	}
 
+	clk_disable_unprepare(priv->clk);
 	return 0;
 }
 
-- 
2.1.4
