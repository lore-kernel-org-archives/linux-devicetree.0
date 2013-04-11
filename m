From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 7/8] ARM: at91: at9sam9m10g45ek: add dt lcd support
Date: Thu, 11 Apr 2013 17:00:21 +0200
Message-ID: <1365692422-9565-7-git-send-email-plagnioj@jcrosoft.com>
References: <20130411145741.GB25242@game.jcrosoft.org>
 <1365692422-9565-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365692422-9565-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/at91sam9m10g45ek.dts |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index 20c3191..79dc034 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -104,6 +104,35 @@
 			};
 		};
 
+		fb0: fb@0x00500000 {
+			display = <&display0>;
+			status = "okay";
+
+			display0: display {
+				bits-per-pixel = <32>;
+				atmel,lcdcon-backlight;
+				atmel,dmacon = <0x1>;
+				atmel,lcdcon2 = <0x80008002>;
+				atmel,guard-time = <9>;
+				atmel,lcd-wiring-mode = "RGB";
+
+				display-timings {
+					native-mode = <&timing0>;
+					timing0: timing0 {
+						clock-frequency = <9000000>;
+						hactive = <480>;
+						vactive = <272>;
+						hback-porch = <1>;
+						hfront-porch = <1>;
+						vback-porch = <40>;
+						vfront-porch = <1>;
+						hsync-len = <45>;
+						vsync-len = <1>;
+					};
+				};
+			};
+		};
+
 		nand0: nand@40000000 {
 			nand-bus-width = <8>;
 			nand-ecc-mode = "soft";
-- 
1.7.10.4
