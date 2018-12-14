From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/2] dt-bindings: nvmem: imx-ocotp: add compatible string for
 i.MX7ULP
Date: Fri, 14 Dec 2018 08:51:37 +0000
Message-ID: <1544777136-9195-2-git-send-email-Anson.Huang@nxp.com>
References: <1544777136-9195-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544777136-9195-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add new compatible string for i.MX7ULP SOC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Docume=
ntation/devicetree/bindings/nvmem/imx-ocotp.txt
index 792bc5f..ff389cf 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -11,6 +11,7 @@ Required properties:
 	"fsl,imx6ul-ocotp" (i.MX6UL),
 	"fsl,imx7d-ocotp" (i.MX7D/S),
 	"fsl,imx6sll-ocotp" (i.MX6SLL),
+	"fsl,imx7ulp-ocotp" (i.MX7ULP),
 	followed by "syscon".
 - #address-cells : Should be 1
 - #size-cells : Should be 1
--=20
2.7.4
