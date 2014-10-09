From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v2 1/1] Documentation: dt-bindings: Explain order in patch series
Date: Thu,  9 Oct 2014 20:24:07 +0200
Message-ID: <1412879047-24138-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When posting a patch series that includes both code implementing a
Device Tree binding and its associated documentation, the DT docs
should come in the series before the implementation.

This not only avoids checkpatch.pl to complain about undocumented
bindings but also makes the review process easier.

Document this convention since it may not be obvious.

Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---

Changes since v1:
 - Small typo error, sorry for the noise.

 Documentation/devicetree/bindings/submitting-patches.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index 042a027..b7ba01a 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -12,6 +12,9 @@ I. For patch submitters
 
        devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 
+  3) The Documentation/ portion of the patch should come in the series before
+     the code implementing the binding.
+
 II. For kernel maintainers
 
   1) If you aren't comfortable reviewing a given binding, reply to it and ask
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
