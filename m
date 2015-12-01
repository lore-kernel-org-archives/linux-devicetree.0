From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [PATCH 1/3] Device tree binding documentation for chromeos-firmware
Date: Tue,  1 Dec 2015 19:12:49 +0000
Message-ID: <1448997171-7064-2-git-send-email-martyn.welch@collabora.co.uk>
References: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448997171-7064-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-kernel@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the chromeos-firmware binding.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
---
 .../devicetree/bindings/misc/chromeos-firmware.txt | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/chromeos-firmware.txt

diff --git a/Documentation/devicetree/bindings/misc/chromeos-firmware.txt b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
new file mode 100644
index 0000000..8240611
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/chromeos-firmware.txt
@@ -0,0 +1,27 @@
+Device-Tree bindings for chromeos-firmware.c.
+
+Required properties:
+	- compatible = "google,gpio-firmware";
+
+Each signal is represented as a sub-node of "chromeos_firmware":
+Subnode properties:
+
+	- gpios: OF device-tree gpio specification.
+
+Example nodes:
+
+	chromeos_firmware {
+		compatible = "google,gpio-firmware";
+
+		write-protect {
+			gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		developer-switch {
+			gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		recovery-switch {
+			gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
+		};
+	};
-- 
2.1.4
