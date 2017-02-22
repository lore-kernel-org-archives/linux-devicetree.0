From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 8/8] ARM64: dts: marvell: iap140-andromeda-box-edge: Add uart0 clock
Date: Wed, 22 Feb 2017 03:29:28 +0100
Message-ID: <20170222022929.10540-9-afaerber@suse.de>
References: <20170222022929.10540-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170222022929.10540-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, info@andromedabox.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use a fixed clock to enable ttyS0 output.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2: unchanged
 
 arch/arm64/boot/dts/marvell/iap140-andromeda-box-edge.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/iap140-andromeda-box-edge.dts b/arch/arm64/boot/dts/marvell/iap140-andromeda-box-edge.dts
index 0b0b150..15ad0f3 100644
--- a/arch/arm64/boot/dts/marvell/iap140-andromeda-box-edge.dts
+++ b/arch/arm64/boot/dts/marvell/iap140-andromeda-box-edge.dts
@@ -63,6 +63,12 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	uart0_clk: uart0-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <14740000>;
+		#clock-cells = <0>;
+	};
 };
 
 &pmx {
@@ -77,4 +83,5 @@
 
 &uart0 {
 	status = "okay";
+	clocks = <&uart0_clk>;
 };
-- 
2.10.2
