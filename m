From: Matt Porter <mporter@konsulko.com>
Subject: [PATCH] dt: submitting-patches: clarify that DT maintainers are to be cced on bindings
Date: Thu,  5 Mar 2015 10:53:11 -0500
Message-ID: <1425570791-1006-1-git-send-email-mporter@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Devicetree List <devicetree@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The exact steps provided for submitting binding patches can be read
as requiring the bindings to be sent only to the devicetree@vger.kernel.org
list. Since the DT maintainers would like to be Cced on any binding
submissions, make this requirement explicit in step 2.

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 Documentation/devicetree/bindings/submitting-patches.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index 56742bc..7d44eae 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -12,6 +12,9 @@ I. For patch submitters
 
        devicetree@vger.kernel.org
 
+     and Cc: the DT maintainers. Use scripts/get_maintainer.pl to identify
+     all of the DT maintainers.
+
   3) The Documentation/ portion of the patch should come in the series before
      the code implementing the binding.
 
-- 
1.8.4
