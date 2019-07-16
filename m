From: Pramod Kumar <pramod.kumar_1@nxp.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: nxp: Add device tree binding for
 ls1046a-frwy board
Date: Tue, 16 Jul 2019 13:43:27 +0000
Message-ID: <1563284586-29928-2-git-send-email-pramod.kumar_1@nxp.com>
References: <1563284586-29928-1-git-send-email-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563284586-29928-1-git-send-email-pramod.kumar_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pramod Kumar <pramod.kumar_1@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

Add "fsl,ls1046a-frwy" bindings for ls1046afrwy board based on ls1046a SoC

Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation=
/devicetree/bindings/arm/fsl.yaml
index 407138e..86e9821 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -239,6 +239,7 @@ properties:
       - description: LS1046A based Boards
         items:
           - enum:
+              - fsl,ls1046a-frwy
               - fsl,ls1046a-qds
               - fsl,ls1046a-rdb
           - const: fsl,ls1046a
--=20
2.7.4
