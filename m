From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 6/8] doc: dt: Document the target root overlay method
Date: Fri, 12 Jun 2015 22:55:03 +0300
Message-ID: <1434138905-15886-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1434138905-15886-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434138905-15886-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a description of the target root overlay method to the overlay
documention file.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/overlay-notes.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index dd595e6..00ede57 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -104,6 +104,10 @@ If your board has multiple slots/places where a single overlay can work
 and each slot is defined by a node, you can use the of_overlay_create_indirect()
 method to select the target.
 
+For overlays on probeable busses, use the of_overlay_create_target_root() method
+in which you supply a device node as a target root, and which all target
+references in the overlay are performed relative to that node.
+
 Overlay DTS Format
 ------------------
 
@@ -144,3 +148,7 @@ contains the information required to map from a phandle to a tree location.
 The indirect target requires the use of a selector target on the call to
 of_overlay_create_indirect(). I.e. passing the "foo" id will select the target
 in the foo node, "bar" in bar node, etc.
+
+Note that when using the target root create method all target references must
+lie under the target root node. I.e. the overlay is not allowed to 'break' out
+of the root.
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
