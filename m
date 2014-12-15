From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 3/3] ARM: mvebu: ISL12057 rtc chip can now wake up RN102, RN102 and RN2120
Date: Tue, 16 Dec 2014 00:55:07 +0100
Message-ID: <e6f3c92501f216342ae28f48cf70f89166864bb4.1418687005.git.arno@natisbad.org>
References: <cover.1418687005.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1418687005.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Now that alarm support for ISL12057 chip is available w/ the specific
"isil,irq2-can-wakeup-machine" property, let's use that feature of the
driver dedicated to NETGEAR ReadyNAS 102, 104 and 2120 specific
routing of RTC Alarm IRQ#2 pin; on those devices, this pin is not
connected to the SoC but to a PMIC, which allows the device to be
powered up when RTC alarm rings.

For that to work, the chip needs to be explicitly marked as a device
wakeup source using this "isil,irq2-can-wakeup-machine" boolean
property. This makes 'wakealarm' sysfs entry available to configure
the alarm.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 arch/arm/boot/dts/armada-370-netgear-rn102.dts | 1 +
 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 1 +
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-netgear-rn102.dts b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
index 4e24932c6e30..1c83b7ce0982 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn102.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn102.dts
@@ -87,6 +87,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
+					isil,irq2-can-wakeup-machine;
 				};
 
 				g762: g762@3e {
diff --git a/arch/arm/boot/dts/armada-370-netgear-rn104.dts b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
index 30586e47986a..5fbfe02964dc 100644
--- a/arch/arm/boot/dts/armada-370-netgear-rn104.dts
+++ b/arch/arm/boot/dts/armada-370-netgear-rn104.dts
@@ -93,6 +93,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
+					isil,irq2-can-wakeup-machine;
 				};
 
 				g762: g762@3e {
diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index d81430aa4ab3..fc8bdfcd2348 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -100,6 +100,7 @@
 				isl12057: isl12057@68 {
 					compatible = "isil,isl12057";
 					reg = <0x68>;
+					isil,irq2-can-wakeup-machine;
 				};
 
 				/* Controller for rear fan #1 of 3 (Protechnic
-- 
2.1.1

