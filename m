From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 11/11] powerpc: add support for reserved memory defined by
 device tree
Date: Fri, 21 Feb 2014 13:25:27 +0100
Message-ID: <1392985527-6260-12-git-send-email-m.szyprowski@samsung.com>
References: <1392985527-6260-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392985527-6260-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>, Laura Abbott <lauraa@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kumar Gala <galak@codeaurora.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, Marc <marc.ceeeee@gmail.com>, Josh Cartwright <joshc@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

Enable reserved memory initialization from device tree.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/powerpc/Kconfig       |    1 +
 arch/powerpc/kernel/prom.c |    3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 957bf344c0f5..3b6617fed8fc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -90,6 +90,7 @@ config PPC
 	select BINFMT_ELF
 	select OF
 	select OF_EARLY_FLATTREE
+	select OF_RESERVED_MEM
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_FUNCTION_TRACER
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index f58c0d3aaeb4..591986215801 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -33,6 +33,7 @@
 #include <linux/irq.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
+#include <linux/of_fdt.h>
 
 #include <asm/prom.h>
 #include <asm/rtas.h>
@@ -588,6 +589,8 @@ static void __init early_reserve_mem_dt(void)
 			memblock_reserve(base, size);
 		}
 	}
+
+	early_init_fdt_scan_reserved_mem();
 }
 
 static void __init early_reserve_mem(void)
-- 
1.7.9.5
