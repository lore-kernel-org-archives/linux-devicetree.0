From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v7 1/3] Documentation: dt: net: add ath9k wireless device binding
Date: Sun,  2 Oct 2016 23:47:41 +0200
Message-ID: <20161002214743.2263-2-martin.blumenstingl@googlemail.com>
References: <20160906214623.20424-1-martin.blumenstingl@googlemail.com>
 <20161002214743.2263-1-martin.blumenstingl@googlemail.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161002214743.2263-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath9k-devel-xDcbHBWguxHbcTqmT+pZeQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath9k-devel-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org
Cc: mcgrof-3uybbJdB1yH774rrrx3eTA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org, linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation how devicetree can be used to configure ath9k based
devices.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../devicetree/bindings/net/wireless/qca,ath9k.txt | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt

diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
new file mode 100644
index 0000000..9b58ede
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
@@ -0,0 +1,30 @@
+* Qualcomm Atheros ath9k wireless devices
+
+This node provides properties for configuring the ath9k wireless device. The
+node is expected to be specified as a child node of the PCI controller to
+which the wireless chip is connected.
+
+Required properties:
+- compatible: For PCI and PCIe devices this should be an identifier following
+		the format as defined in "PCI Bus Binding to Open Firmware"
+		Revision 2.1. One of the possible formats is "pciVVVV,DDDD"
+		where VVVV is the PCI vendor ID and DDDD is PCI device ID.
+- reg: Address and length of the register set for the device.
+
+Optional properties:
+- qca,no-eeprom: Indicates that there is no physical EEPROM connected to the
+			ath9k wireless chip (in this case the calibration /
+			EEPROM data will be loaded from userspace using the
+			kernel firmware loader).
+- mac-address: See ethernet.txt in the parent directory
+- local-mac-address: See ethernet.txt in the parent directory
+
+
+In this example, the node is defined as child node of the PCI controller:
+&pci0 {
+	ath9k@168c,002d {
+		compatible = "pci168c,002d";
+		reg = <0x7000 0 0 0 0x1000>;
+		qca,no-eeprom;
+	};
+};
-- 
2.10.0
