From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/3 v3] dt/bindings: Add binding for the Raspberry Pi firmware driver
Date: Mon, 18 May 2015 10:59:34 -0700
Message-ID: <1431971974-26798-1-git-send-email-eric@anholt.net>
References: <1431543609-19646-2-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431543609-19646-2-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

This driver will provide support for calls into the firmware that will
be used by other drivers like cpufreq and vc4.
---

v2: Improve commit message, point to mailbox.txt for how mboxes work.
v3: Use Lee's suggestion for mailbox phandle docs, fix spelling of
    "raspberry".

 .../devicetree/bindings/arm/bcm/raspberrypi,firmware.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
new file mode 100644
index 0000000..dbf60f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
@@ -0,0 +1,14 @@
+Raspberry Pi VideoCore firmware driver
+
+Required properties:
+
+- compatible:		Should be "rasbperrypi,firmware"
+- mboxes:		Phandle to the firmware device's Mailbox.
+			  (See: ../mailbox/mailbox.txt for more information)
+
+Example:
+
+firmware {
+	compatible = "raspberrypi,firmware";
+	mboxes = <&mailbox>;
+};
-- 
2.1.4
