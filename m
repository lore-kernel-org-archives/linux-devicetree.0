From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/2] dt-bindings: trivial: add ti,lm3630a binding
Date: Sat, 24 Nov 2018 09:17:02 -0500
Message-ID: <20181124141703.29232-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan@marek.ca, ctatlor97@gmail.com
List-Id: devicetree@vger.kernel.org

Add a trivial binding for the Texas Instruments LM3630A Backlight Chip.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 Documentation/devicetree/bindings/trivial-devices.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Documentation/devicetree/bindings/trivial-devices.txt
index 6ab001fa1ed4..86486368dc35 100644
--- a/Documentation/devicetree/bindings/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/trivial-devices.txt
@@ -182,6 +182,7 @@ taos,tsl2550		Ambient Light Sensor with SMBUS/Two Wire Serial Interface
 ti,ads7828		8-Channels, 12-bit ADC
 ti,ads7830		8-Channels, 8-bit ADC
 ti,amc6821		Temperature Monitoring and Fan Control
+ti,lm3630a		Texas Instruments LM3630A Backlight Chip
 ti,tsc2003		I2C Touch-Screen Controller
 ti,tmp102		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
 ti,tmp103		Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-- 
2.17.2
