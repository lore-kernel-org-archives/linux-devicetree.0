Return-Path: <SRS0=WIdc=VU=fb.com=prvs=210739c354=vijaykhemka@kernel.org>
From: Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Date: Mon, 22 Jul 2019 17:20:46 -0700
Message-ID: <20190723002052.2878847-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Kosina <trivial@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Herbert Xu <herbert@gondor.apana.org.au>, Patrick Venture <venture@google.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Vijay Khemka <vijaykhemka@fb.com>, Anson Huang <anson.huang@nxp.com>, Jeremy Gebben <jgebben@sweptlaser.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, joel@jms.id.au, linux-aspeed@lists.ozlabs.org, sdasari@fb.com
List-ID: <devicetree@vger.kernel.org>

The pxe1610 is a voltage regulator from Infineon. It also supports
other VRs pxe1110 and pxm1310 from Infineon.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 2e742d399e87..1be648828a31 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -99,6 +99,8 @@ properties:
             # Infineon IR38064 Voltage Regulator
           - infineon,ir38064
             # Infineon SLB9635 (Soft-) I2C TPM (old protocol, max 100khz)
+          - infineon,pxe1610
+            # Infineon PXE1610, PXE1110 and PXM1310 Voltage Regulators
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
           - infineon,slb9645tt
-- 
2.17.1
