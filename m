From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 12/13] drm/panel: simple: Add simple panel device tree binding
Date: Sat, 31 Oct 2015 20:56:08 +0800
Message-ID: <1446296170-3702-13-git-send-email-zyw@rock-chips.com>
References: <1446296170-3702-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446296170-3702-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding specifies a set of common properties for display panels. It
can be used as a basis by bindings for specific panels.
Bindings for three specific panels are provided to show how the
simple panel binding can be used.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v2:
As Thierry.Reding comment, add a documentation for this panel.

 Documentation/devicetree/bindings/panel/boe,tv080wum-nl0.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/boe,tv080wum-nl0.txt

diff --git a/Documentation/devicetree/bindings/panel/boe,tv080wum-nl0.txt b/Documentation/devicetree/bindings/panel/boe,tv080wum-nl0.txt
new file mode 100644
index 0000000..50be5e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/boe,tv080wum-nl0.txt
@@ -0,0 +1,7 @@
+Boe Corporation 8.0" WUXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "boe,tv080wum-nl0"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
