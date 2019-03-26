From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 1/2] bindings: fsl-edma: Document fsl,imx8qm-edma compatbile
 string
Date: Tue, 26 Mar 2019 09:43:00 +0000
Message-ID: <20190326094239.5910-2-daniel.baluta@nxp.com>
References: <20190326094239.5910-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326094239.5910-1-daniel.baluta@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Teo Hall <teo.hall@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

Add imx8qm edma support.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/dma/fsl-edma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl-edma.txt b/Documenta=
tion/devicetree/bindings/dma/fsl-edma.txt
index 97e213e07660..5294ee094313 100644
--- a/Documentation/devicetree/bindings/dma/fsl-edma.txt
+++ b/Documentation/devicetree/bindings/dma/fsl-edma.txt
@@ -9,6 +9,7 @@ group, DMAMUX0 or DMAMUX1, but not both.
 Required properties:
 - compatible :
 	- "fsl,vf610-edma" for eDMA used similar to that on Vybrid vf610 SoC
+	- "fsl,imx8qm-edma" for eDMA used similar to that on i.MX8 SoC
 - reg : Specifies base physical address(s) and size of the eDMA registers.
 	The 1st region is eDMA control register's address and size.
 	The 2nd and the 3rd regions are programmable channel multiplexing
--=20
2.17.1
