From: Kapil Hali <kapilh@broadcom.com>
Subject: [PATCH 2/3] ARM: dts: add SMP support for Broadcom NSP
Date: Wed, 14 Oct 2015 13:46:59 -0400
Message-ID: <1444844820-24290-3-git-send-email-kapilh@broadcom.com>
References: <1444844820-24290-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444844820-24290-1-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kapil Hali <kapilh@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add device tree changes required for providing SMP support
for Broadcom Northstar Plus SoC.

Signed-off-by: Kapil Hali <kapilh@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 58aca27..d1875d9 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -40,24 +40,33 @@
 	model = "Broadcom Northstar Plus SoC";
 	interrupt-parent = <&gic>;
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "brcm,bcm-nsp-smp";
+		secondary-boot-reg = <0xffff042c>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <0x0>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			next-level-cache = <&L2>;
+			reg = <0x1>;
+		};
+	};
+
 	mpcore {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19020000 0x00003000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		cpus {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a9";
-				next-level-cache = <&L2>;
-				reg = <0x0>;
-			};
-		};
-
 		L2: l2-cache {
 			compatible = "arm,pl310-cache";
 			reg = <0x2000 0x1000>;
-- 
2.1.0
