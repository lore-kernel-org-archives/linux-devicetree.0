From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 7/9] ARM: dts: bcm2835-rpi: add onboard audio device
Date: Tue, 16 Oct 2018 17:02:26 +0200
Message-ID: <20181016150228.16994-8-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

The audio device interfaces with VCHIQ to send audio through the rpi's
Headphones & HDMI.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index cb2d6d78a7fb..6cc580d17862 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -35,6 +35,11 @@
 			reg = <0x7e00b840 0xf>;
 			interrupts = <0 2>;
 		};
+
+		audio: audio {
+			compatible = "brcm,bcm2835-audio";
+			brcm,pwm-channels = <8>;
+		};
 	};
 };
 
-- 
2.19.1
