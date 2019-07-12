From: KarimAllah Ahmed <karahmed@amazon.de>
Subject: [PATCH] fdt: Properly handle "no-map" field in the memory region
Date: Fri, 12 Jul 2019 10:31:24 +0200
Message-ID: <1562920284-18638-1-git-send-email-karahmed@amazon.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: KarimAllah Ahmed <karahmed@amazon.de>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Mark the memory region with NOMAP flag instead of completely removing it
from the memory blocks. That makes the FDT handling consistent with the EFI
memory map handling.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: KarimAllah Ahmed <karahmed@amazon.de>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index de893c9..77982ae 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1175,7 +1175,7 @@ int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
 	if (nomap)
-		return memblock_remove(base, size);
+		return memblock_mark_nomap(base, size);
 	return memblock_reserve(base, size);
 }
 
-- 
2.7.4
