From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] ARM: dts: zynq: Enable PL clocks for Parallella
Date: Thu,  6 Nov 2014 18:22:10 +0100
Message-ID: <1415294531-8942-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Olof Johansson <olof@lixom.net>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The Parallella board comes with a U-Boot bootloader that loads one of
two predefined FPGA bitstreams before booting the kernel. Both define a=
n
AXI interface to the on-board Epiphany processor.

Enable clocks FCLK0..FCLK3 for the Programmable Logic by default.

Otherwise accessing, e.g., the ESYSRESET register freezes the board,
as seen with the Epiphany SDK tools e-reset and e-hw-rev, using /dev/me=
m.

Cc: <stable@vger.kernel.org> # 3.17.x
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Michal/Olof, please consider this trivial patch as a fix for 3.18.

 arch/arm/boot/dts/zynq-parallella.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index e1f51ca127fe..0429bbd89fba 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -34,6 +34,10 @@
 	};
 };
=20
+&clkc {
+	fclk-enable =3D <0xf>;
+};
+
 &gem0 {
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
--=20
2.1.2
