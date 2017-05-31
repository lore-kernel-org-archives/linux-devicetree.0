From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 06/11] dt-bindings: cp110: introduce a new binding
Date: Wed, 31 May 2017 15:41:50 +0200
Message-ID: <c61078390c9454808d7b734ccea105d8fb9b8d41.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
References: <cover.d3a417499f4e5f039deaa27832bf6eccdd090a6f.1496237893.git-series.gregory.clement@free-electrons.com>
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
index 47f1cf800e25..139e46cc6786 100644
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
