From: Yegor Timoshenko <yegortimoshenko@riseup.net>
Subject: [PATCH] arm64: dts: allwinner: a64: bananapi-m64: enable UART2
Date: Sun, 26 May 2019 12:47:15 +0300
Message-ID: <20190526094715.12289-1-yegortimoshenko@riseup.net>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yegor Timoshenko <yegortimoshenko@riseup.net>
List-Id: devicetree@vger.kernel.org

BananaPi M64 exposes UART2 interface that is supposed to be enabled
by default (see "Default Function" in the pin definition table from
the manufacturer [1]).

[1]: https://bananapi.gitbooks.io/bpi-m64/en/bpi-m64gpiopindefine.html

Signed-off-by: Yegor Timoshenko <yegortimoshenko@riseup.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 094cfed13df9..100d1a8fd292 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -54,6 +54,7 @@
 		ethernet0 = &emac;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
@@ -312,6 +313,12 @@
 	status = "okay";
 };
 
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
 &usb_otg {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.20.1
