From: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH 3/3] NFC: trf7970a: Add DTS Documentation
Date: Fri, 31 Jan 2014 15:17:11 -0700
Message-ID: <1391206631-9862-4-git-send-email-mgreer@animalcreek.com>
References: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391206631-9862-1-git-send-email-mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Describe the properies used by the trf7970a
RFID/NFC/15693 transceiver driver.

Signed-off-by: Mark A. Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/trf7970a.txt       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt

diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
new file mode 100644
index 0000000..4256893
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -0,0 +1,37 @@
+* Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
+
+Required properties:
+- compatible: Should be "ti,trf7970a".
+- spi-max-frequency: Maximum SPI frequency (<= 2000000).
+- interrupt-parent: phandle of parent interrupt handler.
+- interrupts: A single interrupt specifier.
+- ti,enable-gpios: Two GPIO entries used for 'EN' and 'EN2' pins on the
+  TRF7970A.
+
+Optional properties:
+- ti,ss-gpio: GPIO used for Slave Select pin on TRF7970A.  Its presence
+  indicates that "SPI with SS mode" is used by the TRF7970A.
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controller.
+
+Example (for ARM-based BeagleBone with TRF7970A on SPI1):
+
+&spi1 {
+        status = "okay";
+
+        nfc@0 {
+                compatible = "ti,trf7970a";
+                reg = <0>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&trf7970a_default>;
+                spi-max-frequency = <2000000>;
+                interrupt-parent = <&gpio2>;
+                interrupts = <14 0>;
+                ti,enable-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>,
+                                <&gpio2 5 GPIO_ACTIVE_LOW>;
+                ti,ss-gpio = <&gpio1 30 GPIO_ACTIVE_LOW>;
+                status = "okay";
+        };
+};
-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
