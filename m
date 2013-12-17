From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH V2] dt: bindings: submitting patches and ABI documents
Date: Tue, 17 Dec 2013 16:59:40 +0000
Message-ID: <1387299580-9100-1-git-send-email-jason@lakedaemon.net>
References: <1383759120-21571-1-git-send-email-jason@lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383759120-21571-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
Changes from RFC:
 - incorporated Grant's language
 - split patches/ABI into two documents

 Documentation/devicetree/bindings/ABI.txt          | 39 ++++++++++++++++++++++
 .../devicetree/bindings/submitting-patches.txt     | 35 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ABI.txt
 create mode 100644 Documentation/devicetree/bindings/submitting-patches.txt

diff --git a/Documentation/devicetree/bindings/ABI.txt b/Documentation/devicetree/bindings/ABI.txt
new file mode 100644
index 000000000000..d25f8d379680
--- /dev/null
+++ b/Documentation/devicetree/bindings/ABI.txt
@@ -0,0 +1,39 @@
+
+  Devicetree (DT) ABI
+
+I. Regarding stable bindings/ABI, we quote from the 2013 ARM mini-summit
+   summary document:
+
+     "That still leaves the question of, what does a stable binding look
+     like?  Certainly a stable binding means that a newer kernel will not
+     break on an older device tree, but that doesn't mean the binding is
+     frozen for all time. Grant said there are ways to change bindings that
+     don't result in breakage. For instance, if a new property is added,
+     then default to the previous behaviour if it is missing. If a binding
+     truly needs an incompatible change, then change the compatible string
+     at the same time.  The driver can bind against both the old and the
+     new. These guidelines aren't new, but they desperately need to be
+     documented."
+
+II.  General binding rules
+
+  1) Maintainers, don't let perfect be the enemy of good.  Don't hold up a
+     binding because it isn't perfect.
+
+  2) Use specific compatible strings so that if we need to add a feature (DMA)
+     in the future, we can create a new compatible string.  See I.
+
+  3) Bindings can be augmented, but the driver shouldn't break when given
+     the old binding. ie. add additional properties, but don't change the
+     meaning of an existing property. For drivers, default to the original
+     behaviour when a newly added property is missing.
+
+  4) Don't submit bindings for staging or unstable.  That will be decided by
+     the devicetree maintainers *after* discussion on the mailinglist.
+
+III. Notes
+
+  1) This document is intended as a general familiarization with the process as
+     decided at the 2013 Kernel Summit.  When in doubt, the current word of the
+     devicetree maintainers overrules this document.  In that situation, a patch
+     updating this document would be appreciated.
diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
new file mode 100644
index 000000000000..5672cb46681d
--- /dev/null
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -0,0 +1,35 @@
+
+  Submitting devicetree (DT) binding patches
+
+I. For patch submitters
+
+  0) Normal patch submission rules from Documentation/SubmittingPatches
+     applies.
+
+  1) The Documentation/ portion of the patch should be a separate patch.
+
+  2) Submit the entire series to the devicetree mailinglist at
+
+       devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+
+II. For kernel maintainers
+
+  1) If you aren't comfortable reviewing a given binding, reply to it and ask
+     the devicetree maintainers for guidance.  This will help them prioritize
+     which ones to review and which ones are ok to let go.
+
+  2) For driver (not subsystem) bindings: If you are comfortable with the
+     binding, and it hasn't received an Acked-by from the devicetree
+     maintainers after a few weeks, go ahead and take it.
+
+  3) For a series going though multiple trees, the binding patch should be
+     kept with the driver using the binding.
+
+III. Notes
+
+  0) Please see ...bindings/ABI.txt for details regarding devicetree ABI.
+
+  1) This document is intended as a general familiarization with the process as
+     decided at the 2013 Kernel Summit.  When in doubt, the current word of the
+     devicetree maintainers overrules this document.  In that situation, a patch
+     updating this document would be appreciated.
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
