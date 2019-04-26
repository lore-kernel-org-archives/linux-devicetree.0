From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 2/5] mtd: onenand/samsung: Make sure that bus clock is enabled
Date: Fri, 26 Apr 2019 18:42:21 +0200
Message-ID: <20190426164224.11327-3-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

This patch adds basic handling of controller bus clock to make sure that
in device probe it is enabled and device can operate correctly. The
clock is optional and driver behavior is identical as before this patch
if not provided.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/mtd/nand/onenand/samsung.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
index a425f19a3876..9628bf5bc397 100644
--- a/drivers/mtd/nand/onenand/samsung.c
+++ b/drivers/mtd/nand/onenand/samsung.c
@@ -14,6 +14,7 @@
  *	S5PC110: use DMA
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/sched.h>
@@ -125,6 +126,7 @@ enum soc_type {
 struct s3c_onenand {
 	struct mtd_info	*mtd;
 	struct platform_device	*pdev;
+	struct clk	*clk_bus;
 	enum soc_type	type;
 	void __iomem	*ctrl_base;
 	void __iomem	*chip_base;
@@ -916,6 +918,10 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 		}
 	}
 
+	onenand->clk_bus = devm_clk_get(&pdev->dev, "bus");
+	if (!IS_ERR(onenand->clk_bus))
+		clk_prepare_enable(onenand->clk_bus);
+
 	err = onenand_scan(mtd, 1);
 	if (err)
 		return err;
@@ -947,6 +953,8 @@ static int s3c_onenand_remove(struct platform_device *pdev)
 	struct mtd_info *mtd = platform_get_drvdata(pdev);
 
 	onenand_release(mtd);
+	if (!IS_ERR(onenand->clk_bus))
+		clk_disable_unprepare(onenand->clk_bus);
 
 	return 0;
 }
-- 
2.20.1
