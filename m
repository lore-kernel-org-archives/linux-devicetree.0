From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] dt-bindings: display-timing.txt convert non-ascii characters to ascii
Date: Tue, 20 Jun 2017 16:18:15 -0700
Message-ID: <1498000695-2743-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Convert non-ascii up and down arrows to '^' and 'v'

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 .../devicetree/bindings/display/panel/display-timing.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
index 81a75893d1b8..58fa3e48481d 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
+++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
@@ -57,11 +57,11 @@ can be specified.
 The parameters are defined as:
 
   +----------+-------------------------------------+----------+-------+
-  |          |        ↑                            |          |       |
+  |          |        ^                            |          |       |
   |          |        |vback_porch                 |          |       |
-  |          |        ↓                            |          |       |
+  |          |        v                            |          |       |
   +----------#######################################----------+-------+
-  |          #        ↑                            #          |       |
+  |          #        ^                            #          |       |
   |          #        |                            #          |       |
   |  hback   #        |                            #  hfront  | hsync |
   |   porch  #        |       hactive              #  porch   |  len  |
@@ -69,15 +69,15 @@ The parameters are defined as:
   |          #        |                            #          |       |
   |          #        |vactive                     #          |       |
   |          #        |                            #          |       |
-  |          #        ↓                            #          |       |
+  |          #        v                            #          |       |
   +----------#######################################----------+-------+
-  |          |        ↑                            |          |       |
+  |          |        ^                            |          |       |
   |          |        |vfront_porch                |          |       |
-  |          |        ↓                            |          |       |
+  |          |        v                            |          |       |
   +----------+-------------------------------------+----------+-------+
-  |          |        ↑                            |          |       |
+  |          |        ^                            |          |       |
   |          |        |vsync_len                   |          |       |
-  |          |        ↓                            |          |       |
+  |          |        v                            |          |       |
   +----------+-------------------------------------+----------+-------+
 
 Example:
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
