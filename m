Return-Path: <robherring2@gmail.com>
Received: from localhost.localdomain (24-223-123-72.static.usa-companies.net. [24.223.123.72])
        by smtp.googlemail.com with ESMTPSA id s63-v6sm4148871ywg.65.2018.06.05.15.50.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jun 2018 15:50:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: submitting-patches: add guidance on patch content and subject
Date: Tue,  5 Jun 2018 16:50:04 -0600
Message-Id: <20180605225004.3015-1-robh@kernel.org>
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Clarify that binding patches should also include include/dt-bindings/*
as part of them. The binding doc defines the ABI and the includes are
part of that. Add some details on the preferred subject prefix and
contents.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/submitting-patches.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
index 274058c583dd..de0d6090c0fd 100644
--- a/Documentation/devicetree/bindings/submitting-patches.txt
+++ b/Documentation/devicetree/bindings/submitting-patches.txt
@@ -6,7 +6,14 @@ I. For patch submitters
   0) Normal patch submission rules from Documentation/process/submitting-patches.rst
      applies.
 
-  1) The Documentation/ portion of the patch should be a separate patch.
+  1) The Documentation/ and include/dt-bindings/ portion of the patch should
+     be a separate patch. The preferred subject prefix for binding patches is:
+
+       "dt-bindings: <binding dir>: ..."
+
+     The 80 characters of the subject are precious. It is recommended to not
+     use "Documentation" or "doc" because that is implied. All bindings are
+     docs. Repeating "binding" again should also be avoided.
 
   2) Submit the entire series to the devicetree mailinglist at
 
-- 
2.17.0
