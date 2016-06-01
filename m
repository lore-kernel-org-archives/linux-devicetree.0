From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 23/32] ARM: bcm2835: Enable SDHOST by default.
Date: Wed,  1 Jun 2016 23:43:32 +0200
Message-ID: <1464817421-8519-24-git-send-email-kraxel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Eric Anholt <eric@anholt.net>

This improves read speed on my SD card (as reported by hdparm -t) from
10.15MB/sec to 16.70MB/sec.  Once we add slave DMA, we can get to
18.45MB/sec.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index a207693..97496cd 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -65,8 +65,16 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_gpio48>;
 
+	bus-width = <4>;
+};
+
+&sdhost {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdhost_gpio48>;
+
+	bus-width = <4>;
+
 	status = "okay";
-	bus-width = <4>;
 };
 
 &pwm {
-- 
1.8.3.1
