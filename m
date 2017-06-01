From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v3 4/9] dt-bindings: cp110: introduce a new binding
Date: Thu,  1 Jun 2017 16:55:37 +0200
Message-ID: <b27495e10fb4f4d8a7fd1a760d49402bbae83b58.1496328934.git-series.gregory.clement@free-electrons.com>
References: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
References: <cover.6bb422e6a233460049bb63792b32a5ba851dcddd.1496328934.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch updates the documentation according to the change made in the
patch "pinctrl: dt-bindings: cp110: introduce a new binding".

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index dbd0a38ca580..e97cc2d73e2e 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -7,6 +7,13 @@ Controller 0 and System Controller 1. This Device Tree binding allows
 to describe the first system controller, which provides registers to
 configure various aspects of the SoC.
 
+For the top level node:
+ - compatible: must be: "syscon", "simple-mfd";
+ - reg: register area of the CP110 system controller 0
+
+Clocks:
+-------
+
 The Device Tree node representing this System Controller 0 provides a
 number of clocks:
 
@@ -56,14 +63,17 @@ The following clocks are available:
 Required properties:
 
  - compatible: must be:
-     "marvell,cp110-system-controller0", "syscon";
- - reg: register area of the CP110 system controller 0
+     "marvell,cp110-clock"
  - #clock-cells: must be set to 2
 
 Example:
 
 	cpm_syscon0: system-controller@440000 {
-		compatible = "marvell,cp110-system-controller0", "syscon";
+		compatible = "syscon", "simple-mfd";
 		reg = <0x440000 0x1000>;
-		#clock-cells = <2>;
+
+		cpm_clk: clock {
+			compatible = "marvell,cp110-clock";
+			#clock-cells = <2>;
+		};
 	};
-- 
git-series 0.9.1
