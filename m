From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] arm64: dts: clearfog-gt-8k: add wlan_disable signal hog
Date: Tue, 26 Feb 2019 08:46:11 +0200
Message-ID: <936a9930fee3f285ee5538205181ca2ef1f5cbe5.1551163571.git.baruch@tkos.co.il>
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
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Thomas Schreiber <tschreibe@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Thomas Schreiber <tschreibe@gmail.com>

There is currently no DT binding for GPIO rfkill signals. To make
mini-PCIe attached WiFi devices work, use gpio-hog to hold the
wlan_disable signal de-asserted.

Signed-off-by: Thomas Schreiber <tschreibe@gmail.com>
[baruch: add pinctrl node; rename tag]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 2468762283a5..9143aa13ceb1 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -226,6 +226,11 @@
 		marvell,function = "gpio";
 	};
 
+	cp0_wlan_disable_pins: wlan-disable-pins {
+		marvell,pins = "mpp51";
+		marvell,function = "gpio";
+	};
+
 	cp0_sdhci_pins: sdhci-pins {
 		marvell,pins = "mpp55", "mpp56", "mpp57", "mpp58", "mpp59",
 			       "mpp60", "mpp61";
@@ -235,7 +240,7 @@
 
 &cp0_pcie0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&cp0_pci0_reset_pins>;
+	pinctrl-0 = <&cp0_pci0_reset_pins &cp0_wlan_disable_pins>;
 	reset-gpios = <&cp0_gpio2 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
@@ -253,6 +258,12 @@
 		output-low;
 	};
 
+	wlan_disable {
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+
 	lte_disable {
 		gpio-hog;
 		gpios = <21 GPIO_ACTIVE_LOW>;
-- 
2.20.1
