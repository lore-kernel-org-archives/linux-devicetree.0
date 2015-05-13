From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/3 v2] ARM: bcm2835: Add the firmware driver information to the RPi DT
Date: Wed, 13 May 2015 12:00:09 -0700
Message-ID: <1431543609-19646-4-git-send-email-eric@anholt.net>
References: <1431543609-19646-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431543609-19646-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Anholt <eric@anholt.net>
Acked-by: Lee Jones <lee@kernel.org> (previous version with pm-domains)
---

v2: Drop pm-domains stuff since I've dropped it from the firmware
    driver for now, until we get drivers/base fixed.

 arch/arm/boot/dts/bcm2835-rpi.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 46780bb..ace33f6 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -14,6 +14,13 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	soc {
+		firmware: firmware {
+			compatible = "raspberrypi,firmware";
+			mboxes = <&mailbox>;
+		};
+	};
 };
 
 &gpio {
-- 
2.1.4
