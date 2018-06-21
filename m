From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux-next v6 07/13] dt-bindings: mfd: Add a document for PECI client MFD
Date: Thu, 21 Jun 2018 12:40:54 -0700
Message-ID: <20180621194054.20897-1-jae.hyun.yoo@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

This commit adds a dt-bindings document for PECI client MFD.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt

diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
new file mode 100644
index 000000000000..cb341e363add
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
@@ -0,0 +1,34 @@
+* Intel PECI client bindings
+
+PECI (Platform Environment Control Interface) is a one-wire bus interface that
+provides a communication channel from PECI clients in Intel processors and
+chipset components to external monitoring or control devices. PECI is designed
+to support the following sideband functions:
+
+- Processor and DRAM thermal management
+- Platform Manageability
+- Processor Interface Tuning and Diagnostics
+- Failure Analysis
+
+Required properties:
+- compatible : Should be "intel,peci-client".
+- reg        : Should contain address of a client CPU. Address range of CPU
+	       clients starts from 0x30 based on PECI specification.
+
+Example:
+	peci-bus@0 {
+		compatible = "vendor,soc-peci";
+		reg = <0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		peci-client@30 {
+			compatible = "intel,peci-client";
+			reg = <0x30>;
+		};
+
+		peci-client@31 {
+			compatible = "intel,peci-client";
+			reg = <0x31>;
+		};
+	};
-- 
2.17.1
