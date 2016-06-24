From: Han Xu <han.xu@nxp.com>
Subject: [PATCH v3 3/6] mtd: nand: gpmi: add GPMI NAND support for i.MX6QP
Date: Fri, 24 Jun 2016 16:40:08 -0500
Message-ID: <1466804411-19874-4-git-send-email-han.xu@nxp.com>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

support GPMI NAND on i.MX6QP

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index a8936fd..aedaff3 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -104,6 +104,12 @@ static const struct gpmi_devdata gpmi_devdata_imx6q = {
 	.max_chain_delay = 12,
 };
 
+static const struct gpmi_devdata gpmi_devdata_imx6qp = {
+	.type = IS_MX6QP,
+	.bch_max_ecc_strength = 40,
+	.max_chain_delay = 12,
+};
+
 static const struct gpmi_devdata gpmi_devdata_imx6sx = {
 	.type = IS_MX6SX,
 	.bch_max_ecc_strength = 62,
@@ -2086,6 +2092,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 		.compatible = "fsl,imx6q-gpmi-nand",
 		.data = &gpmi_devdata_imx6q,
 	}, {
+		.compatible = "fsl,imx6qp-gpmi-nand",
+		.data = &gpmi_devdata_imx6qp,
+	}, {
 		.compatible = "fsl,imx6sx-gpmi-nand",
 		.data = &gpmi_devdata_imx6sx,
 	}, {
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 04a3584..1cee620 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -123,6 +123,7 @@ enum gpmi_type {
 	IS_MX23,
 	IS_MX28,
 	IS_MX6Q,
+	IS_MX6QP,
 	IS_MX6SX,
 	IS_MX7D,
 };
@@ -305,9 +306,11 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 #define GPMI_IS_MX23(x)		((x)->devdata->type == IS_MX23)
 #define GPMI_IS_MX28(x)		((x)->devdata->type == IS_MX28)
 #define GPMI_IS_MX6Q(x)		((x)->devdata->type == IS_MX6Q)
+#define GPMI_IS_MX6QP(x)	((x)->devdata->type == IS_MX6QP)
 #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
 #define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
 
-#define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6SX(x))
+#define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)	\
+				|| GPMI_IS_MX6SX(x))
 #define GPMI_IS_MX7(x)		(GPMI_IS_MX7D(x))
 #endif
-- 
1.9.1
