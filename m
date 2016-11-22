From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 3/3] arm64: dts: sunxi: enable EHCI1,
 OHCI1 and USB PHY nodes in Pine64
Date: Tue, 22 Nov 2016 23:58:31 +0800
Message-ID: <20161122155831.8724-3-icenowy@aosc.xyz>
References: <20161122155831.8724-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161122155831.8724-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Pine64 have two USB Type-A ports, which are wired to the two ports of
A64 USB PHY, and the lower port is the EHCI/OHCI1 port.

Enable the necessary nodes to enable the lower USB port to work.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes since v1:
- Sort the nodes.
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index c32ebc7..f9a11e6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -57,6 +57,10 @@
 	};
 };
 
+&ehci1 {
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
@@ -67,8 +71,16 @@
 	bias-pull-up;
 };
 
+&ohci1 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
 	status = "okay";
 };
+
+&usbphy {
+	status = "okay";
+};
-- 
2.10.2
