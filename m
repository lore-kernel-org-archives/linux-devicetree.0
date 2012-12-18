From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 2/6] ARM: opcodes: add opcodes definitions for ARM security
 extensions
Date: Tue, 18 Dec 2012 17:53:12 +0000
Message-ID: <1355853196-23676-3-git-send-email-will.deacon@arm.com>
References: <1355853196-23676-1-git-send-email-will.deacon@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355853196-23676-1-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, xen-devel-GuqFBffKawuEi8DpZVb4nw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The ARM security extensions introduced the smc instruction, which is not
supported by all versions of GAS.

This patch introduces opcodes-sec.h, so that smc is made available in a
similar manner to hvc.

Acked-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/include/asm/opcodes-sec.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm/include/asm/opcodes-sec.h

diff --git a/arch/arm/include/asm/opcodes-sec.h b/arch/arm/include/asm/opcodes-sec.h
new file mode 100644
index 0000000..bc3a917
--- /dev/null
+++ b/arch/arm/include/asm/opcodes-sec.h
@@ -0,0 +1,24 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * Copyright (C) 2012 ARM Limited
+ */
+
+#ifndef __ASM_ARM_OPCODES_SEC_H
+#define __ASM_ARM_OPCODES_SEC_H
+
+#include <asm/opcodes.h>
+
+#define __SMC(imm4) __inst_arm_thumb32(					\
+	0xE1600070 | (((imm4) & 0xF) << 0),				\
+	0xF7F08000 | (((imm4) & 0xF) << 16)				\
+)
+
+#endif /* __ASM_ARM_OPCODES_SEC_H */
-- 
1.8.0
