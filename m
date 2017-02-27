From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] staging: fsl-mc: fix warning in DT ranges parser
Date: Mon, 27 Feb 2017 21:42:16 +0100
Message-ID: <20170227204235.3547639-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, German Rivera <german.rivera@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Itai Katz <itai.katz@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The fsl-mc-bus driver in staging contains a copy of the standard
'ranges' property parsing algorithm with a hack to treat a missing
property the same way as an empty one. This code produces false-positive
warnings for me in an allmodconfig build:

drivers/staging/fsl-mc/bus/fsl-mc-bus.c: In function 'fsl_mc_bus_probe':
drivers/staging/fsl-mc/bus/fsl-mc-bus.c:645:6: error: 'mc_size_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/staging/fsl-mc/bus/fsl-mc-bus.c:682:8: error: 'mc_addr_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/staging/fsl-mc/bus/fsl-mc-bus.c:644:6: note: 'mc_addr_cells' was declared here
drivers/staging/fsl-mc/bus/fsl-mc-bus.c:684:8: error: 'paddr_cells' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/staging/fsl-mc/bus/fsl-mc-bus.c:643:6: note: 'paddr_cells' was declared here

To avoid the warnings, I'm simplifying the argument handling to pass
the number of valid ranges in the property as the function return code
rather than passing it by reference. With this change, gcc can see that
we don't evaluate the cell numbers for an missing ranges property.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/fsl-mc/bus/fsl-mc-bus.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
index 47acb0a29842..3be5f25ff113 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
@@ -588,8 +588,7 @@ static int parse_mc_ranges(struct device *dev,
 			   int *paddr_cells,
 			   int *mc_addr_cells,
 			   int *mc_size_cells,
-			   const __be32 **ranges_start,
-			   u8 *num_ranges)
+			   const __be32 **ranges_start)
 {
 	const __be32 *prop;
 	int range_tuple_cell_count;
@@ -602,8 +601,6 @@ static int parse_mc_ranges(struct device *dev,
 		dev_warn(dev,
 			 "missing or empty ranges property for device tree node '%s'\n",
 			 mc_node->name);
-
-		*num_ranges = 0;
 		return 0;
 	}
 
@@ -630,8 +627,7 @@ static int parse_mc_ranges(struct device *dev,
 		return -EINVAL;
 	}
 
-	*num_ranges = ranges_len / tuple_len;
-	return 0;
+	return ranges_len / tuple_len;
 }
 
 static int get_mc_addr_translation_ranges(struct device *dev,
@@ -639,7 +635,7 @@ static int get_mc_addr_translation_ranges(struct device *dev,
 						**ranges,
 					  u8 *num_ranges)
 {
-	int error;
+	int ret;
 	int paddr_cells;
 	int mc_addr_cells;
 	int mc_size_cells;
@@ -647,16 +643,16 @@ static int get_mc_addr_translation_ranges(struct device *dev,
 	const __be32 *ranges_start;
 	const __be32 *cell;
 
-	error = parse_mc_ranges(dev,
+	ret = parse_mc_ranges(dev,
 				&paddr_cells,
 				&mc_addr_cells,
 				&mc_size_cells,
-				&ranges_start,
-				num_ranges);
-	if (error < 0)
-		return error;
+				&ranges_start);
+	if (ret < 0)
+		return ret;
 
-	if (!(*num_ranges)) {
+	*num_ranges = ret;
+	if (!ret) {
 		/*
 		 * Missing or empty ranges property ("ranges;") for the
 		 * 'fsl,qoriq-mc' node. In this case, identity mapping
-- 
2.9.0
