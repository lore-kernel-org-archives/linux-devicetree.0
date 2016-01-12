From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 1/2] ARM: DTS: kirkwood-openrd: fix pin names for UART/SD
 selection
Date: Tue, 12 Jan 2016 22:07:32 +0200
Message-ID: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
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
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

The UART/SD pin names are swapped, fix that.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/boot/dts/kirkwood-openrd.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-openrd.dtsi b/arch/arm/boot/dts/kirkwood-openrd.dtsi
index d3330da..2a3dafd 100644
--- a/arch/arm/boot/dts/kirkwood-openrd.dtsi
+++ b/arch/arm/boot/dts/kirkwood-openrd.dtsi
@@ -40,7 +40,7 @@
 			pinctrl-0 = <&pmx_select28 &pmx_sdio_cd &pmx_select34>;
 			pinctrl-names = "default";
 
-			pmx_select28: pmx-select-uart-sd {
+			pmx_select28: pmx-select-rs232-rs484 {
 				marvell,pins = "mpp28";
 				marvell,function = "gpio";
 			};
@@ -48,7 +48,7 @@
 				marvell,pins = "mpp29";
 				marvell,function = "gpio";
 			};
-			pmx_select34: pmx-select-rs232-rs484 {
+			pmx_select34: pmx-select-uart-sd {
 				marvell,pins = "mpp34";
 				marvell,function = "gpio";
 			};
-- 
2.4.0
