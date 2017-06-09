From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: media/s5p-cec.txt, media/stih-cec.txt: refer to cec.txt
Date: Fri,  9 Jun 2017 19:54:01 +0200
Message-ID: <20170609175401.40204-3-hverkuil@xs4all.nl>
References: <20170609175401.40204-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609175401.40204-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Now that there is a cec.txt with common CEC bindings, update the two
driver-specific bindings to refer to cec.txt.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/media/s5p-cec.txt  | 6 ++----
 Documentation/devicetree/bindings/media/stih-cec.txt | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
index 261af4d1a791..1b1a10ba48ce 100644
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ b/Documentation/devicetree/bindings/media/s5p-cec.txt
@@ -15,13 +15,11 @@ Required properties:
   - clock-names : from common clock binding: must contain "hdmicec",
 		  corresponding to entry in the clocks property.
   - samsung,syscon-phandle - phandle to the PMU system controller
-  - hdmi-phandle - phandle to the HDMI controller
+  - hdmi-phandle - phandle to the HDMI controller, see also cec.txt.
 
 Optional:
   - needs-hpd : if present the CEC support is only available when the HPD
-    is high. Some boards only let the CEC pin through if the HPD is high, for
-    example if there is a level converter that uses the HPD to power up
-    or down.
+		is high. See cec.txt for more details.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/media/stih-cec.txt b/Documentation/devicetree/bindings/media/stih-cec.txt
index 289a08b33651..8be2a040c6c6 100644
--- a/Documentation/devicetree/bindings/media/stih-cec.txt
+++ b/Documentation/devicetree/bindings/media/stih-cec.txt
@@ -9,7 +9,7 @@ Required properties:
  - pinctrl-names: Contains only one value - "default"
  - pinctrl-0: Specifies the pin control groups used for CEC hardware.
  - resets: Reference to a reset controller
- - hdmi-phandle: Phandle to the HDMI controller
+ - hdmi-phandle: Phandle to the HDMI controller, see also cec.txt.
 
 Example for STIH407:
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
