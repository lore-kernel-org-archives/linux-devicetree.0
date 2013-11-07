From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH RFC V2] dt: bindings: submitting patches document
Date: Thu,  7 Nov 2013 18:53:32 +0000
Message-ID: <1383850412-18744-1-git-send-email-jason@lakedaemon.net>
References: <1383759120-21571-1-git-send-email-jason@lakedaemon.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383759120-21571-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
Changes since V1:
 - clarified III.1. as speaking to maintainers
 - quoted Grant's ARM mini-summit document regarding DT as stable ABI (IV.2.)

All,

Since I've now had to answer this question a couple of times, I thought it
might be worth trying to put it in a document.  I don't like long documents, so
this is pretty concise, and most likely wrong.  Hence, RFC.  :)

I also dislike quoting people from my imperfect memory, much better to have an
agreed upon document we can point people towards.

thx,

Jason.

 .../devicetree/bindings/submitting-patches.txt     | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/submitting-patches.txt

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
new file mode 100644
index 000000000000..82ffdabd22cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -0,0 +1,68 @@
+
+  Submitting devicetree (DT) binding patches
+
+I. For patch submitters
+
+  0) Normal patch submission rules from Documentation/SubmittingPatches
+     applies.
+
+  1) The Documentation/ portion of the patch should be a separate patch
+     and clearly labelled as such.  For example:
+
+       [PATCH X/Y] dt: binding: mvebu mbus driver
+
+     This makes the binding portion easy to find among large patch series.
+
+  2) Submit the entire series to the devicetree mailinglist at
+
+       devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+
+II. For sub-system maintainers
+
+  1) If you aren't comfortable reviewing a given binding, reply to it and ask
+     the devicetree maintainers for guidance.  This will help them prioritize
+     which ones to review and which ones are ok to let go.
+
+  2) If you are comfortable with the binding, and it hasn't received an
+     Acked-by from the devicetree maintainers after a few weeks, go ahead and
+     take it.
+
+  3) For a series going though multiple trees, the binding patch should be
+     kept with the driver using the binding.
+
+III.  General binding rules
+
+  1) Maintainers, don't let perfect be the enemy of good.  Don't hold up a
+     binding because it isn't perfect.
+
+  2) Use specific compatible strings so that if we need to add a feature (DMA)
+     in the future, we can create a new compatible string.  See IV.2.
+
+  3) Ideally, all bindings receive sufficient review.  In the real world, we
+     need to prioritize.  Bindings for a specific block of IP aren't as
+     critical as a binding for a common subsystem, like PCI.
+
+  4) Don't submit bindings for staging or unstable.  That will be decided by
+     the devicetree maintainers *after* discussion on the mailinglist.
+
+IV. Notes
+
+  1) This document is intended as a general familiarization with the process as
+     decided at the 2013 Kernel Summit.  When in doubt, the current word of the
+     devicetree maintainers overrules this document.  In that situation, a patch
+     updating this document would be appreciated.
+
+  2) Regarding stable bindings/ABI, we quote from the 2013 ARM mini-summit
+     summary document:
+
+       "That still leaves the question of, what does a stable binding look
+       like?  Certainly a stable binding means that a newer kernel will not
+       break on an older device tree, but that doesn't mean the binding is
+       frozen for all time. Grant said there are ways to change bindings that
+       don't result in breakage. For instance, if a new property is added,
+       then default to the previous behaviour if it is missing. If a binding
+       truly needs an incompatible change, then change the compatible string
+       at the same time.  The driver can bind against both the old and the
+       new. These guidelines aren't new, but they desperately need to be
+       documented."
+
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
