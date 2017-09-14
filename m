From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: [PATCH] dt-bindings: fix vendor prefix for Abracon
Date: Thu, 14 Sep 2017 23:39:38 +0200
Message-ID: <20170914213938.4980-1-alexandre.belloni@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Commit 446810f2dd41 ("of: add vendor prefix for Abracon Corporation")
claimed that "abcn" was used as the vendor prefix while in fact "abracon"
was used in the subsequent commits. It is also the only prefix used in the
tree.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 69183f0fbc78..f4d3d1ca3383 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -3,7 +3,7 @@ Device tree binding vendor prefix registry.  Keep list in alphabetical order.
 This isn't an exhaustive list, but you should add new prefixes to it before
 using them to avoid name-space collisions.
 
-abcn	Abracon Corporation
+abracon	Abracon Corporation
 abilis	Abilis Systems
 actions	Actions Semiconductor Co., Ltd.
 active-semi	Active-Semi International Inc
-- 
2.14.1
