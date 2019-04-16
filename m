From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 6/6] arm64: dts: allwinner: Remove useless phy-names from EHCI
 and OHCI
Date: Tue, 16 Apr 2019 10:28:02 +0200
Message-ID: <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Neither the OHCI or EHCI bindings are using the phy-names property, so we
can just drop it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi          | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 78c82a665c84..2b6345db7dc0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -104,7 +104,6 @@
 
 &ehci0 {
 	phys = <&usbphy 0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
@@ -151,7 +150,6 @@
 
 &ohci0 {
 	phys = <&usbphy 0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 6f27eb082429..666f32b876c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -553,7 +553,6 @@
 			resets = <&ccu RST_BUS_OHCI1>,
 				 <&ccu RST_BUS_EHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -565,7 +564,6 @@
 				 <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index e0dc4a05c1ba..3e0ec6e92869 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -445,7 +445,6 @@
 			resets = <&ccu RST_BUS_OHCI3>,
 				 <&ccu RST_BUS_EHCI3>;
 			phys = <&usb2phy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -457,7 +456,6 @@
 				 <&ccu CLK_USB_OHCI3>;
 			resets = <&ccu RST_BUS_OHCI3>;
 			phys = <&usb2phy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
git-series 0.9.1
