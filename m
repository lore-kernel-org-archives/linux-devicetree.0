From: Louis Yu <louis.yu@mediatek.com>
Subject: [PATCH 2/2] ARM: dts: mt2701: enable basic SMP bringup for mt2701
Date: Thu, 7 Jan 2016 20:09:44 +0800
Message-ID: <1452168584-25394-3-git-send-email-louis.yu@mediatek.com>
References: <1452168584-25394-1-git-send-email-louis.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452168584-25394-1-git-send-email-louis.yu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, srv_heupstream@mediatek.com, erin.lo@mediatek.com, yingjoe.chen@mediatek.com, louis.yu@mediatek.com
List-Id: devicetree@vger.kernel.org

Add enable method to support SMP.

Signed-off-by: Louis Yu <louis.yu@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 69f240f..1d72d82 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -23,6 +23,7 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt81xx-tz-smp";
 
 		cpu@0 {
 			device_type = "cpu";
@@ -46,6 +47,17 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		trustzone-bootinfo@80002000 {
+			compatible = "mediatek,trustzone-bootinfo";
+			reg = <0 0x80002000 0 0x1000>;
+		};
+	};
+
 	system_clk: dummy13m {
 		compatible = "fixed-clock";
 		clock-frequency = <13000000>;
-- 
1.7.9.5
