From: Karl Palsson <karlp@tweak.net.au>
Subject: [PATCH 1/3] ARM: dts: sunxi: h3/h5: add missing uart2 rts/cts pins
Date: Tue, 18 Dec 2018 21:24:55 +0000
Message-ID: <20181218212457.30382-1-karlp@tweak.net.au>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Karl Palsson <karlp@tweak.net.au>
List-Id: devicetree@vger.kernel.org

uart1 and uart3 had existing pin definitions for the rts/cts pairs.
Add definitions for uart2 as well.

Signed-off-by: Karl Palsson <karlp@tweak.net.au>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index a4c757c0b741..38d3deefa0e3 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -472,6 +472,11 @@
 				function = "uart2";
 			};
 
+			uart2_rts_cts_pins: uart2_rts_cts {
+				pins = "PA2", "PA3";
+				function = "uart2";
+			};
+
 			uart3_pins: uart3 {
 				pins = "PA13", "PA14";
 				function = "uart3";
-- 
2.14.5
