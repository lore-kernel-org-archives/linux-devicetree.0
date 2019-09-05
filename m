From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: dts: aspeed-g4: Add all flash chips
Date: Wed,  4 Sep 2019 17:02:20 -0700
Message-ID: <20190905000221.31445-1-joel@jms.id.au>
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
To: Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The FMC supports five chip selects, so describe the five possible flash
chips.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e465cda40fe7..dffb595d30e4 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -67,6 +67,26 @@
 				compatible = "jedec,spi-nor";
 				status = "disabled";
 			};
+			flash@1 {
+				reg = < 1 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@2 {
+				reg = < 2 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@3 {
+				reg = < 3 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
+			flash@4 {
+				reg = < 4 >;
+				compatible = "jedec,spi-nor";
+				status = "disabled";
+			};
 		};
 
 		spi: spi@1e630000 {
-- 
2.23.0.rc1
