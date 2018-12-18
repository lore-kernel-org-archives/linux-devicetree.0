From: Nipun Gupta <nipun.gupta@nxp.com>
Subject: [PATCH 2/2] arm64: dts: ls1088: add missing dma-coherent property in
 fsl-mc
Date: Tue, 18 Dec 2018 04:52:02 +0000
Message-ID: <1545109016-1779-2-git-send-email-nipun.gupta@nxp.com>
References: <1545109016-1779-1-git-send-email-nipun.gupta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545109016-1779-1-git-send-email-nipun.gupta@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Nipun Gupta <nipun.gupta@nxp.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Nipun Gupta <nipun.gupta@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index dec0c2d..b8e31a1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -577,6 +577,7 @@
 			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
 			msi-parent =3D <&its>;
 			iommu-map =3D <0 &smmu 0 0>;	/* This is fixed-up by u-boot */
+			dma-coherent;
 			#address-cells =3D <3>;
 			#size-cells =3D <1>;
=20
--=20
1.9.1
