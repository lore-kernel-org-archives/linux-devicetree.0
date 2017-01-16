From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] of: fix of_device_get_modalias returned length when truncating buffers
Date: Mon, 16 Jan 2017 14:41:21 -0600
Message-ID: <20170116204122.5858-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If the length of the modalias is greater than the buffer size, then the
modalias is truncated. However the untruncated length is returned which
will cause an error. Fix this to return the truncated length. If an error
in the case was desired, then then we should just return -ENOMEM.

The reality is no device will ever have 4KB of compatible strings to hit
this case.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index fd5cfad7c403..bd620452f255 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -223,7 +223,7 @@ ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 			str[i] = '_';
 	}
 
-	return tsize;
+	return repend;
 }
 
 /**
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
