From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/4] arm64: dts: marvell: Rename armada-37xx USB node
Date: Wed, 23 Mar 2016 23:24:19 +0100
Message-ID: <1458771861-12392-3-git-send-email-afaerber@suse.de>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

No need to reflect the USB version in the node name.

=46ixes: adbc3695d9e4 ("arm64: dts: add the Marvell Armada 3700 family =
and a development board")
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/=
boot/dts/marvell/armada-37xx.dtsi
index 4328c2408a8a..55a861d60fae 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -105,7 +105,7 @@
 				status =3D "disabled";
 			};
=20
-			usb3: usb3@58000 {
+			usb3: usb@58000 {
 				compatible =3D "generic-xhci";
 				reg =3D <0x58000 0x4000>;
 				interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
--=20
2.6.2
