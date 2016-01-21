From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCH v4 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Thu, 21 Jan 2016 07:41:36 +0100
Message-ID: <1453358496-4902-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1453358496-4902-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1453358496-4902-1-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
Changes since v3:
- Added gpio-controller and gpio cells flags

 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
new file mode 100644
index 0000000..6d99c9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
@@ -0,0 +1,11 @@
+* TI SN65HVS885 digital-input serializer
+
+Example:
+	sn65hvs885@3 {
+		compatible = "sn65hvs885";
+		spi-max-frequency = <10000000>;
+		reg = <0>;
+		gpio-controller;
+		#gpio-cells = <1>;
+	};
+
-- 
2.7.0

