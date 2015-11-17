From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] configfs: Fix reading empty binary attributes
Date: Tue, 17 Nov 2015 13:44:00 +0100
Message-ID: <1447764240-10709-3-git-send-email-geert+renesas@glider.be>
References: <1447764240-10709-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447764240-10709-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When trying to read an empty binary attribute in configfs, an OOM
message is printed:

    vmalloc: allocation failure: 0 bytes
    cat: page allocation failure: order:0, mode:0x24000c2
    CPU: 1 PID: 1731 Comm: cat Tainted: G        W       4.4.0-rc1-koelsch-01576-g480a69c050d4f3ee-dirty #1977
    Hardware name: Generic R8A7791 (Flattened Device Tree)
    [<c00173a0>] (unwind_backtrace) from [<c0013094>] (show_stack+0x10/0x14)
    [<c0013094>] (show_stack) from [<c01f1f38>] (dump_stack+0x70/0x8c)
    [<c01f1f38>] (dump_stack) from [<c00b6930>] (warn_alloc_failed+0xe4/0x110)
    [<c00b6930>] (warn_alloc_failed) from [<c00dde1c>] (__vmalloc_node_range+0x1cc/0x1f0)
    [<c00dde1c>] (__vmalloc_node_range) from [<c00dde88>] (__vmalloc_node+0x48/0x58)
    [<c00dde88>] (__vmalloc_node) from [<c00ddec4>] (vmalloc+0x2c/0x3c)
    [<c00ddec4>] (vmalloc) from [<c0148304>] (configfs_read_bin_file+0x98/0x118)
    [<c0148304>] (configfs_read_bin_file) from [<c00e8a88>] (__vfs_read+0x20/0xcc)
    [<c00e8a88>] (__vfs_read) from [<c00e918c>] (vfs_read+0x84/0xec)
    [<c00e918c>] (vfs_read) from [<c00e9914>] (SyS_read+0x40/0x80)

Unlike kmalloc(), vmalloc() doesn't support allocating zero bytes.
Hence return early if ops->read_bin_attribute() returns zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Fixes: 016dd7ff3c56526f ("configfs: Implement binary attributes (v5)")
---
Against
https://github.com/pantoniou/linux-beagle-track-mainline.git/bbb-overlays

How to reproduce:
  - mkdir /sys/kernel/config/device-tree/overlays/dummy
  - cat /sys/kernel/config/device-tree/overlays/dummy/dtbo
---
 fs/configfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index a3a3c6695fbf1950..20d59bf4737379e3 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -172,7 +172,7 @@ configfs_read_bin_file(struct file *file, char __user *buf,
 
 		/* perform first read with buf == NULL to get extent */
 		len = bin_attr->read(item, NULL, 0);
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
