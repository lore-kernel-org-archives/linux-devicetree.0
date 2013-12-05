From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH v3 3/9] mtd: nand: davinci: check required ti,
 davinci-chipselect property
Date: Thu, 5 Dec 2013 19:25:51 +0200
Message-ID: <1386264358-9738-4-git-send-email-ivan.khoronzhuk@ti.com>
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

The property "ti,davinci-chipselect" is required. So we have to check
if it is set.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Reviewed-by: Taras Kondratiuk <taras@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index ddcd7c8..9a96ac7 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -545,6 +545,9 @@ static struct davinci_nand_pdata
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-chipselect", &prop))
 			pdev->id = prop;
+		else
+			return ERR_PTR(-EINVAL);
+
 		if (!of_property_read_u32(pdev->dev.of_node,
 			"ti,davinci-mask-ale", &prop))
 			pdata->mask_ale = prop;
-- 
1.7.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
