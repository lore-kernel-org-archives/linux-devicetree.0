From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] configfs: Fix reading empty binary attributes
Date: Fri,  8 May 2015 14:53:55 +0200
Message-ID: <1431089635-13662-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Joel Becker <jlbec-aKy9MeLSZ9dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When trying to read an empty binary attribute in configfs, an OOM
message is printed:

    vmalloc: allocation failure: 0 bytes
    cat: page allocation failure: order:0, mode:0xd2
    CPU: 0 PID: 1364 Comm: cat Tainted: G        W       4.1.0-rc2-koelsch-01276-ge036d0dc3eded004-dirty #1128
    Hardware name: Generic R8A7791 (Flattened Device Tree)
    Backtrace:
    [<c00135d8>] (dump_backtrace) from [<c00137f8>] (show_stack+0x18/0x1c)
     r6:c055978f r5:00000000 r4:00000000 r3:00404000
    [<c00137e0>] (show_stack) from [<c044cf88>] (dump_stack+0x78/0x94)
    [<c044cf10>] (dump_stack) from [<c00b5fb4>] (warn_alloc_failed+0xf0/0x114)
     r4:00000001 r3:00000000
    [<c00b5ec8>] (warn_alloc_failed) from [<c00de788>] (__vmalloc_node_range+0x1cc/0x1f0)
     r3:00000000 r2:c055978f
     r7:00000000 r6:ffffffff r5:000000d2 r4:0000071f
    [<c00de5bc>] (__vmalloc_node_range) from [<c00de7fc>] (__vmalloc_node+0x50/0x5c)
     r9:00000000 r8:ee22a000 r7:ee2a5cd8 r6:c0629ab8 r5:00c00000 r4:0000071f
    [<c00de7ac>] (__vmalloc_node) from [<c00de840>] (vmalloc+0x38/0x44)
     r5:c0629adc r4:ee2a5cc0
    [<c00de808>] (vmalloc) from [<c01495e4>] (configfs_read_bin_file+0xec/0x17c)
    [<c01494f8>] (configfs_read_bin_file) from [<c00e8a48>] (__vfs_read+0x34/0xd8)
     r10:00000000 r9:ee240000 r8:c000ffe4 r7:00020000 r6:ee241f80 r5:c01494f8
     r4:ee145980

Unlike kmalloc(), vmalloc() doesn't support allocating zero bytes.
Hence return early if ops->read_bin_attribute() returns zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Fixes: db2e824d18a7d8f9 ("configfs: Implement binary attributes (v4)")
---
Against
https://github.com/pantoniou/linux-beagle-track-mainline.git#bbb-overlays

How to reproduce:
  - mkdir /sys/kernel/config/device-tree/overlays/dummy
  - cat /sys/kernel/config/device-tree/overlays/dummy/dtbo
---
 fs/configfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index af6cb78a0f014474..6ecaedfe59a5e2f2 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -188,7 +188,7 @@ configfs_read_bin_file(struct file *file, char __user *buf,
 
 		/* perform first read with buf == NULL to get extent */
 		len = ops->read_bin_attribute(item, bin_attr, NULL, 0);
-		if (len < 0) {
+		if (len <= 0) {
 			retval = len;
 			goto out;
 		}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
