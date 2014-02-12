From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v6 2/6] spmi: add generic SPMI controller binding documentation
Date: Wed, 12 Feb 2014 13:44:23 -0600
Message-ID: <1392234267-10880-3-git-send-email-joshc@codeaurora.org>
References: <1392234267-10880-1-git-send-email-joshc@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392234267-10880-1-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, Gilad Avidov <gavidov@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 Documentation/devicetree/bindings/spmi/spmi.txt | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/spmi.txt

diff --git a/Documentation/devicetree/bindings/spmi/spmi.txt b/Documentation/devicetree/bindings/spmi/spmi.txt
new file mode 100644
index 0000000..462a42f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/spmi.txt
@@ -0,0 +1,41 @@
+System Power Management Interface (SPMI) Controller
+
+This document defines a generic set of bindings for use by SPMI controllers.  A
+controller is modelled in device tree as a node with zero or more child nodes,
+each representing a unique slave on the bus.
+
+Required properties:
+- #address-cells : must be set to 2
+- #size-cells : must be set to 0
+
+Child nodes:
+
+An SPMI controller node can contain zero or more child nodes representing slave
+devices on the bus.  Child 'reg' properties are specified as an address, type
+pair.  The address must be in the range 0-15 (4 bits).  The type must be one of
+SPMI_USID (0) or SPMI_GSID (1) for Unique Slave ID or Group Slave ID respectively.
+These are the identifiers "statically assigned by the system integrator", as
+per the SPMI spec.
+
+Each child node must have one and only one 'reg' entry of type SPMI_USID.
+
+#include <dt-bindings/spmi/spmi.h>
+
+	spmi@.. {
+		compatible = "...";
+		reg = <...>;
+
+		#address-cells = <2>;
+		#size-cells <0>;
+
+		child@0 {
+			compatible = "...";
+			reg = <0 SPMI_USID>;
+		};
+
+		child@7 {
+			compatible = "...";
+			reg = <7 SPMI_USID
+			       3 SPMI_GSID>;
+		};
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
