From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: media: xilinx: fix typo in example
Date: Fri, 13 Oct 2017 01:03:34 +0900
Message-ID: <1507824214-17744-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix typo s/:/;/

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt b/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
index 9dd86b3..439351a 100644
--- a/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
@@ -66,6 +66,6 @@ Example:
 				tpg1_out: endpoint {
 					remote-endpoint = <&switch_in0>;
 				};
-			}:
+			};
 		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
