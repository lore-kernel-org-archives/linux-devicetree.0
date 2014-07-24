From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 06/11] ARM: dts: zynq: Add DMAC for Parallella
Date: Fri, 25 Jul 2014 01:00:15 +0200
Message-ID: <1406242820-20140-7-git-send-email-afaerber@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New
=20
 arch/arm/boot/dts/zynq-7000.dtsi      | 17 +++++++++++++++++
 arch/arm/boot/dts/zynq-parallella.dts |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index eed3df0..1a70277 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -223,6 +223,23 @@
 			};
 		};
=20
+		dmac_s: dmac@f8003000 {
+			compatible =3D "arm,pl330", "arm,primecell";
+			reg =3D <0xf8003000 0x1000>;
+			status =3D "disabled";
+			interrupt-parent =3D <&intc>;
+			interrupts =3D <0 13 4>,
+			             <0 14 4>, <0 15 4>,
+			             <0 16 4>, <0 17 4>,
+			             <0 40 4>, <0 41 4>,
+			             <0 42 4>, <0 43 4>;
+			#dma-cells =3D <1>;
+			#dma-channels =3D <8>;
+			#dma-requests =3D <4>;
+			clocks =3D <&clkc 27>;
+			clock-names =3D "apb_pclk";
+		};
+
 		devcfg: devcfg@f8007000 {
 			compatible =3D "xlnx,zynq-devcfg-1.0";
 			reg =3D <0xf8007000 0x100>;
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index 56f68ea..e60a0a9 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -34,6 +34,10 @@
 	};
 };
=20
+&dmac_s {
+	status =3D "okay";
+};
+
 &gem0 {
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
--=20
1.9.3
