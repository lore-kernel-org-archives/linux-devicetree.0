From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCHv2] Description of the realtek bluetooth device tree hooks
Date: Thu,  3 Jan 2019 16:35:37 +0000
Message-ID: <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
References: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: marcel@holtmann.org, johan.hedberg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-bluetooth@vger.kernel.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the desrciption file that describes the hooks for the
realtek bluetooth serial devices, as needed to refer to the interface
in the device tree.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 .../bindings/net/realtek-bluetooth-serial.txt | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt

diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
new file mode 100644
index 000000000000..0aabca1fc002
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek-bluetooth-serial.txt
@@ -0,0 +1,28 @@
+Realtek bluetooth devices connected via a UART
+
+- compatible: should be "realtek,<name>-bluetooth"
+  except for "realtek,trl8761atv" - which only has a serial bluetooth connection
+       "realtek,rtl8723as-bluetooth"
+       "realtek,rtl8723bs-bluetooth"
+       "realtek,rtl8723ds-bluetooth"
+       "realtek,rtl8761atv"
+       "realtek,rtl8821as-bluetooth"
+       "realtek,rtl8821cs-bluetooth"
+       "realtek,rtl8822bs-bluetooth"
+- These device are bluetooth devices, that connect via a uart
+- all devices (except for rtl8761atv) are also wifi devices, this is connected
+  seperatly via sdio - and is not covered by this compatible node
+- ideally these will be referenced in a device tree serial node via serdev
+ http://events17.linuxfoundation.org/sites/events/files/slides/serdev-elce-2017-2.pdf
+
+Example:
+
+&uart0 {
+	status = "okay";
+       	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>;
+       	bluetooth {
+               	  compatible = "realtek,rtl8723bs-bluetooth";
+       	};
+};
+
+this ensures that the bluetooth device is tied to the correct uart
-- 
beagleboard@davidjohnsummers.uk
