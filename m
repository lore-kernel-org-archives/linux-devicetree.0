From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 6/8] dt-bindings: power: Add Actions Semi S700 SPS
Date: Tue, 14 Nov 2017 00:34:25 +0100
Message-ID: <20171113233427.5386-7-afaerber@suse.de>
References: <20171113233427.5386-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113233427.5386-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, support@cubietech.com, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define power domains for Actions Semi S700 SoC Smart Power System (SPS).

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v2: New
 
 .../devicetree/bindings/power/actions,owl-sps.txt    |  2 ++
 include/dt-bindings/power/owl-s700-powergate.h       | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/power/owl-s700-powergate.h

diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
index 007b9a7ae723..78edd63641e8 100644
--- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
+++ b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
@@ -2,10 +2,12 @@ Actions Semi Owl Smart Power System (SPS)
 
 Required properties:
 - compatible          :  "actions,s500-sps" for S500
+                         "actions,s700-sps" for S700
 - reg                 :  Offset and length of the register set for the device.
 - #power-domain-cells :  Must be 1.
                          See macros in:
                           include/dt-bindings/power/owl-s500-powergate.h for S500
+                          include/dt-bindings/power/owl-s700-powergate.h for S700
 
 
 Example:
diff --git a/include/dt-bindings/power/owl-s700-powergate.h b/include/dt-bindings/power/owl-s700-powergate.h
new file mode 100644
index 000000000000..4ded16bc074f
--- /dev/null
+++ b/include/dt-bindings/power/owl-s700-powergate.h
@@ -0,0 +1,20 @@
+/*
+ * Actions Semi S700 SPS
+ *
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+#ifndef DT_BINDINGS_POWER_OWL_S700_POWERGATE_H
+#define DT_BINDINGS_POWER_OWL_S700_POWERGATE_H
+
+#define S700_PD_VDE	0
+#define S700_PD_VCE_SI	1
+#define S700_PD_USB2_1	2
+#define S700_PD_HDE	3
+#define S700_PD_DMA	4
+#define S700_PD_DS	5
+#define S700_PD_USB3	6
+#define S700_PD_USB2_0	7
+
+#endif
-- 
2.13.6
