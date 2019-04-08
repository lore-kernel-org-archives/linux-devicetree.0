From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/6] dt-bindings: vendor-prefixes: add AZW
Date: Mon,  8 Apr 2019 11:26:15 +0200
Message-ID: <20190408092619.23152-3-peron.clem@gmail.com>
References: <20190408092619.23152-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408092619.23152-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Shenzhen AZW Technology Co. Ltd. is a manufacturer specialized in Android
smart TV boxes, Intel mini PCs and home cloud TV boxes with NAS.

Add the vendor prefix for AZW.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 208889476a38..4933403c4b57 100644
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
