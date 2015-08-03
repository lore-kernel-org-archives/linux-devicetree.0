From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 1/3] devicetree: Add bindings for the ATH79 reset controller
Date: Mon,  3 Aug 2015 19:23:51 +0200
Message-ID: <1438622633-9407-2-git-send-email-albeu@free.fr>
References: <1438622633-9407-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438622633-9407-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 .../devicetree/bindings/reset/ath79-reset.txt        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ath79-reset.txt

diff --git a/Documentation/devicetree/bindings/reset/ath79-reset.txt b/Documentation/devicetree/bindings/reset/ath79-reset.txt
new file mode 100644
index 0000000..4c56330
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ath79-reset.txt
@@ -0,0 +1,20 @@
+Binding for Qualcomm Atheros AR7xxx/AR9XXX reset controller
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required Properties:
+- compatible: has to be "qca,<soctype>-reset", "qca,ar7100-reset"
+              as fallback
+- reg: Base address and size of the controllers memory area
+- #reset-cells : Specifies the number of cells needed to encode reset
+                 line, should be 1
+
+Example:
+
+	reset-controller@1806001c {
+		compatible = "qca,ar9132-reset", "qca,ar7100-reset";
+		reg = <0x1806001c 0x4>;
+
+		#reset-cells = <1>;
+	};
-- 
2.0.0
