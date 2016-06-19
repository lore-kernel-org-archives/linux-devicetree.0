From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH v2 2/2] mtd: nand: sunxi: add reset line support
Date: Sun, 19 Jun 2016 22:52:36 +0800
Message-ID: <20160619145236.43769-2-icenowy@aosc.xyz>
References: <20160619145236.43769-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBB3HDTK5QKGQEOUR42OI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160619145236.43769-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NAND controller on some sun8i chips needs its reset line to be deasserted
before they can enter working state. This commit added the reset line process
to the driver.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
Changes in v2:
  - Corrected the error checking code of reset line.

 drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index a83a690..d178c1a 100644
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
+	if (PTR_ERR(nfc->reset) != -ENOENT)
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
2.9.0
