Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 07/10] dt-bindings: input: touchscreen: stmpe: add axes inversion and swap
Date: Mon, 27 May 2019 18:19:35 +0200
Message-ID: <20190527161938.31871-3-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

This driver too supports coordinate inversion on X,Y axes and
axes swapping via the common properties defined in touchscreen.txt

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index aee1abf06ddb..09d2d4f288cc 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -42,6 +42,10 @@ Optional properties:
 				The given window also affects the value range (limits) set
 				within the input subsystem which, in turn, affects
 				the input resolution calculation on both axes.
+- touchscreen-inverted-x: X axis is inverted (boolean)
+- touchscreen-inverted-y: Y axis is inverted (boolean)
+- touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
+				Swapping is done after inverting the axis
 - touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
 				the input resolution calculation on the horizontal axis.
 - touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
-- 
2.21.0
