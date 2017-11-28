From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH 08/13] dt-bindings: mips: Add bindings for Microsemi SoCs
Date: Tue, 28 Nov 2017 16:26:38 +0100
Message-ID: <20171128152643.20463-9-alexandre.belloni@free-electrons.com>
References: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings for Microsemi SoCs. Currently only Ocelot is supported.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

 Documentation/devicetree/bindings/mips/mscc.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/mscc.txt

diff --git a/Documentation/devicetree/bindings/mips/mscc.txt b/Documentation/devicetree/bindings/mips/mscc.txt
new file mode 100644
index 000000000000..2c52e76b7142
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/mscc.txt
@@ -0,0 +1,6 @@
+* Microsemi MIPS CPUs
+
+Required properties:
+- compatible: "brcm,ocelot"
+
+- mips-hpt-frequency: CPU counter frequency.
-- 
2.15.0
