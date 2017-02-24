From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 16/17] ARM64: dts: actions: s900-bubblegum-96: Add fake uart5 clk
Date: Fri, 24 Feb 2017 04:40:54 +0100
Message-ID: <20170224034055.18807-17-afaerber@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170224034055.18807-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Give the serial driver a fixed-clock as input for baudrate 115200.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2: new
 
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
index a4ab7df..e25f606 100644
--- a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
+++ b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
@@ -24,8 +24,15 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
+
+	uart5_clk: uart5-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <921600>;
+		#clock-cells = <0>;
+	};
 };
 
 &uart5 {
 	status = "okay";
+	clocks = <&uart5_clk>;
 };
-- 
2.10.2
