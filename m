From: yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: [PATCH] Documentation: simple-card: add full path to widgets.txt
Date: Fri, 30 Dec 2016 09:00:41 +0100
Message-ID: <1483084841-9461-1-git-send-email-yegorslists@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/simple-card.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.txt b/Documentation/devicetree/bindings/sound/simple-card.txt
index c7a9393..4198fe5 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.txt
+++ b/Documentation/devicetree/bindings/sound/simple-card.txt
@@ -10,7 +10,8 @@ Optional properties:
 
 - simple-audio-card,name		: User specified audio sound card name, one string
 					  property.
-- simple-audio-card,widgets		: Please refer to widgets.txt.
+- simple-audio-card,widgets		: Please refer to
+					  Documentation/devicetree/bindings/sound/widgets.txt.
 - simple-audio-card,routing		: A list of the connections between audio components.
 					  Each entry is a pair of strings, the first being the
 					  connection's sink, the second being the connection's
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
