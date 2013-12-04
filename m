From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 3/7] dt-bindings: Add Calxeda system registers binding
Date: Wed,  4 Dec 2013 17:35:23 -0600
Message-ID: <1386200127-23143-4-git-send-email-robherring2@gmail.com>
References: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386200127-23143-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mike Turquette <mturquette@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Add bindings for Calxeda system registers. "calxeda,hb-sregs" has been in
use by the kernel for some time, but has been undocumented. Add the
missing documentation and add the new compatible string for ECX-3000
series.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
---
 Documentation/devicetree/bindings/arm/calxeda/sregs.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda/sregs.txt

diff --git a/Documentation/devicetree/bindings/arm/calxeda/sregs.txt b/Documentation/devicetree/bindings/arm/calxeda/sregs.txt
new file mode 100644
index 0000000..d78e176
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/calxeda/sregs.txt
@@ -0,0 +1,17 @@
+Calxeda System Registers
+
+Properties:
+- compatible : Should be one of:
+	"calxeda,hb-sregs"
+	"calxeda,ecx-3000-sregs"
+- reg : Address and size for SREGs registers.
+
+Subnodes:
+Clocks are specified under "clocks" subnode.
+
+Example:
+
+	sregs@fff3c000 {
+		compatible = "calxeda,hb-sregs";
+		reg = <0xfff3c000 0x1000>;
+	};
-- 
1.8.3.2
