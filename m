From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v2 08/15] mtd: maps: physmap: Return -ENOMEM directly when
 info allocation fails
Date: Fri, 19 Oct 2018 09:49:01 +0200
Message-ID: <20181019074908.13226-9-boris.brezillon@bootlin.com>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20181019074908.13226-1-boris.brezillon@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

There's no point going to the err_out path since no resources have
been allocated yet, just return -ENOMEM directly.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
Changes in v2:
- Add Ricardo's R-b
---
 drivers/mtd/maps/physmap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 9b34223c4635..7d30f3524d35 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -110,10 +110,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 
 	info = devm_kzalloc(&dev->dev, sizeof(struct physmap_flash_info),
 			    GFP_KERNEL);
-	if (info == NULL) {
-		err = -ENOMEM;
-		goto err_out;
-	}
+	if (!info)
+		return -ENOMEM;
 
 	while (platform_get_resource(dev, IORESOURCE_MEM, info->nmaps))
 		info->nmaps++;
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
