Return-Path: <SRS0=ekVN=WG=inspur.com=wangzqbj@kernel.org>
From: John Wang <wangzqbj@inspur.com>
Subject: [PATCH v2 1/2] dt-bindings: Add ipsps1 as a trivial device
Date: Sat, 10 Aug 2019 17:53:25 +0800
Message-ID: <20190810095325.5333-1-wangzqbj@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain
To: robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, linux@roeck-us.net, venture@google.com, jgebben@sweptlaser.com, anson.huang@nxp.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, duanzhijia01@inspur.com, mine260309@gmail.com
List-ID: <devicetree@vger.kernel.org>

The ipsps1 is an Inspur Power System power supply unit

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
v2:
    - No changes.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 747fd3f689dc..63960c7d949a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -101,6 +101,8 @@ properties:
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Intersil ISL29028 Ambient Light and Proximity Sensor
+          - inspur,ipsps1
+            # Inspur Power System power supply unit version 1
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
           - isil,isl29030
-- 
2.17.1
