From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/2] dt-bindings: extcon: Add support for fsa9480 switch
Date: Mon, 25 Feb 2019 17:58:21 +0100
Message-ID: <20190225165822.2770-2-pawel.mikolaj.chmiel@gmail.com>
References: <20190225165822.2770-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190225165822.2770-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

This patch adds documentation for binding of extcont Fairchild
Semiconductor FSA9480 microusb switch.
This usb port accessory detector and switch, can be found for example in
some Samsung s5pv210 based phones.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 .../bindings/extcon/extcon-fsa9480.txt        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
new file mode 100644
index 000000000000..ebced7b18eb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
@@ -0,0 +1,21 @@
+FAIRCHILD SEMICONDUCTOR FSA9480 MICROUSB SWITCH
+
+The FSA9480 is a USB port accessory detector and switch. The FSA9480 is fully
+controlled using I2C and enables USB data, stereo and mono audio, video,
+microphone, and UART data to use a common connector port.
+
+Required properties:
+ - compatible : Must be "fcs,fsa9480"
+ - reg : Specifies i2c slave address. Must be 0x25.
+ - interrupt-parent : Phandle to interrupt controller to which interrupt
+   signal of the chip is connected.
+ - interrupts : Should contain one entry specifying interrupt signal of
+   interrupt parent to which interrupt pin of the chip is connected.
+
+ Example:
+	musb@25 {
+		compatible = "fcs,fsa9480";
+		reg = <0x25>;
+		interrupt-parent = <&gph2>;
+		interrupts = <7 0>;
+	};
\ No newline at end of file
-- 
2.17.1
