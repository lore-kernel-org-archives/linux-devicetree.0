From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: amlogic,
 gxbb-aoclkc: Update bindings
Date: Fri, 28 Jul 2017 11:53:06 +0200
Message-ID: <1501235589-318-2-git-send-email-narmstrong@baylibre.com>
References: <1501235589-318-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501235589-318-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jbrunet@baylibre.com, narmstrong@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On the first revision of the bindings, only the gates + resets were known
in the AO Clock HW, but more registers used to configures AO clock are known
to be spread among the AO register space.
This patch adds a parent node for the entire system control zone for the AO
domain then moves the clock controller as a subnode of the system control
node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index a55d31b..64884ed 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -5,9 +5,11 @@ controllers within the Always-On part of the SoC.
 
 Required Properties:
 
-- compatible: should be "amlogic,gxbb-aoclkc"
-- reg: physical base address of the clock controller and length of memory
-       mapped region.
+- compatible: value should be different for each SoC family as :
+	- GXBB (S905) : "amlogic,meson-gxbb-aoclkc"
+	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
+	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
+	followed by the common "amlogic,meson-gx-aoclkc"
 
 - #clock-cells: should be 1.
 
@@ -23,14 +25,22 @@ to specify the reset which they consume. All available resets are defined as
 preprocessor macros in the dt-bindings/reset/gxbb-aoclkc.h header and can be
 used in device tree sources.
 
+Parent node should have the following properties :
+- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
+- reg: base address and size of the AO system control register space.
+
 Example: AO Clock controller node:
 
-	clkc_AO: clock-controller@040 {
-		compatible = "amlogic,gxbb-aoclkc";
-		reg = <0x0 0x040 0x0 0x4>;
+ao_sysctrl: sys-ctrl@0 {
+	compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
+	reg =  <0x0 0x0 0x0 0x100>;
+
+	clkc_AO: clock-controller {
+		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
+};
 
 Example: UART controller node that consumes the clock and reset generated
   by the clock controller:
-- 
1.9.1
