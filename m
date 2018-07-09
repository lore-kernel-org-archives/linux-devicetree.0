Return-Path: <SRS0=7VqK=JZ=amarulasolutions.com=anthony@kernel.org>
From: Anthony Brandon <anthony@amarulasolutions.com>
Subject: [PATCH v2 3/4] dt-bindings: sound: wm8994: document wlf,csnaddr-pd property
Date: Mon,  9 Jul 2018 19:46:45 +0200
Message-Id: <1531158406-18646-3-git-send-email-anthony@amarulasolutions.com>
In-Reply-To: <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
References: <20180709160631.GU18740@imbe.wolfsonmicro.main>
 <1531158406-18646-1-git-send-email-anthony@amarulasolutions.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com, alberto@amarulasolutions.com, devicetree@vger.kernel.org
Cc: Anthony Brandon <anthony@amarulasolutions.com>
List-ID: <devicetree@vger.kernel.org>

Add the wlf,csnaddr-pd property to allow the CS/Addr pull-down to be
controlled from the device tree.

Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
 Documentation/devicetree/bindings/sound/wm8994.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index b74a221..0795931 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -60,6 +60,9 @@ Optional properties:
   - wlf,spkmode-pu : If present enable the internal pull-up resistor on
     the SPKMODE pin.
 
+  - wlf,csnaddr-pd : If present enable the internal pull-down resistor on
+    the CS/ADDR pin.
+
 Example:
 
 wm8994: codec@1a {
-- 
2.7.4
