From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v02 1/6] ARM: DTS: da850: fix edma0 reg space
Date: Thu, 17 Dec 2015 15:27:47 +0200
Message-ID: <1450358872-2951-2-git-send-email-peter.ujfalusi@ti.com>
References: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nsekhar@ti.com, arnd@arndb.de
Cc: khilman@deeprootsystems.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The size of the eDMA0 CC register space is 0x8000 and not 0x10000.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Sushaanth Srirangapathi <sushaanth.s@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 0bd98cd00816..e73f5efb3aa3 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -152,7 +152,8 @@
 		};
 		edma0: edma@01c00000 {
 			compatible = "ti,edma3";
-			reg =	<0x0 0x10000>;
+			/* eDMA3 CC0: 0x01c0 0000 - 0x01c0 7fff */
+			reg =	<0x0 0x8000>;
 			interrupts = <11 13 12>;
 			#dma-cells = <1>;
 		};
-- 
2.6.4
