From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 4/9] ARM: at91: USB A926x update nand partition
Date: Wed, 11 Apr 2012 18:01:14 +0200
Message-ID: <1334160079-30831-4-git-send-email-plagnioj@jcrosoft.com>
References: <20120411153515.GK16641@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120411153515.GK16641@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

We now store the dtb in a nand partition.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 arch/arm/boot/dts/usb_a9g20.dts      |   11 ++++++++---
 arch/arm/mach-at91/board-usb-a926x.c |    4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/usb_a9g20.dts b/arch/arm/boot/dts/usb_a9g20.dts
index 7c2399c..0f88ec8 100644
--- a/arch/arm/boot/dts/usb_a9g20.dts
+++ b/arch/arm/boot/dts/usb_a9g20.dts
@@ -74,19 +74,24 @@
 				reg = <0x80000 0x20000>;
 			};
 
+			oftree@80000 {
+				label = "oftree";
+				reg = <0xa0000 0x20000>;
+			};
+
 			kernel@a0000 {
 				label = "kernel";
-				reg = <0xa0000 0x400000>;
+				reg = <0xc0000 0x400000>;
 			};
 
 			rootfs@4a0000 {
 				label = "rootfs";
-				reg = <0x4a0000 0x7800000>;
+				reg = <0x4c0000 0x7800000>;
 			};
 
 			data@7ca0000 {
 				label = "data";
-				reg = <0x7ca0000 0x8360000>;
+				reg = <0x7cc0000 0x8340000>;
 			};
 		};
 
diff --git a/arch/arm/mach-at91/board-usb-a926x.c b/arch/arm/mach-at91/board-usb-a926x.c
index 332ecd4..95393fc 100644
--- a/arch/arm/mach-at91/board-usb-a926x.c
+++ b/arch/arm/mach-at91/board-usb-a926x.c
@@ -172,6 +172,10 @@ static struct mtd_partition __initdata ek_nand_partition[] = {
 		.offset	= MTDPART_OFS_NXTBLK,
 		.size	= SZ_128K,
 	}, {
+		.name	= "oftree",
+		.offset	= MTDPART_OFS_NXTBLK,
+		.size	= SZ_128K,
+	}, {
 		.name	= "kernel",
 		.offset	= MTDPART_OFS_NXTBLK,
 		.size	= 4 * SZ_1M,
-- 
1.7.9.1
