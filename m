From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 1/6] ARM: opcodes: add missing include of linux/linkage.h
Date: Tue, 18 Dec 2012 17:53:11 +0000
Message-ID: <1355853196-23676-2-git-send-email-will.deacon@arm.com>
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

opcodes.h wants to declare an asmlinkage function, so we need to include
linux/linkage.h

Acked-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/include/asm/opcodes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/include/asm/opcodes.h b/arch/arm/include/asm/opcodes.h
index 74e211a..e796c59 100644
--- a/arch/arm/include/asm/opcodes.h
+++ b/arch/arm/include/asm/opcodes.h
@@ -10,6 +10,7 @@
 #define __ASM_ARM_OPCODES_H
 
 #ifndef __ASSEMBLY__
+#include <linux/linkage.h>
 extern asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
 #endif
 
-- 
1.8.0
