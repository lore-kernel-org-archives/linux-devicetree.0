From: Han Xu <han.xu@nxp.com>
Subject: [PATCH v2 5/6] mtd: nand: gpmi: support NAND on i.MX6UL
Date: Fri, 10 Jun 2016 12:01:33 -0500
Message-ID: <1465578094-8816-6-git-send-email-han.xu@nxp.com>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

support GPMI NAND on i.MX6UL

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 5 ++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 03bdb4d..133483f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -122,6 +122,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d = {
 	.max_chain_delay = 12,
 };
 
+static const struct gpmi_devdata gpmi_devdata_imx6ul = {
+	.type = IS_MX6UL,
+	.bch_max_ecc_strength = 40,
+	.max_chain_delay = 12,
+};
+
 static irqreturn_t bch_irq(int irq, void *cookie)
 {
 	struct gpmi_nand_data *this = cookie;
@@ -2123,6 +2129,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 		.compatible = "fsl,imx6sx-gpmi-nand",
 		.data = &gpmi_devdata_imx6sx,
 	}, {
+		.compatible = "fsl,imx6ul-gpmi-nand",
+		.data = &gpmi_devdata_imx6ul,
+	}, {
 		.compatible = "fsl,imx7d-gpmi-nand",
 		.data = &gpmi_devdata_imx7d,
 	}, { /* sentinel */ }
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 1cee620..8de122e 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -126,6 +126,7 @@ enum gpmi_type {
 	IS_MX6QP,
 	IS_MX6SX,
 	IS_MX7D,
+	IS_MX6UL,
 };
 
 struct gpmi_devdata {
@@ -309,8 +310,10 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 #define GPMI_IS_MX6QP(x)	((x)->devdata->type == IS_MX6QP)
 #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
 #define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
+#define GPMI_IS_MX6UL(x)	((x)->devdata->type == IS_MX6UL)
 
 #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)	\
-				|| GPMI_IS_MX6SX(x))
+				|| GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))
+
 #define GPMI_IS_MX7(x)		(GPMI_IS_MX7D(x))
 #endif
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
