From: Bo Shen <voice.shen@atmel.com>
Subject: [PATCH] ARM: at91: at91sam9x5: add clocks for usb device
Date: Fri, 11 Jul 2014 18:22:55 +0800
Message-ID: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, jiri.prchal@aksignal.cz
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bo Shen <voice.shen@atmel.com>
List-Id: devicetree@vger.kernel.org

Add clocks for usb device, or else switch to CCF, the gadget
won't work.

Reported-by: Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz>
Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 arch/arm/boot/dts/at91sam9x5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91=
sam9x5.dtsi
index d6133f4..2ebc421 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -1045,6 +1045,8 @@
 				reg =3D <0x00500000 0x80000
 				       0xf803c000 0x400>;
 				interrupts =3D <23 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks =3D <&usb>, <&udphs_clk>;
+				clock-names =3D "hclk", "pclk";
 				status =3D "disabled";
=20
 				ep0 {
--=20
1.8.5.2
