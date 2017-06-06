From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 17/28] ARM64: dts: actions: s900-bubblegum-96: Add fake uart5 clock
Date: Tue,  6 Jun 2017 02:54:15 +0200
Message-ID: <20170606005426.26446-18-afaerber@suse.de>
References: <20170606005426.26446-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170606005426.26446-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mp-cs@actions-semi.com, Thomas Liau <thomas.liau@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Give the serial driver a fixed-clock as input for baudrate 115200.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2 -> v3 -> v4: unchanged
 
 v2: new
 
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
index a0c3484dbd12..21ca80f9941c 100644
--- a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
+++ b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
@@ -24,6 +24,12 @@
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
 
 &timer {
@@ -32,4 +38,5 @@
 
 &uart5 {
 	status = "okay";
+	clocks = <&uart5_clk>;
 };
-- 
2.12.3
