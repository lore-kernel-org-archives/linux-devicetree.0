Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 05/10] dt-bindings: input: touchscreen: stmpe: add XY mode
Date: Mon, 27 May 2019 18:19:33 +0200
Message-ID: <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

This change documents the support of another input data
acquisition mode (XY). This mode is mostly relevant in
the context of/combination with the tracking index.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index d20dc5a7d8ad..aee1abf06ddb 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -28,6 +28,9 @@ Optional properties:
 				5 -> 10 ms
 				6 -> 50 ms
 				7 -> 100 ms
+- st,op-mod		: Axis information acquisition operating mode (Default is 0)
+				0 -> XYZ
+				1 -> XY
 - st,fraction-z		: Length of the fractional part in z (recommended is 7)
 			  (fraction-z ([0..7]) = Count of the fractional part)
 - st,i-drive		: current limit value of the touchscreen drivers
-- 
2.21.0
