From: Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH] of/fdt: Make sure no-map does not remove already reserved regions
Date: Wed,  3 Jul 2019 13:08:27 +0800
Message-ID: <20190703050827.173284-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Grant Likely <grant.likely@linaro.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

If the device tree is incorrectly configured, and attempts to
define a "no-map" reserved memory that overlaps with the kernel
data/code, the kernel would crash quickly after boot, with no
obvious clue about the nature of the issue.

For example, this would happen if we have the kernel mapped at
these addresses (from /proc/iomem):
40000000-41ffffff : System RAM
  40080000-40dfffff : Kernel code
  40e00000-411fffff : reserved
  41200000-413e0fff : Kernel data

And we declare a no-map shared-dma-pool region at a fixed address
within that range:
mem_reserved: mem_region {
	compatible = "shared-dma-pool";
	reg = <0 0x40000000 0 0x01A00000>;
	no-map;
};

To fix this, when removing memory regions at early boot (which is
what "no-map" regions do), we need to make sure that the memory
is not already reserved. If we do, __reserved_mem_reserve_reg
will throw an error:
[    0.000000] OF: fdt: Reserved memory: failed to reserve memory
   for node 'mem_region': base 0x0000000040000000, size 26 MiB
and the code that will try to use the region should also fail,
later on.

We do not do anything for non-"no-map" regions, as memblock
explicitly allows reserved regions to overlap, and the commit
that this fixes removed the check for that precise reason.

Fixes: 094cb98179f19b7 ("of/fdt: memblock_reserve /memreserve/ regions in the case of partial overlap")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/of/fdt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index cd17dc62a71980a..a1ded43fc332d0c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1138,8 +1138,16 @@ int __init __weak early_init_dt_mark_hotplug_memory_arch(u64 base, u64 size)
 int __init __weak early_init_dt_reserve_memory_arch(phys_addr_t base,
 					phys_addr_t size, bool nomap)
 {
-	if (nomap)
+	if (nomap) {
+		/*
+		 * If the memory is already reserved (by another region), we
+		 * should not allow it to be removed altogether.
+		 */
+		if (memblock_is_region_reserved(base, size))
+			return -EBUSY;
+
 		return memblock_remove(base, size);
+	}
 	return memblock_reserve(base, size);
 }
 
-- 
2.22.0.410.gd8fdbe21b5-goog
