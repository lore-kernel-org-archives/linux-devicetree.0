From: zoro <long17.cool@163.com>
Subject: [PATCH 1/3] dt-bindings: define vendor prefix for whwave, Inc.
Date: Fri, 23 Nov 2018 18:14:42 +0800
Message-ID: <1542968084-3982-1-git-send-email-long17.cool@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com
Cc: a.zummo@towertech.it, robh@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zoro <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

Introduce vendor prefix for whwave, Inc.
for SD3078 rtc device.

Signed-off-by: zoro <long17.cool@163.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8..7d2e9b01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -423,6 +423,7 @@ vot	Vision Optical Technology Co., Ltd.
 wd	Western Digital Corp.
 wetek	WeTek Electronics, limited.
 wexler	Wexler
+whwave	Shenzhen whwave Electronics crop
 wi2wi	Wi2Wi, Inc.
 winbond Winbond Electronics corp.
 winstar	Winstar Display Corp.
-- 
1.7.9.5
