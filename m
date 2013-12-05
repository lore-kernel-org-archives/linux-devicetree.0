From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v3 2/9] mtd: nand: davinci: return ENOMEM if memory allocation
 is failed
Date: Thu, 5 Dec 2013 19:25:50 +0200
Message-ID: <1386264358-9738-3-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In case when memory allocation is failed the driver should return
ENOMEM instead of ENODEV.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Taras Kondratiuk <taras@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index d87213f..ddcd7c8 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -541,7 +541,7 @@ static struct davinci_nand_pdata
 				GFP_KERNEL);
 		pdev->dev.platform_data = pdata;
 		if (!pdata)
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-chipselect", &prop))
 			pdev->id = prop;
@@ -598,6 +598,9 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	nand_ecc_modes_t		ecc_mode;
 
 	pdata = nand_davinci_get_pdata(pdev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
 	/* insist on board-specific configuration */
 	if (!pdata)
 		return -ENODEV;
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
