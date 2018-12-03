From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 25/34] dt-bindings: arm: renesas: Move 'renesas,prr' binding to its own doc
Date: Mon,  3 Dec 2018 15:32:14 -0600
Message-ID: <20181203213223.16986-26-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In preparation to convert board-level bindings to json-schema, move
various misc SoC bindings out to their own file.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/renesas,prr.txt   | 20 +++++++++++++++++++
 .../devicetree/bindings/arm/shmobile.txt      | 18 -----------------
 2 files changed, 20 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/renesas,prr.txt

diff --git a/Documentation/devicetree/bindings/arm/renesas,prr.txt b/Documentation/devicetree/bindings/arm/renesas,prr.txt
new file mode 100644
index 000000000000..08e482e953ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/renesas,prr.txt
@@ -0,0 +1,20 @@
+Renesas Product Register
+
+Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
+allows to retrieve SoC product and revision information.  If present, a device
+node for this register should be added.
+
+Required properties:
+  - compatible: Must be one of:
+    "renesas,prr"
+    "renesas,bsid"
+  - reg: Base address and length of the register block.
+
+
+Examples
+--------
+
+	prr: chipid@ff000044 {
+		compatible = "renesas,prr";
+		reg = <0 0xff000044 0 4>;
+	};
diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 58c4256d37a3..5f18ce9cdbb8 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -149,21 +149,3 @@ Boards:
     compatible = "renesas,v3msk", "renesas,r8a77970"
   - Wheat (RTP0RC7792ASKB0000JE)
     compatible = "renesas,wheat", "renesas,r8a7792"
-
-
-Most Renesas ARM SoCs have a Product Register or Boundary Scan ID Register that
-allows to retrieve SoC product and revision information.  If present, a device
-node for this register should be added.
-
-Required properties:
-  - compatible: Must be "renesas,prr" or "renesas,bsid"
-  - reg: Base address and length of the register block.
-
-
-Examples
---------
-
-	prr: chipid@ff000044 {
-		compatible = "renesas,prr";
-		reg = <0 0xff000044 0 4>;
-	};
-- 
2.19.1
