From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] dt-bindings: vendor-prefixes: add AZW
Date: Thu,  4 Apr 2019 14:45:03 +0200
Message-ID: <20190404124504.11137-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Shenzhen AZW Technology Co. Ltd. is a manufacturer specialized in Android
smart TV boxes, Intel mini PCs and home cloud TV boxes with NAS.

Add the vendor prefix for AZW.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 8b4ae37629b2..8313edbaf52e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -54,6 +54,7 @@ avic	Shanghai AVIC Optoelectronics Co., Ltd.
 avnet	Avnet, Inc.
 axentia	Axentia Technologies AB
 axis	Axis Communications AB
+azw     Shenzhen AZW Technology Co., Ltd.
 bananapi BIPAI KEJI LIMITED
 bhf	Beckhoff Automation GmbH & Co. KG
 bitmain	Bitmain Technologies
-- 
2.17.1
