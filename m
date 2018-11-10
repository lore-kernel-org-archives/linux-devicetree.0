From: zoro <long17.cool@163.com>
Subject: [PATCH 1/3] dt-bindings: define vendor prefix for whwave, Inc.
Date: Sat, 10 Nov 2018 16:43:51 +0800
Message-ID: <1541839433-28811-1-git-send-email-long17.cool@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zoro <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

Introduce vendor prefix for whwave, Inc.
for SD3078 rtc device.

Signed-off-by: zoro <long17.cool@163.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8..3d59d6a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -440,3 +440,4 @@ zidoo	Shenzhen Zidoo Technology Co., Ltd.
 zii	Zodiac Inflight Innovations
 zte	ZTE Corp.
 zyxel	ZyXEL Communications Corp.
+whwave	Shenzhen whwave Electronics crop
-- 
1.7.9.5
