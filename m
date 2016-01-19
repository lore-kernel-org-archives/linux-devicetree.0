From: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCHv2 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Tue, 19 Jan 2016 10:40:26 +0100
Message-ID: <1453196426-21399-2-git-send-email-sean.nyekjaer@prevas.dk>
References: <1453196426-21399-1-git-send-email-sean.nyekjaer@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1453196426-21399-1-git-send-email-sean.nyekjaer@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Sean Nyekjaer <sean.nyekjaer@prevas.dk>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
---
 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
new file mode 100644
index 0000000..56679ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
@@ -0,0 +1,9 @@
+* TI SN65HVS885 digital-input serializer
+
+Example:
+	sn65hvs885@3 {
+		compatible = "sn65hvs885";
+		spi-max-frequency = <10000000>;
+		reg = <0>;
+	};
+
-- 
2.7.0

