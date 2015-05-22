From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 02/15] MIPS: include errno.h for ENODEV in mips-cm.h
Date: Fri, 22 May 2015 16:51:01 +0100
Message-ID: <1432309875-9712-3-git-send-email-paul.burton@imgtec.com>
References: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432309875-9712-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Burton <paul.burton@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A later patch in this series will include mips-cm.h but does not require
errno.h. This leads to a build failure with ENODEV undeclared. Include
errno.h from mips-cm.h to pull in the appropriate definition and avoid
the build failure.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

 arch/mips/include/asm/mips-cm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index 1cb11fb..edc7ee9 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -11,6 +11,7 @@
 #ifndef __MIPS_ASM_MIPS_CM_H__
 #define __MIPS_ASM_MIPS_CM_H__
 
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
-- 
2.4.1
