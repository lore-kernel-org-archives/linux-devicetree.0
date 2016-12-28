From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH 2/3] arm: dts: mt2701: Add subsystem clock controller device nodes
Date: Wed, 28 Dec 2016 13:46:45 +0800
Message-ID: <1482904006-44232-3-git-send-email-jamesjj.liao@mediatek.com>
References: <1482904006-44232-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482904006-44232-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

Add MT2701 subsystem clock controllers, inlcude mmsys, imgsys,
vdecsys, hifsys, ethsys and bdpsys.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 73f4b7c..150c48d 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -214,4 +214,40 @@
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
+
+	mmsys: syscon@14000000 {
+		compatible = "mediatek,mt2701-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: syscon@15000000 {
+		compatible = "mediatek,mt2701-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: syscon@16000000 {
+		compatible = "mediatek,mt2701-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	hifsys: syscon@1a000000 {
+		compatible = "mediatek,mt2701-hifsys", "syscon";
+		reg = <0 0x1a000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	ethsys: syscon@1b000000 {
+		compatible = "mediatek,mt2701-ethsys", "syscon";
+		reg = <0 0x1b000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	bdpsys: syscon@1c000000 {
+		compatible = "mediatek,mt2701-bdpsys", "syscon";
+		reg = <0 0x1c000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
 };
-- 
1.9.1
