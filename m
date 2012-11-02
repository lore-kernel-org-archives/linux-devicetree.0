From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] mtd: davinci: add support for parition binding nodes
Date: Fri, 2 Nov 2012 10:20:23 -0400
Message-ID: <1351866023-15470-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-keystone-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enhance the driver to support partition subnodes inside the nand
device bindings to describe partions on the nand device.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/arm/davinci/nand.txt       |    8 ++++++++
 drivers/mtd/nand/davinci_nand.c                    |   13 ++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/arm/davinci/nand.txt
index e37241f..4746452 100644
--- a/Documentation/devicetree/bindings/arm/davinci/nand.txt
+++ b/Documentation/devicetree/bindings/arm/davinci/nand.txt
@@ -23,6 +23,9 @@ Recommended properties :
 - ti,davinci-nand-buswidth: buswidth 8 or 16
 - ti,davinci-nand-use-bbt: use flash based bad block table support.
 
+nand device bindings may contain additional sub-nodes describing
+partitions of the address space. See partition.txt for more detail.
+
 Example (enbw_cmc board):
 aemif@60000000 {
 	compatible = "ti,davinci-aemif";
@@ -47,5 +50,10 @@ aemif@60000000 {
 		ti,davinci-ecc-mode = "hw";
 		ti,davinci-ecc-bits = <4>;
 		ti,davinci-nand-use-bbt;
+
+		partition@180000 {
+			label = "ubifs";
+			reg = <0x180000 0x7e80000>;
+		};
 	};
 };
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index df1ab7d..321b053 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -821,9 +821,16 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
-	ret = mtd_device_parse_register(&info->mtd, NULL, NULL, pdata->parts,
-					pdata->nr_parts);
-
+	if (pdata->parts)
+		ret = mtd_device_parse_register(&info->mtd, NULL, NULL,
+					pdata->parts, pdata->nr_parts);
+	else {
+		struct mtd_part_parser_data	ppdata;
+
+		ppdata.of_node = pdev->dev.of_node;
+		ret = mtd_device_parse_register(&info->mtd, NULL, &ppdata,
+						NULL, 0);
+	}
 	if (ret < 0)
 		goto err_scan;
 
-- 
1.7.9.5
