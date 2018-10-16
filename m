From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 6/9] ASoC: dt-bindings: bcm2835-rpi: add onboard audio bindings
Date: Tue, 16 Oct 2018 17:02:25 +0200
Message-ID: <20181016150228.16994-7-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

Adds a device tree binding file for Raspberry pi's Headphones and HDMI
audio output devices.

Based on raspberry's downstream kernel implementation:
https://github.com/raspberrypi/linux/blob/rpi-4.14.y/arch/arm/boot/dts/bcm2708-rpi.dtsi

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 .../bindings/sound/brcm,bcm2835-audio.txt         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt b/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
new file mode 100644
index 000000000000..ee6fa085aaa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
@@ -0,0 +1,15 @@
+Broadcom BCM283x audio device
+
+Required properties:
+
+- compatible: Should be "brcm,bcm2835-audio"
+- brcm,pwm-channels: number of PWM channels, they are behind RPi's Video Core
+		     IV, not actual Linux PWM devices.
+
+Example:
+
+audio: audio {
+	compatible = "brcm,bcm2835-audio";
+	brcm,pwm-channels = <8>;
+};
+
-- 
2.19.1
