From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v5 1/3] dt/bindings: Add binding for the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 17:07:33 -0700
Message-ID: <1432858055-8750-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This driver will provide support for calls into the firmware that will
be used by other drivers like cpufreq and vc4.

v2: Improve commit message, point to mailbox.txt for how mboxes work.
v3: Use Lee's suggestion for mailbox phandle docs, fix spelling of
    "raspberry".
v4: Change the compatible string to "raspberrypi,bcm2835-firmware"
    (requested by Lee, agreed by Stephen)

Acked-by: Stephen Warren <swarren@wwwdotorg.org>
---
 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt
new file mode 100644
index 0000000..5fb1868
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.txt
@@ -0,0 +1,14 @@
+Raspberry Pi VideoCore firmware driver
+
+Required properties:
+
+- compatible:		Should be "rasbperrypi,bcm2835-firmware"
+- mboxes:		Phandle to the firmware device's Mailbox.
+			  (See: ../mailbox/mailbox.txt for more information)
+
+Example:
+
+firmware {
+	compatible = "raspberrypi,bcm2835-firmware";
+	mboxes = <&mailbox>;
+};
-- 
2.1.4
