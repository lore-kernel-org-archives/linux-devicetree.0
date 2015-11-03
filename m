From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] dmaengine: of_dma: Correct return code for of_dma_request_slave_channel in case !CONFIG_OF
Date: Tue, 3 Nov 2015 12:28:10 +0200
Message-ID: <1446546490-7432-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_dma_request_slave_channel should return either pointer for valid
dma_chan or ERR_PTR() error code, NULL is not expected to be returned.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 include/linux/of_dma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index 36112cdd665a..b90d8ec57c1f 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -80,7 +80,7 @@ static inline int of_dma_router_register(struct device_node *np,
 static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
