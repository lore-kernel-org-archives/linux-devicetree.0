From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 22/25] dt-bindings: power: Add Owl SPS power domains
Date: Tue, 28 Feb 2017 07:35:32 +0100
Message-ID: <20170228063535.32069-23-afaerber@suse.de>
References: <20170228063535.32069-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170228063535.32069-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, support@lemaker.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define power domains for all non-reserved S500 power gates.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v3: new
 
 .../devicetree/bindings/power/actions,owl-sps.txt     | 17 +++++++++++++++++
 include/dt-bindings/power/s500-powergate.h            | 19 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
 create mode 100644 include/dt-bindings/power/s500-powergate.h

diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
new file mode 100644
index 0000000..c5eed06
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
@@ -0,0 +1,17 @@
+Actions Semi Owl Smart Power System (SPS)
+
+Required properties:
+- compatible          :  "actions,s500-sps" for S500
+- reg                 :  Offset and length of the register set for the device.
+- #power-domain-cells :  Must be 1.
+                         See macros in:
+                          include/dt-bindings/power/s500-powergate.h for S500
+
+
+Example:
+
+		sps: power-controller@b01b0100 {
+			compatible = "actions,s500-sps";
+			reg = <0xb01b0100 0x100>;
+			#power-domain-cells = <1>;
+		};
diff --git a/include/dt-bindings/power/s500-powergate.h b/include/dt-bindings/power/s500-powergate.h
new file mode 100644
index 0000000..ccc4ac3
--- /dev/null
+++ b/include/dt-bindings/power/s500-powergate.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+#ifndef DT_BINDINGS_POWER_S500_POWERGATE_H
+#define DT_BINDINGS_POWER_S500_POWERGATE_H
+
+#define S500_PD_VDE	0
+#define S500_PD_VCE_SI	1
+#define S500_PD_USB2_1	2
+#define S500_PD_CPU2	3
+#define S500_PD_CPU3	4
+#define S500_PD_DMA	5
+#define S500_PD_DS	6
+#define S500_PD_USB3	7
+#define S500_PD_USB2_0	8
+
+#endif
-- 
2.10.2
