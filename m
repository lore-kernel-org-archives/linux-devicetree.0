From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 2/2] arm64: dts: lx2160a: Add dma-ranges property
Date: Thu, 20 Dec 2018 17:02:04 +0000
Message-ID: <1545325306-1681-2-git-send-email-ruxandra.radulescu@nxp.com>
References: <1545325306-1681-1-git-send-email-ruxandra.radulescu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545325306-1681-1-git-send-email-ruxandra.radulescu@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add missing property from the soc node in LX2160A dts.

Signed-off-by: Ioana Radulescu <ruxandra.radulescu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-lx2160a.dtsi
index 2366fd6..825624e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -398,6 +398,7 @@
 		#address-cells =3D <2>;
 		#size-cells =3D <2>;
 		ranges;
+		dma-ranges =3D <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
=20
 		crypto: crypto@8000000 {
 			compatible =3D "fsl,sec-v5.0", "fsl,sec-v4.0";
--=20
2.7.4
