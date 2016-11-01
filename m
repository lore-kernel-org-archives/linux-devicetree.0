From: Youlin Pei <youlin.pei@mediatek.com>
Subject: [PATCH v2 3/3] ARM: dts: mt2701: Add mtk-cirq node for mt2701
Date: Tue, 1 Nov 2016 19:52:02 +0800
Message-ID: <1478001122-8664-4-git-send-email-youlin.pei@mediatek.com>
References: <1478001122-8664-1-git-send-email-youlin.pei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478001122-8664-1-git-send-email-youlin.pei@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: youlin.pei@mediatek.com, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, hongkun.cao@mediatek.com, yong.wu@mediatek.com, erin.lo@mediatek.com, chieh-jay.liu@mediatek.com
List-Id: devicetree@vger.kernel.org

This commit add mtk-cirq node to mt2701 dtsi.

Signed-off-by: Youlin Pei <youlin.pei@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 2800231..cd00bc4 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -22,7 +22,7 @@
 
 / {
 	compatible = "mediatek,mt2701";
-	interrupt-parent = <&sysirq>;
+	interrupt-parent = <&cirq>;
 
 	cpus {
 		#address-cells = <1>;
@@ -170,6 +170,15 @@
 		reg = <0 0x10200100 0 0x1c>;
 	};
 
+	cirq: interrupt-controller@10204000 {
+		compatible = "mediatek,mtk-cirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&sysirq>;
+		reg = <0 0x10204000 0 0x4000>;
+		mediatek,ext-irq-start = <32>;
+	};
+
 	apmixedsys: syscon@10209000 {
 		compatible = "mediatek,mt2701-apmixedsys", "syscon";
 		reg = <0 0x10209000 0 0x1000>;
-- 
1.7.9.5
