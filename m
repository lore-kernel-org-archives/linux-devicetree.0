From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] Documentation: dt-bindings: Explain order in patch series
Date: Thu,  9 Oct 2014 20:18:27 +0200
Message-ID: <1412878707-23754-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

When posting a patch series that includes both code implementing a
Device Tree binding and its associated documentation, the DT docs
should come in the series before the implementation.

This not only avoids checkpatch.pl to complain about undocumented
bindings but also makes the review process easier.

Document this convention since it may not be obvious.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 Documentation/devicetree/bindings/submitting-patches.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index 042a027..e3bd2bb 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -12,6 +12,9 @@ I. For patch submitters
 
        devicetree@vger.kernel.org
 
+ 3) The Documentation/ portion of the patch should come in the series before
+    the code implementing the binding.
+
 II. For kernel maintainers
 
   1) If you aren't comfortable reviewing a given binding, reply to it and ask
-- 
2.1.0
