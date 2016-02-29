From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 7/8] ARM64: dts: amlogic: Extend GXBaby GIC node
Date: Tue,  1 Mar 2016 00:44:24 +0100
Message-ID: <1456789465-2962-8-git-send-email-afaerber@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-meson@googlegroups.com
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add GICH and GICV resources for HYP mode - guess based on other vendors=
=2E

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/b=
oot/dts/amlogic/meson-gxbb.dtsi
index 0ae089bd1806..5088ae3ff653 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -117,7 +117,9 @@
 		gic: interrupt-controller@c4301000 {
 			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
 			reg =3D <0x0 0xc4301000 0 0x1000>,
-			      <0x0 0xc4302000 0 0x0100>;
+			      <0x0 0xc4302000 0 0x0100>,
+			      <0x0 0xc4304000 0 0x2000>,
+			      <0x0 0xc4306000 0 0x2000>;
 			interrupt-controller;
 			interrupts =3D <GIC_PPI 9
 				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
--=20
2.6.2
