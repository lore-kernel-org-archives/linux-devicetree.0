Return-Path: <SRS0=MGmW=T3=klsmartin.com=Leif.Middelschulte@kernel.org>
From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Subject: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add resolution support
Date: Mon, 27 May 2019 18:07:29 +0200
Message-ID: <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
In-Reply-To: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Leif Middelschulte <leif.middelschulte@klsmartin.com>
List-ID: <devicetree@vger.kernel.org>

This documents the support for specifying the screen size in milimeter
and its impact on resolution calculation.

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
---
 Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
index 04962e2e1ad0..d20dc5a7d8ad 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
@@ -39,6 +39,10 @@ Optional properties:
 				The given window also affects the value range (limits) set
 				within the input subsystem which, in turn, affects
 				the input resolution calculation on both axes.
+- touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
+				the input resolution calculation on the horizontal axis.
+- touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
+				the input resolution calculation on the vertical axis.
 
 
 Optional properties common with MFD (deprecated):
-- 
2.21.0
