From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH 1/4] dt-bindings: iio: frequency: Use dt-schema for clock-names
Date: Mon, 24 Jun 2019 18:11:37 +0300
Message-ID: <1561389097-26075-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan.popa@analog.com
List-Id: devicetree@vger.kernel.org

Dt-schema can be used for clock-names property.

Signed-off-by: Stefan Popa <stefan.popa@analog.com>
---
 Documentation/devicetree/bindings/iio/frequency/adf4371.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
index d7adf074..8a2a8f6 100644
--- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
+++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
@@ -27,9 +27,8 @@ properties:
     maxItems: 1
 
   clock-names:
-    description:
-      Must be "clkin"
-    maxItems: 1
+    items:
+      - clkin
 
 required:
   - compatible
-- 
2.7.4
