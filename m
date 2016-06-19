From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 2/2] mtd: nand: sunxi: add reset line support
Date: Sun, 19 Jun 2016 19:37:39 +0800
Message-ID: <20160619113739.30362-2-icenowy@aosc.xyz>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20160619113739.30362-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: maxime.ripard@free-electrons.com, wens@csie.org, boris.brezillon@free-electrons.com
Cc: devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Icenowy Zheng <icenowy@aosc.xyz>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

The NAND controller on some sun8i chips needs its reset line to be deasserted
before they can enter working state. This commit added the reset line process
to the driver.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a83a690..1502748 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -39,6 +39,7 @@
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/reset.h>
 
 #define NFC_REG_CTL		0x0000
 #define NFC_REG_ST		0x0004
@@ -269,6 +270,7 @@ struct sunxi_nfc {
 	void __iomem *regs;
 	struct clk *ahb_clk;
 	struct clk *mod_clk;
+	struct reset_control *reset;
 	unsigned long assigned_cs;
 	unsigned long clk_rate;
 	struct list_head chips;
@@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_ahb_clk_unprepare;
 
+	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
+	if (PTR_ERR(nfc->reset) == -EPROBE_DEFER)
+		return PTR_ERR(nfc->reset);
+
+	if (!IS_ERR(nfc->reset)) {
+		ret = reset_control_deassert(nfc->reset);
+		if (ret) {
+			dev_err(dev, "reset err %d\n", ret);
+			goto out_mod_clk_unprepare;
+		}
+	}
+
 	ret = sunxi_nfc_rst(nfc);
 	if (ret)
 		goto out_mod_clk_unprepare;
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
