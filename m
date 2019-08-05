From: Elon Zhang <zhangzj@rock-chips.com>
Subject: [PATCH v1 1/1] dt-bindings: Add Vendor prefix for Beiqi
Date: Mon,  5 Aug 2019 10:39:53 +0800
Message-ID: <20190805023953.11231-1-zhangzj@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, luowz@beiqicloud.com, Elon Zhang <zhangzj@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add devicetree vendor prefix for Beiqi.
http://www.beiqicloud.com/

Signed-off-by: Elon Zhang <zhangzj@rock-chips.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1acf806b62bf..1092360d8868 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -135,6 +135,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
+  "^beiqi,.*":
+    description: Xiamen Beiqi Technology Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bitmain,.*":
-- 
2.17.1
