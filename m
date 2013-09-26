From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 21/21] of: remove empty arch prom.h headers
Date: Thu, 26 Sep 2013 13:50:56 -0500
Message-ID: <1380221456-11192-22-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Now that prom.h is optional, all the empty prom.h headers can be removed.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>
Cc: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arc/include/asm/prom.h      | 12 ------------
 arch/arm64/include/asm/prom.h    |  1 -
 arch/c6x/include/asm/prom.h      |  1 -
 arch/metag/include/asm/prom.h    | 20 --------------------
 arch/openrisc/include/asm/prom.h | 20 --------------------
 arch/xtensa/include/asm/prom.h   |  4 ----
 6 files changed, 58 deletions(-)
 delete mode 100644 arch/arc/include/asm/prom.h
 delete mode 100644 arch/arm64/include/asm/prom.h
 delete mode 100644 arch/c6x/include/asm/prom.h
 delete mode 100644 arch/metag/include/asm/prom.h
 delete mode 100644 arch/openrisc/include/asm/prom.h
 delete mode 100644 arch/xtensa/include/asm/prom.h

diff --git a/arch/arc/include/asm/prom.h b/arch/arc/include/asm/prom.h
deleted file mode 100644
index 1555549..0000000
--- a/arch/arc/include/asm/prom.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/*
- * Copyright (C) 2012 Synopsys, Inc. (www.synopsys.com)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef _ASM_ARC_PROM_H_
-#define _ASM_ARC_PROM_H_
-
-#endif
diff --git a/arch/arm64/include/asm/prom.h b/arch/arm64/include/asm/prom.h
deleted file mode 100644
index 68b90e6..0000000
--- a/arch/arm64/include/asm/prom.h
+++ /dev/null
@@ -1 +0,0 @@
-/* Empty for now */
diff --git a/arch/c6x/include/asm/prom.h b/arch/c6x/include/asm/prom.h
deleted file mode 100644
index b4ec95f0..0000000
--- a/arch/c6x/include/asm/prom.h
+++ /dev/null
@@ -1 +0,0 @@
-/* dummy prom.h; here to make linux/of.h's #includes happy */
diff --git a/arch/metag/include/asm/prom.h b/arch/metag/include/asm/prom.h
deleted file mode 100644
index d4be144..0000000
--- a/arch/metag/include/asm/prom.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- *  arch/metag/include/asm/prom.h
- *
- *  Copyright (C) 2012 Imagination Technologies Ltd.
- *
- *  Based on ARM version:
- *  Copyright (C) 2009 Canonical Ltd. <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- */
-#ifndef __ASM_METAG_PROM_H
-#define __ASM_METAG_PROM_H
-
-
-extern void copy_fdt(void);
-
-#endif /* __ASM_METAG_PROM_H */
diff --git a/arch/openrisc/include/asm/prom.h b/arch/openrisc/include/asm/prom.h
deleted file mode 100644
index bec477b..0000000
--- a/arch/openrisc/include/asm/prom.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * OpenRISC Linux
- *
- * Linux architectural port borrowing liberally from similar works of
- * others.  All original copyrights apply as per the original source
- * declaration.
- *
- * OpenRISC implementation:
- * Copyright (C) 2010-2011 Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
- * et al.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-#ifndef _ASM_OPENRISC_PROM_H
-#define _ASM_OPENRISC_PROM_H
-
-#endif /* _ASM_OPENRISC_PROM_H */
diff --git a/arch/xtensa/include/asm/prom.h b/arch/xtensa/include/asm/prom.h
deleted file mode 100644
index 2a87a58..0000000
--- a/arch/xtensa/include/asm/prom.h
+++ /dev/null
@@ -1,4 +0,0 @@
-#ifndef _XTENSA_ASM_PROM_H
-#define _XTENSA_ASM_PROM_H
-
-#endif /* _XTENSA_ASM_PROM_H */
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
