From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 2/2] arm64: dts: ls1088a: Add missing dma-ranges property
Date: Tue, 4 Dec 2018 16:33:07 +0000
Message-ID: <1543941180-5147-2-git-send-email-ruxandra.radulescu@nxp.com>
References: <1543941180-5147-1-git-send-email-ruxandra.radulescu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543941180-5147-1-git-send-email-ruxandra.radulescu@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

LS1088A has a 48-bit address size so make sure that the
dma-ranges property reflects this.

Signed-off-by: Ioana Radulescu <ruxandra.radulescu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index ba5ce73..e73e55f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -191,6 +191,7 @@
 		#address-cells =3D <2>;
 		#size-cells =3D <2>;
 		ranges;
+		dma-ranges =3D <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
=20
 		clockgen: clocking@1300000 {
 			compatible =3D "fsl,ls1088a-clockgen";
--=20
2.7.4
