Return-Path: <SRS0=d+eE=TJ=renesas.com=prvs=4032988503=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 01/15] ARM: dts: r7s9210: Add USB clock
Date: Thu, 9 May 2019 15:11:28 -0500
Message-ID: <20190509201142.10543-2-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Add USB clock node. If present, this clock input must be 48MHz.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 2eaa5eeba509..73041f04fef5 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -30,6 +30,13 @@
 		clock-frequency = <0>;
 	};
 
+	usb_x1_clk: usb_x1 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		/* If clk present, value (48000000) must be set by board */
+		clock-frequency = <0>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.16.1
