From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 2/3] ARM: dts: keystone: Header file for pinctrl constants
Date: Thu,  9 Jun 2016 10:26:17 -0500
Message-ID: <1465485978-27910-3-git-send-email-fcooper@ti.com>
References: <1465485978-27910-1-git-send-email-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465485978-27910-1-git-send-email-fcooper@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ssantosh@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>, Franklin S Cooper Jr <fcooper@ti.com>, Dave Gerlach <d-gerlach@ti.com>
List-Id: devicetree@vger.kernel.org

From: Lokesh Vutla <lokeshvutla@ti.com>

The pinctrl IP used in some of the Keystone 2 devices differ vs other
TI SoCs. Therefore, create a Keystone specific pinctrl header.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi    |  1 +
 include/dt-bindings/pinctrl/keystone.h | 39 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/pinctrl/keystone.h

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index b99e879..3372615 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -14,6 +14,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/keystone.h>
 #include "skeleton.dtsi"
 
 / {
diff --git a/include/dt-bindings/pinctrl/keystone.h b/include/dt-bindings/pinctrl/keystone.h
new file mode 100644
index 0000000..7f97d77
--- /dev/null
+++ b/include/dt-bindings/pinctrl/keystone.h
@@ -0,0 +1,39 @@
+/*
+ * This header provides constants for Keystone pinctrl bindings.
+ *
+ * Copyright (C) 2016 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_KEYSTONE_H
+#define _DT_BINDINGS_PINCTRL_KEYSTONE_H
+
+#define MUX_MODE0	0
+#define MUX_MODE1	1
+#define MUX_MODE2	2
+#define MUX_MODE3	3
+#define MUX_MODE4	4
+#define MUX_MODE5	5
+
+#define BUFFER_CLASS_B	(0 << 19)
+#define BUFFER_CLASS_C	(1 << 19)
+#define BUFFER_CLASS_D	(2 << 19)
+#define BUFFER_CLASS_E	(3 << 19)
+
+#define PULL_DISABLE	(1 << 16)
+#define PIN_PULLUP	(1 << 17)
+#define PIN_PULLDOWN	(0 << 17)
+
+#define KEYSTONE_IOPAD_OFFSET(pa, offset) (((pa) & 0xffff) - (offset))
+
+#define K2G_CORE_IOPAD(pa) KEYSTONE_IOPAD_OFFSET((pa), 0x1000)
+
+#endif
-- 
2.7.0
