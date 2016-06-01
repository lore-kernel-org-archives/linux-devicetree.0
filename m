From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 30/32] ARM: bcm2835: Add a new EMMC pin group from the downstream tree.
Date: Wed,  1 Jun 2016 23:43:39 +0200
Message-ID: <1464817421-8519-31-git-send-email-kraxel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric@anholt.net>

This will be used for having EMMC (sdhci-bcm2835.c) drive the
wireless.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm283x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 30e6f46..f186ef9 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -257,6 +257,11 @@
 				brcm,pins = <32 33>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
 			};
+			emmc_gpio34: emmc_gpio34 {
+				brcm,pins = <34 35 36 37 38 39>;
+				brcm,function = <BCM2835_FSEL_ALT3>;
+				brcm,pull = <0 2 2 2 2 2>;
+			};
 			emmc_gpio48: emmc_gpio48 {
 				brcm,pins = <48 49 50 51 52 53>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
-- 
1.8.3.1
