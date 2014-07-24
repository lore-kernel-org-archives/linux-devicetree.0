From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 08/11] ARM: dts: zynq: Add VDMA to Parallella
Date: Fri, 25 Jul 2014 01:00:17 +0200
Message-ID: <1406242820-20140-9-git-send-email-afaerber@suse.de>
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
 arch/arm/boot/dts/zynq-parallella.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index e60a0a9..8beaacc 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -32,6 +32,31 @@
 		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcblk=
0p2 rootfstype=3Dext4 rw rootwait";
 		linux,stdout-path =3D "/amba/serial@e0001000";
 	};
+
+	fpga {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		ranges;
+
+		axi_vdma: axi-vdma@43000000 {
+			compatible =3D "xlnx,axi-vdma-1.00.a";
+			reg =3D <0x43000000 0x1000>;
+			#dma-cells =3D <1>;
+			xlnx,num-fstores =3D <3>;
+			xlnx,include-sg =3D <0>;
+			xlnx,flush-fsync =3D <2>;
+
+			dma-channel@43000000 {
+				compatible =3D "xlnx,axi-vdma-mm2s-channel";
+				interrupt-parent =3D <&intc>;
+				interrupts =3D <0 59 4>;
+				xlnx,datawidth =3D <64>;
+				xlnx,include-dre =3D <0>;
+				xlnx,genlock-mode =3D <0>;
+			};
+		};
+	};
 };
=20
 &dmac_s {
--=20
1.9.3
