From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v2 2/3] arm64: dts: sunxi: sort the nodes in
 sun50i-a64-pine64.dts
Date: Tue, 22 Nov 2016 23:58:30 +0800
Message-ID: <20161122155831.8724-2-icenowy@aosc.xyz>
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

In this dts file, uart0 node is put before i2c1.

Move the uart0 node to the end to satisfy alphebetical order.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
New patch added into v2.
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 4709590..c32ebc7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -57,12 +57,6 @@
 	};
 };
 
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pins_a>;
-	status = "okay";
-};
-
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins>;
@@ -72,3 +66,9 @@
 &i2c1_pins {
 	bias-pull-up;
 };
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins_a>;
+	status = "okay";
+};
-- 
2.10.2
