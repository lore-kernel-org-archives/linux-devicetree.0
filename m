From: <sean.wang@mediatek.com>
Subject: [PATCH v2 01/16] dt-bindings: clock: mediatek: add missing required
 #reset-cells
Date: Tue, 6 Feb 2018 17:52:50 +0800
Message-ID: <d58fcf36319254d6de4c7fe100cbdca1bbec27a5.1517910489.git.sean.wang@mediatek.com>
References: <cover.1517910489.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1517910489.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

All ethsys, pciesys and ssusbsys internally include reset controller, so
explicitly add back these missing cell definitions to related bindings
and examples.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt   | 2 ++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt  | 2 ++
 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
index 7aa3fa1..8f5335b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt2701-ethsys", "syscon"
 	- "mediatek,mt7622-ethsys", "syscon"
 - #clock-cells: Must be 1
+- #reset-cells: Must be 1
 
 The ethsys controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -20,4 +21,5 @@ ethsys: clock-controller@1b000000 {
 	compatible = "mediatek,mt2701-ethsys", "syscon";
 	reg = <0 0x1b000000 0 0x1000>;
 	#clock-cells = <1>;
+	#reset-cells = <1>;
 };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
index d5d5f12..7fe5dc6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
@@ -8,6 +8,7 @@ Required Properties:
 - compatible: Should be:
 	- "mediatek,mt7622-pciesys", "syscon"
 - #clock-cells: Must be 1
+- #reset-cells: Must be 1
 
 The PCIESYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -19,4 +20,5 @@ pciesys: pciesys@1a100800 {
 	compatible = "mediatek,mt7622-pciesys", "syscon";
 	reg = <0 0x1a100800 0 0x1000>;
 	#clock-cells = <1>;
+	#reset-cells = <1>;
 };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
index 00760019..b8184da 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
@@ -8,6 +8,7 @@ Required Properties:
 - compatible: Should be:
 	- "mediatek,mt7622-ssusbsys", "syscon"
 - #clock-cells: Must be 1
+- #reset-cells: Must be 1
 
 The SSUSBSYS controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -19,4 +20,5 @@ ssusbsys: ssusbsys@1a000000 {
 	compatible = "mediatek,mt7622-ssusbsys", "syscon";
 	reg = <0 0x1a000000 0 0x1000>;
 	#clock-cells = <1>;
+	#reset-cells = <1>;
 };
-- 
2.7.4
