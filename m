From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v6 09/11] arm: add support for reserved memory defined by
 device tree
Date: Fri, 28 Feb 2014 14:42:54 +0100
Message-ID: <1393594976-16728-10-git-send-email-m.szyprowski@samsung.com>
References: <1393594976-16728-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1393594976-16728-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Michal Nazarewicz <mina86@mina86.com>, Grant Likely <grant.likely@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sascha Hauer <s.hauer@pengutronix.de>, Laura Abbott <lauraa@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kumar Gala <galak@codeaurora.org>, Nishanth Peethambaran <nishanth.p@gmail.com>, Marc <marc.ceeeee@gmail.com>, Josh Cartwright <joshc@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>
List-Id: devicetree@vger.kernel.org

Enable reserved memory initialization from device tree.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/Kconfig   |    1 +
 arch/arm/mm/init.c |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e25419817791..d0262bea8020 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1918,6 +1918,7 @@ config USE_OF
 	select IRQ_DOMAIN
 	select OF
 	select OF_EARLY_FLATTREE
+	select OF_RESERVED_MEM
 	help
 	  Include support for flattened device tree machine descriptions.
 
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 804d61566a53..2a77ba8796ae 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -323,6 +323,8 @@ void __init arm_memblock_init(struct meminfo *mi,
 	if (mdesc->reserve)
 		mdesc->reserve();
 
+	early_init_fdt_scan_reserved_mem();
+
 	/*
 	 * reserve memory for DMA contigouos allocations,
 	 * must come from DMA area inside low memory
-- 
1.7.9.5

