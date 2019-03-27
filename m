Return-Path: <SRS0=Zx4x=R6=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/4] dt-bindings: input: ads7846: fix property description
Date: Wed, 27 Mar 2019 14:39:25 +0100
Message-Id: <20190327133927.1340-3-m.felsch@pengutronix.de>
In-Reply-To: <20190327133927.1340-1-m.felsch@pengutronix.de>
References: <20190327133927.1340-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: kernel@pengutronix.de, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The ti,y-max is used for the maximum value of the Y axis.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
index 04413da51391..ce540ddac902 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
@@ -52,7 +52,7 @@ Optional properties:
 	ti,x-min			Minimum value on the X axis (u16).
 	ti,y-min			Minimum value on the Y axis (u16).
 	ti,x-max			Maximum value on the X axis (u16).
-	ti,y-max			Minimum value on the Y axis (u16).
+	ti,y-max			Maximum value on the Y axis (u16).
 	ti,pressure-min			Minimum reported pressure value
 					(threshold) - u16.
 	ti,pressure-max			Maximum reported pressure value (u16).
-- 
2.20.1
