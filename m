From: dt.tangr@gmail.com
Subject: [PATCHv2] devicetree: bindings: document lsi,zevio-usb
Date: Wed,  5 Mar 2014 19:54:46 +1100
Message-ID: <1394009686-17155-1-git-send-email-dt.tangr@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Daniel Tang <dt.tangr@gmail.com>, robh+dt@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Peter.Chen@freescale.com
List-Id: devicetree@vger.kernel.org

From: Daniel Tang <dt.tangr@gmail.com>


Signed-off-by: Daniel Tang <dt.tangr@gmail.com>
---
 .../devicetree/bindings/usb/ci-hdrc-zevio.txt         |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt
new file mode 100644
index 0000000..abbcb2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-zevio.txt
@@ -0,0 +1,17 @@
+* LSI Zevio USB OTG Controller
+
+Required properties:
+- compatible: Should be "lsi,zevio-usb"
+- reg: Should contain registers location and length
+- interrupts: Should contain controller interrupt
+
+Optional properties:
+- vbus-supply: regulator for vbus
+
+Examples:
+		usb0: usb@b0000000 {
+			reg = <0xb0000000 0x1000>;
+			compatible = "lsi,zevio-usb";
+			interrupts = <8>;
+			vbus-supply = <&vbus_reg>;
+		};
-- 
1.7.10.4

