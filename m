From: Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH] ARM: dt: da850: add nand_cs3 node label in the dtsi
Date: Wed,  3 Aug 2016 16:25:28 +0000
Message-ID: <20160803162528.2337-1-kbeldan@baylibre.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, karl.beldan+oss@gmail.com, Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>
List-Id: devicetree@vger.kernel.org

This will allow to adjust the related settings in the board files.

Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 25f0f8e..3a00978 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -375,7 +375,7 @@
 			dma-names = "tx", "rx";
 		};
 	};
-	nand_cs3@62000000 {
+	nand_cs3: nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
 		reg = <0x62000000 0x807ff
 		       0x68000000 0x8000>;
-- 
2.9.0.rc1
