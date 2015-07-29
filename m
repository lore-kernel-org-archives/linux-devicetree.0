From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH v5 07/10] dt-bindings: ARM: Mediatek: Document devicetree bindings for clock controllers
Date: Wed, 29 Jul 2015 14:52:31 +0800
Message-ID: <1438152754-11970-8-git-send-email-jamesjj.liao@mediatek.com>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>
Cc: srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds the binding documentation for the mmsys, imgsys, vdecsys,
vencsys and vencltsys controllers found on Mediatek SoCs.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,imgsys.txt      | 22 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,mmsys.txt       | 22 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     | 22 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   | 22 ++++++++++++++++++++++
 .../bindings/arm/mediatek/mediatek,vencsys.txt     | 22 ++++++++++++++++++++++
 5 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
new file mode 100644
index 0000000..b1f2ce1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -0,0 +1,22 @@
+Mediatek imgsys controller
+============================
+
+The Mediatek imgsys controller provides various clocks to the system.
+
+Required Properties:
+
+- compatible: Should be:
+	- "mediatek,mt8173-imgsys", "syscon"
+- #clock-cells: Must be 1
+
+The imgsys controller uses the common clk binding from
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+Example:
+
+imgsys: clock-controller@15000000 {
+	compatible = "mediatek,mt8173-imgsys", "syscon";
+	reg = <0 0x15000000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
new file mode 100644
index 0000000..4385946
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -0,0 +1,22 @@
+Mediatek mmsys controller
+============================
+
+The Mediatek mmsys controller provides various clocks to the system.
+
+Required Properties:
+
+- compatible: Should be:
+	- "mediatek,mt8173-mmsys", "syscon"
+- #clock-cells: Must be 1
+
+The mmsys controller uses the common clk binding from
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+Example:
+
+mmsys: clock-controller@14000000 {
+	compatible = "mediatek,mt8173-mmsys", "syscon";
+	reg = <0 0x14000000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
new file mode 100644
index 0000000..1faacf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -0,0 +1,22 @@
+Mediatek vdecsys controller
+============================
+
+The Mediatek vdecsys controller provides various clocks to the system.
+
+Required Properties:
+
+- compatible: Should be:
+	- "mediatek,mt8173-vdecsys", "syscon"
+- #clock-cells: Must be 1
+
+The vdecsys controller uses the common clk binding from
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+Example:
+
+vdecsys: clock-controller@16000000 {
+	compatible = "mediatek,mt8173-vdecsys", "syscon";
+	reg = <0 0x16000000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
new file mode 100644
index 0000000..3cc299f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
@@ -0,0 +1,22 @@
+Mediatek vencltsys controller
+============================
+
+The Mediatek vencltsys controller provides various clocks to the system.
+
+Required Properties:
+
+- compatible: Should be:
+	- "mediatek,mt8173-vencltsys", "syscon"
+- #clock-cells: Must be 1
+
+The vencltsys controller uses the common clk binding from
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+Example:
+
+vencltsys: clock-controller@19000000 {
+	compatible = "mediatek,mt8173-vencltsys", "syscon";
+	reg = <0 0x19000000 0 0x1000>;
+	#clock-cells = <1>;
+};
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
new file mode 100644
index 0000000..5bb2866
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
@@ -0,0 +1,22 @@
+Mediatek vencsys controller
+============================
+
+The Mediatek vencsys controller provides various clocks to the system.
+
+Required Properties:
+
+- compatible: Should be:
+	- "mediatek,mt8173-vencsys", "syscon"
+- #clock-cells: Must be 1
+
+The vencsys controller uses the common clk binding from
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+Example:
+
+vencsys: clock-controller@18000000 {
+	compatible = "mediatek,mt8173-vencsys", "syscon";
+	reg = <0 0x18000000 0 0x1000>;
+	#clock-cells = <1>;
+};
-- 
1.8.1.1.dirty
