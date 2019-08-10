From: John Wang <wangzqbj@inspur.com>
Subject: [PATCH] dt-bindings: Add vendor prefix for Inspur Corporation
Date: Sat, 10 Aug 2019 17:58:36 +0800
Message-ID: <20190810095836.6573-1-wangzqbj@inspur.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, duanzhijia01@inspur.com, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a45e319..cc07237b8b89 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -401,6 +401,8 @@ patternProperties:
     description: Innolux Corporation
   "^inside-secure,.*":
     description: INSIDE Secure
+  "^inspur,.*":
+    description: Inspur Corporation
   "^intel,.*":
     description: Intel Corporation
   "^intercontrol,.*":
-- 
2.17.1
