From: Jeremy Gebben <jgebben@sweptlaser.com>
Subject: [PATCH v3 2/4] dt-bindings: Add LM96000 as a trivial device
Date: Mon,  4 Feb 2019 13:19:04 -0700
Message-ID: <20190204201906.8859-3-jgebben@sweptlaser.com>
References: <20190204201906.8859-1-jgebben@sweptlaser.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204201906.8859-1-jgebben@sweptlaser.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The LM96000 is a temperature sensor and fan controller based
on the LM85.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index cc64ec63a6ad..d79fb22bde39 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -322,6 +322,8 @@ properties:
           - ti,ads7830
             # Temperature Monitoring and Fan Control
           - ti,amc6821
+            # Temperature sensor with integrated fan control
+          - ti,lm96000
             # I2C Touch-Screen Controller
           - ti,tsc2003
             # Low Power Digital Temperature Sensor with SMBUS/Two Wire Serial Interface
-- 
2.17.1
