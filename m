From: Patrick Venture <venture@google.com>
Subject: [PATCH 1/2] dt-bindings: Add ir38064 as a trivial device
Date: Tue, 16 Apr 2019 08:41:38 -0700
Message-ID: <20190416154138.124734-1-venture@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: venture@google.com, robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The ir38064 is a voltage regulator from Infineon.

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d79fb22bde39..92184ef0db2e 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -92,6 +92,8 @@ properties:
           - fsl,sgtl5000
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
           - gmt,g751
+            # Infineon IR38064 Voltage Regulator
+          - infineon,ir38064
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
-- 
2.21.0.392.gf8f6787159e-goog
