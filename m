From: Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 1/4] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Thu, 27 Oct 2016 11:34:04 +0200
Message-ID: <1477560847-8929-2-git-send-email-abailon@baylibre.com>
References: <1477560847-8929-1-git-send-email-abailon@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477560847-8929-1-git-send-email-abailon@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, robh+dt@kernel.org, b-liu@ti.com
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Kulhavy <petr@barix.com>, Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Petr Kulhavy <petr@barix.com>

DT binding for the TI DA8xx/OMAP-L1x/AM17xx/AM18xx MUSB driver.

Signed-off-by: Petr Kulhavy <petr@barix.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../devicetree/bindings/usb/da8xx-usb.txt          | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
new file mode 100644
index 0000000..ccb844a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -0,0 +1,43 @@
+TI DA8xx MUSB
+~~~~~~~~~~~~~
+For DA8xx/OMAP-L1x/AM17xx/AM18xx platforms.
+
+Required properties:
+~~~~~~~~~~~~~~~~~~~~
+ - compatible : Should be set to "ti,da830-musb".
+
+ - reg: Offset and length of the USB controller register set.
+
+ - interrupts: The USB interrupt number.
+
+ - interrupt-names: Should be set to "mc".
+
+ - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
+
+ - phys: Phandle for the PHY device
+
+ - phy-names: Should be "usb-phy"
+
+Optional properties:
+~~~~~~~~~~~~~~~~~~~~
+ - vbus-supply: Phandle to a regulator providing the USB bus power.
+
+Example:
+	usb_phy: usb-phy {
+		compatible = "ti,da830-usb-phy";
+		#phy-cells = <0>;
+		status = "okay";
+	};
+	usb0: usb@200000 {
+		compatible = "ti,da830-musb";
+		reg =   <0x00200000 0x10000>;
+		interrupts = <58>;
+		interrupt-names = "mc";
+
+		dr_mode = "host";
+		vbus-supply = <&usb_vbus>;
+		phys = <&usb_phy 0>;
+		phy-names = "usb-phy";
+
+		status = "okay";
+	};
-- 
2.7.3
