From: John Wang <wangzqbj@inspur.com>
Subject: [PATCH v3 1/2] dt-bindings: Add ipsps1 as a trivial device
Date: Mon, 12 Aug 2019 10:52:42 +0800
Message-ID: <20190812025242.15570-1-wangzqbj@inspur.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, linux@roeck-us.net, venture@google.com, anson.huang@nxp.com, jgebben@sweptlaser.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, miltonm@us.ibm.com, mine260309@gmail.com, duanzhijia01@inspur.com, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The ipsps1 is an Inspur Power System power supply unit

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
v3:
    - Fix adding entry to the inappropriate line
v2:
    - No changes.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 747fd3f689dc..8f21498faa92 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -100,6 +100,8 @@ properties:
           - infineon,slb9645tt
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Inspur Power System power supply unit version 1
+          - inspur,ipsps1
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
-- 
2.17.1
