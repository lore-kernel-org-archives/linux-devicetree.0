From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: [PATCH RESEND 2/2] dt/bindings: display: move rotation into a common place
Date: Fri,  4 Aug 2017 08:38:46 +0300
Message-ID: <22e876edfc16b7c9877d77735ff723e978c80894.1501825126.git.baruch@tkos.co.il>
References: <22d9c447946555c7268119dc4d7ee5f63d5f668d.1501825126.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22d9c447946555c7268119dc4d7ee5f63d5f668d.1501825126.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit b60c1be74741 (dt-bindings: display/panel: Add common rotation property)
added the rotation property description in a new file. We have a place for
common display panel properties already. Move there the rotation property.

Acked-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
---
 Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 ++++++
 Documentation/devicetree/bindings/display/panel/panel.txt        | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.txt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
index 0603af877155..c92dcfd8c32f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
@@ -89,3 +89,9 @@ backlight controller.
 
 - backlight: For panels whose backlight is controlled by an external backlight
   controller, this property contains a phandle that references the controller.
+
+
+Rotation
+--------
+
+- rotation: Display rotation in degrees counter clockwise (0,90,180,270)
diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/Documentation/devicetree/bindings/display/panel/panel.txt
deleted file mode 100644
index e2e6867852b8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/panel.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Common display properties
--------------------------
-
-- rotation:	Display rotation in degrees counter clockwise (0,90,180,270)
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
