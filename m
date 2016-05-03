From: Venkat Reddy Talla <vreddytalla@nvidia.com>
Subject: [PATCH 2/2] extcon: gpio: add DT binding doc for extcon-gpio
Date: Tue, 3 May 2016 11:19:51 +0530
Message-ID: <1462254591-8907-2-git-send-email-vreddytalla@nvidia.com>
References: <1462254591-8907-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462254591-8907-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: devicetree@vger.kernel.org

Addiing DT binding doc for the extcon gpios properties.

Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
---
 .../devicetree/bindings/extcon/extcon-gpio.txt        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
new file mode 100644
index 0000000..4a49c23
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
@@ -0,0 +1,19 @@
+EXTCON FOR GPIO
+
+Required Properties:
+ - compatible : Should be "extcon-gpio";
+
+Optional Properties:
+ - extcon-gpio,name: Name of extcon device.
+ - gpio: gpio number.
+ - extcon-gpio,irq-flags: IRQ flags for GPIO.
+ - extcon-gpio,debounce: Debounce time in ms.
+ - extcon-gpio,connection-state-low: boolean, Connection state with
+                gpio state. True if gpio low means connected.
+
+extcon-gpio {
+	compatible = "extcon-gpio";
+        extcon-gpio,name = "VBUS";
+	gpio = <&gpio 20 0>;
+	extcon-gpio,cable-names = <EXTCON_USB EXTCON_NONE>;
+};
-- 
2.1.4
