From: Pramod Kumar <pramod.kumar_1@nxp.com>
Subject: [PATCH v4 0/2] arm64: dts: nxp: add ls1046a frwy board support
Date: Tue, 16 Jul 2019 13:43:23 +0000
Message-ID: <1563284586-29928-1-git-send-email-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pramod Kumar <pramod.kumar_1@nxp.com>
List-Id: devicetree@vger.kernel.org

changes for v4:
incorporated shawn review comment

Pramod Kumar (2):
  dt-bindings: arm: nxp: Add device tree binding for ls1046a-frwy board
  arm64: dts: nxp: add ls1046a-frwy board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 156 +++++++++++++++++=
++++
 3 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts

--=20
2.7.4
