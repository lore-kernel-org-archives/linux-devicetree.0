From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] configfs: Remove ppos increment in configfs_write_bin_file
Date: Wed, 18 May 2016 16:16:51 +0200
Message-ID: <1463581011-9910-1-git-send-email-marex@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The simple_write_to_buffer() already increments the @ppos on success,
see fs/libfs.c simple_write_to_buffer() comment:

"
On success, the number of bytes written is returned and the offset @ppos
advanced by this number, or negative value is returned on error.
"

If the configfs_write_bin_file() is invoked with @count smaller than the
total length of the written binary file, it will be invoked multiple times.
Since configfs_write_bin_file() increments @ppos on success, after calling
simple_write_to_buffer(), the @ppos is incremented twice.

Subsequent invocation of configfs_write_bin_file() will result in the next
piece of data being written to the offset twice as long as the length of
the previous write, thus creating buffer with "holes" in it.

The simple testcase using DTO follows:
  $ mkdir /sys/kernel/config/device-tree/overlays/1
  $ dd bs=1 if=foo.dtbo of=/sys/kernel/config/device-tree/overlays/1/dtbo
Without this patch, the testcase will result in twice as big buffer in the
kernel, which is then passed to the cfs_overlay_item_dtbo_write() .

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 fs/configfs/file.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index 33b7ee3..bbc1252 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -357,8 +357,6 @@ configfs_write_bin_file(struct file *file, const char __user *buf,
 
 	len = simple_write_to_buffer(buffer->bin_buffer,
 			buffer->bin_buffer_size, ppos, buf, count);
-	if (len > 0)
-		*ppos += len;
 out:
 	mutex_unlock(&buffer->mutex);
 	return len;
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
