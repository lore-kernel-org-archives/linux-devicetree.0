From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 04/10] fsi: Fix one and two byte bus reads/writes
Date: Mon, 12 Feb 2018 15:45:43 +1030
Message-ID: <20180212051549.8575-5-joel@jms.id.au>
References: <20180212051549.8575-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180212051549.8575-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Eddie James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Brad Bishop <bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Eddie James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

Address checker fixed to allow one and two byte reads/writes.
Address alignments for each size verified.

Signed-off-by: Edward James <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Acked-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 drivers/fsi/fsi-core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 6e5aa9b26665..e5dfece248a5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -656,10 +656,13 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 /* FSI master support */
 static int fsi_check_access(uint32_t addr, size_t size)
 {
-	if (size != 1 && size != 2 && size != 4)
-		return -EINVAL;
-
-	if ((addr & 0x3) != (size & 0x3))
+	if (size == 4) {
+		if (addr & 0x3)
+			return -EINVAL;
+	} else if (size == 2) {
+		if (addr & 0x1)
+			return -EINVAL;
+	} else if (size != 1)
 		return -EINVAL;
 
 	return 0;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
