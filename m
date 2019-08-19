From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: imx: add imx8mq nitrogen support
Date: Mon, 19 Aug 2019 19:26:05 +0200
Message-ID: <20190819172606.6410-2-dafna.hirschfeld@collabora.com>
References: <20190819172606.6410-1-dafna.hirschfeld@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819172606.6410-1-dafna.hirschfeld@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dafna.hirschfeld@collabora.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com, kernel@collabora.com, Gary Bisson <gary.bisson@boundarydevices.com>, Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: devicetree@vger.kernel.org

From: Gary Bisson <gary.bisson@boundarydevices.com>

The Nitrogen8M is an ARM based single board computer (SBC)
designed to leverage the full capabilities of NXP’s i.MX8M
Quad processor.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
[Dafna: porting vendor's code to mainline]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 362bf827cad1..16db1c699ba7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -224,6 +224,7 @@ properties:
       - description: i.MX8MQ based Boards
         items:
           - enum:
+              - boundary,imx8mq-nitrogen8m # i.MX8MQ NITROGEN Board
               - fsl,imx8mq-evk            # i.MX8MQ EVK Board
               - purism,librem5-devkit     # Purism Librem5 devkit
               - technexion,pico-pi-imx8m  # TechNexion PICO-PI-8M evk
-- 
2.20.1
