From: Alban Bedel <alban.bedel@avionic-design.de>
Subject: [PATCH 3/4] devicetree: add a binding for a group of regulator
Date: Mon, 24 Nov 2014 14:02:02 +0100
Message-ID: <1416834123-23139-3-git-send-email-alban.bedel@avionic-design.de>
References: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416834123-23139-1-git-send-email-alban.bedel@avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
---
 .../devicetree/bindings/regulator/group.txt        | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/group.txt

diff --git a/Documentation/devicetree/bindings/regulator/group.txt b/Documentation/devicetree/bindings/regulator/group.txt
new file mode 100644
index 0000000..5f811cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/group.txt
@@ -0,0 +1,26 @@
+Regulator Group
+
+This binding allow creating a group of regulators for use with simple
+drivers that only expect a single power supply. Additionally it is
+possible to enforce the enable ordering to create simple power up
+sequences.
+
+Required properties:
+- compatible : Must be "regulator-group".
+- regulator-supplies : List of the supplies names.
+- <name>-supply : One entry for each supply defined in regulator-supplies.
+
+Optional properties:
+- ordered-supplies : set if the supplies should be enabled in order,
+   otherwise they are all enable or disabled in parallel.
+- any property defined in regulator.txt
+
+Example:
+
+  regulator {
+	compatible = "regulator-group";
+	regulator-supplies = "vcc_a", "vcc_b";
+	vcc_a-supply = <&vcc_a>;
+	vcc_b-supply = <&vcc_b>;
+	ordered-supplies;
+  };
-- 
2.1.3
