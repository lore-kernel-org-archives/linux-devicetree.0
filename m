From: <sean.wang@mediatek.com>
Subject: [PATCH v1 08/19] arm: dts: mt7623: enable three available UARTs on
 bananapi-r2
Date: Fri, 23 Feb 2018 18:16:28 +0800
Message-ID: <f2e72b8c9f5755ee8943dd7be7f9b9ec50f52c9b.1519378872.git.sean.wang@mediatek.com>
References: <cover.1519378871.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1519378871.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

On bpi-r2 board, totally there're four UARTs which we usually called
uart[0-3] helpful to extend slow-I/O devices. Among those ones, uart2 has
dedicated pin slot which is used to console log. uart[0-1] appear at the
40-pins connector and uart3 has no pinout, but just has test points (TP47
for TX and TP48 for RX, respectively) nearby uart2, but we don't enable
uart3 in the patch. The missing pinctrl is also being supplemented for
those newly added devices.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 8ef91d6..6b760be 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -470,6 +470,13 @@
 				 <MT7623_PIN_82_UTXD1_FUNC_UTXD1>;
 		};
 	};
+
+	uart2_pins_a: uart@2 {
+		pins_dat {
+			pinmux = <MT7623_PIN_14_GPIO14_FUNC_URXD2>,
+				 <MT7623_PIN_15_GPIO15_FUNC_UTXD2>;
+		};
+	};
 };
 
 &pwm {
@@ -515,16 +522,18 @@
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-	status = "disabled";
+	status = "okay";
 };
 
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins_a>;
-	status = "disabled";
+	status = "okay";
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins_a>;
 	status = "okay";
 };
 
-- 
2.7.4
