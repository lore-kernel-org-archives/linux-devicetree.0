Return-Path: <SRS0=MMxF=TJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from bmailout3.hostsharing.net ([176.9.242.62]:49117 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfEIRDN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 May 2019 13:03:13 -0400
Message-Id: <ab21b59ece7db065ee86f6f0c0a7623144db52b4.1557419583.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 9 May 2019 19:03:00 +0200
Subject: [PATCH] ARM: bcm283x: Enable DMA support for SPI controller
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Martin Sperl <kernel@martin.sperl.org>, Noralf Tronnes <noralf@tronnes.org>, linux-rpi-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Without this, the driver for the BCM2835 SPI controller uses interrupt
mode instead of DMA mode, incurring a significant performance penalty.
The Foundation's device tree has had these attributes for years, but for
some reason they were never upstreamed.

They were originally contributed by Noralf Trønnes and Martin Sperl:
https://github.com/raspberrypi/linux/commit/25f3e064afc8
https://github.com/raspberrypi/linux/commit/e0edb52b47e6

The DREQ numbers 6 and 7 are documented in section 4.2.1.3 of:
https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf

Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: Martin Sperl <kernel@martin.sperl.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 9777644..4b21ddb 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -431,6 +431,8 @@
 			reg = <0x7e204000 0x1000>;
 			interrupts = <2 22>;
 			clocks = <&clocks BCM2835_CLOCK_VPU>;
+			dmas = <&dma 6>, <&dma 7>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.20.1
