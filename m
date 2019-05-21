From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 2/2] dt-bindings: arm: Clean up CPU binding examples
Date: Tue, 21 May 2019 17:44:27 +0100
Message-ID: <fe070f591d5e07042062b6b07a701feab324ee2c.1558456785.git.robin.murphy@arm.com>
References: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50fbe259ee5951e32221af457737b7d970be9f32.1558456785.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Following commit 31af04cd60d3 ("arm64: dts: Remove inconsistent use of
'arm,armv8' compatible string"), clean up these binding examples in case
anyone is tempted to copy them.

CC: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 Documentation/devicetree/bindings/arm/arm-boards     |  4 ++--
 .../devicetree/bindings/arm/cpu-capacity.txt         | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documentation/devicetree/bindings/arm/arm-boards
index b6e810c2781a..abff8d834a6a 100644
--- a/Documentation/devicetree/bindings/arm/arm-boards
+++ b/Documentation/devicetree/bindings/arm/arm-boards
@@ -216,7 +216,7 @@ Example:
 		#size-cells = <0>;
 
 		A57_0: cpu@0 {
-			compatible = "arm,cortex-a57","arm,armv8";
+			compatible = "arm,cortex-a57";
 			reg = <0x0 0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
@@ -225,7 +225,7 @@ Example:
 		.....
 
 		A53_0: cpu@100 {
-			compatible = "arm,cortex-a53","arm,armv8";
+			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			device_type = "cpu";
 			enable-method = "psci";
diff --git a/Documentation/devicetree/bindings/arm/cpu-capacity.txt b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
index 96fa46cb133c..380e21c5fc7e 100644
--- a/Documentation/devicetree/bindings/arm/cpu-capacity.txt
+++ b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
@@ -118,7 +118,7 @@ cpus {
 	};
 
 	A57_0: cpu@0 {
-		compatible = "arm,cortex-a57","arm,armv8";
+		compatible = "arm,cortex-a57";
 		reg = <0x0 0x0>;
 		device_type = "cpu";
 		enable-method = "psci";
@@ -129,7 +129,7 @@ cpus {
 	};
 
 	A57_1: cpu@1 {
-		compatible = "arm,cortex-a57","arm,armv8";
+		compatible = "arm,cortex-a57";
 		reg = <0x0 0x1>;
 		device_type = "cpu";
 		enable-method = "psci";
@@ -140,7 +140,7 @@ cpus {
 	};
 
 	A53_0: cpu@100 {
-		compatible = "arm,cortex-a53","arm,armv8";
+		compatible = "arm,cortex-a53";
 		reg = <0x0 0x100>;
 		device_type = "cpu";
 		enable-method = "psci";
@@ -151,7 +151,7 @@ cpus {
 	};
 
 	A53_1: cpu@101 {
-		compatible = "arm,cortex-a53","arm,armv8";
+		compatible = "arm,cortex-a53";
 		reg = <0x0 0x101>;
 		device_type = "cpu";
 		enable-method = "psci";
@@ -162,7 +162,7 @@ cpus {
 	};
 
 	A53_2: cpu@102 {
-		compatible = "arm,cortex-a53","arm,armv8";
+		compatible = "arm,cortex-a53";
 		reg = <0x0 0x102>;
 		device_type = "cpu";
 		enable-method = "psci";
@@ -173,7 +173,7 @@ cpus {
 	};
 
 	A53_3: cpu@103 {
-		compatible = "arm,cortex-a53","arm,armv8";
+		compatible = "arm,cortex-a53";
 		reg = <0x0 0x103>;
 		device_type = "cpu";
 		enable-method = "psci";
-- 
2.21.0.dirty
