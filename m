From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH] Documentation: dt: gpio-keys-polled: add missed "label" property description
Date: Tue, 14 Jun 2016 14:52:31 +0300
Message-ID: <1465905151-1960-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: Alexandre Pereira da Silva <aletes.xgr@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/input/gpio-keys-polled.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys-polled.txt b/Documentation/devicetree/bindings/input/gpio-keys-polled.txt
index 95d0fb1..e84d3eb 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys-polled.txt
+++ b/Documentation/devicetree/bindings/input/gpio-keys-polled.txt
@@ -7,6 +7,7 @@ Required properties:
 Optional properties:
 	- autorepeat: Boolean, Enable auto repeat feature of Linux input
 	  subsystem.
+	- label: String, name of the input device.
 
 Each button (key) is represented as a sub-node of "gpio-keys-polled":
 Subnode properties:
-- 
2.7.0

