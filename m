From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] base: fix order of OF initialization
Date: Thu, 21 Jun 2018 15:37:37 +0200
Message-ID: <20180621133737.14397-1-hch@lst.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: mark.rutland@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Wesley W. Terpstra" <wesley@sifive.com>
List-Id: devicetree@vger.kernel.org

From: "Wesley W. Terpstra" <wesley@sifive.com>

This fixes: [    0.010000] cpu cpu0: Error -2 creating of_node link
... which you get for every CPU on all architectures that use
CONFIG_GENERIC_CPU_DEVICES.

In that case, driver_init() calls cpu_dev_init() before calling
of_core_init(). Then we get the callchain:

  cpu_dev_init()
    -> cpu_dev_register_generic()
    -> register_cpu(cpu, i)
    -> device_register(&cpu->dev)
    -> device_add(dev)
    -> device_add_class_symlinks(dev)

... in device_add_class_symlinks, we we dev->of_node, and call
sysfs_create_link(), which fails because we haven't called
of_core_init() to register the sysfs devicetree directory yet.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[hch: updated the changelog based on review feedback]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Acked-by: Frank Rowand <frowand.list@gmail.com>
---

In case anyone is wondering why I send out this patch - I'm digging
through the RISC-V tree and trying to the patches required to let
a RISC-V kernel boot on qemu upstream.  I also got the previously
missing signoff from Wes offlist.

 drivers/base/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/init.c b/drivers/base/init.c
index dd85b05a6a16..908e6520e804 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -30,9 +30,9 @@ void __init driver_init(void)
 	/* These are also core pieces, but must come after the
 	 * core core pieces.
 	 */
+	of_core_init();
 	platform_bus_init();
 	cpu_dev_init();
 	memory_dev_init();
 	container_dev_init();
-	of_core_init();
 }
-- 
2.17.1
