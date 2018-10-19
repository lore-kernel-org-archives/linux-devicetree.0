From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v2 15/15] mtd: maps: physmap: Invert logic on if/else branch
Date: Fri, 19 Oct 2018 09:49:08 +0200
Message-ID: <20181019074908.13226-16-boris.brezillon@bootlin.com>
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

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

It is preferred to have the positive statement on an if/else. While we
are at it we replace the way we access rom_probe_types.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v2:
- New patch
---
 drivers/mtd/maps/physmap-core.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index 11e6239aadc7..33b77bd9022c 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -437,7 +437,6 @@ static int physmap_flash_pdata_init(struct platform_device *dev)
 static int physmap_flash_probe(struct platform_device *dev)
 {
 	struct physmap_flash_info *info;
-	const char * const *probe_type;
 	int err = 0;
 	int i;
 
@@ -519,14 +518,18 @@ static int physmap_flash_probe(struct platform_device *dev)
 			simple_map_init(&info->maps[i]);
 		}
 
-		probe_type = rom_probe_types;
-		if (!info->probe_type) {
-			for (; !info->mtds[i] && *probe_type; probe_type++)
-				info->mtds[i] = do_map_probe(*probe_type,
-							     &info->maps[i]);
-		} else {
+		if (info->probe_type) {
 			info->mtds[i] = do_map_probe(info->probe_type,
 						     &info->maps[i]);
+		} else {
+			int j;
+
+			for (j = 0; ARRAY_SIZE(rom_probe_types); j++) {
+				info->mtds[i] = do_map_probe(rom_probe_types[j],
+							     &info->maps[i]);
+				if (info->mtds[i])
+					break;
+			}
 		}
 
 		if (!info->mtds[i]) {
-- 
2.14.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
