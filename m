From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 18/25] ARM: dts: s500-guitar-bb-rev-b: Add fake uart3 clock
Date: Tue, 28 Feb 2017 07:35:28 +0100
Message-ID: <20170228063535.32069-19-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a fixed-clock for baudrate 115200.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2 -> v3: unchanged
 
 v2: new
 
 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts b/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
index 834b71d..f6fd10a 100644
--- a/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
+++ b/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
@@ -19,8 +19,15 @@
 	chosen {
 		stdout-path = "serial3:115200n8";
 	};
+
+	uart3_clk: uart3-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <921600>;
+		#clock-cells = <0>;
+	};
 };
 
 &uart3 {
 	status = "okay";
+	clocks = <&uart3_clk>;
 };
-- 
2.10.2
