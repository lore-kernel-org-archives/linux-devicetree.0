From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 13/34] usb: dwc3: omap: fix dwc3 binding match table
Date: Thu, 24 Nov 2011 13:02:15 +0200
Message-ID: <1322132556-16805-14-git-send-email-balbi__486.750275786285$1322135076$gmane$org@ti.com>
References: <1322132556-16805-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Resent-Message-ID: <20111124113834.GJ3352-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Resent-To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
In-Reply-To: <1322132556-16805-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

Trivial patch, no functional changes.

[ balbi-l0cyMroinI0@public.gmane.org : fixed up Documentation based on what
	we actually want to achieve ]

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |   66 ++++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-omap.c                   |   11 +++--
 2 files changed, 73 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
new file mode 100644
index 0000000..c936863
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -0,0 +1,66 @@
+Synopsys DesignWareCores SuperSpeed USB 3.0 Controller
+
+The device node for a USB3 Wrapper that is part of an OMAP5 SoC is as described
+in the document "Open Firmware Recommended Practice: Universal Serial Bus" with
+the following modifications and additions:
+
+Required properties:
+	- compatible : should be "ti,omap5-dwc3" or "ti,omap5430-dwc3".
+	- reg : the first address and length contains the address of DRD. The
+		second address and length contains the address of the wrapper.
+	- interrupts : < a b > where 'a' is the interrupt number and 'b' is a
+		field that represents an encoding of the sense and level
+		information for the interrupt line.
+	- child device : The child Synopsys DesignWareCore USB 3.0 DRD Controller
+
+Optional properties:
+	- utmi_mode : UTMI mode of the wrapper Interrupts (SW or HW). Refer to
+		OMAP5 TRM for more details (for TI wrapper only)
+
+Example of hardware mode OMAP5:
+
+	usb@4a020000 {
+		#address-cells = < 1 >;
+		#size-cells = < 1 >;
+		compatible = "ti,omap5430-dwc3", "ti,omap5-dwc3";
+		interrupt-parent = < &intc >;
+		interrupts = < 93 4 >;
+		reg = < 0x4a020000 0x10000 >;
+		utmi_mode = "hardware";
+		range;
+
+		usb@4a030000 {
+			#address-cells = < 3 >;
+			#size-cells = < 3 >;
+			compatible = "synopsys,dwc3";
+			interrupt-parent = < &intc >;
+			interupts = < 92 4 >;
+			reg = <	0x4a030000 0x8000       // First address is xHCI
+				0x4a03c100 0x600        // Second is Global
+				0x4a03c700 0x500 >;     // Third is Device
+		};
+	};
+
+Example of software mode OMAP5:
+
+	usb@4a020000 {
+		#address-cells = < 1 >;
+		#size-cells = < 1 >;
+		compatible = "ti,omap5430-dwc3", "ti,omap5-dwc3";
+		interrupt-parent = < &intc >;
+		interrupts = < 93 4 >;
+		reg = < 0x4a020000 0x10000 ;
+		utmi_mode = "software";
+		range;
+
+		usb@4a030000 {
+			#address-cells = < 3 >;
+			#size-cells = < 3 >;
+			compatible = "synopsys,dwc3";
+			interrupt-parent = < &intc >;
+			interupts = < 92 4 >;
+			reg = <	0x4a030000 0x8000       // First address is xHCI
+				0x4a03c100 0x600        // Second is Global
+				0x4a03c700 0x500 >;     // Third is Device
+		};
+	};
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 7bcf677..c9f3e61 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -367,20 +367,23 @@ static int __devexit dwc3_omap_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id of_dwc3_matach[] = {
+static const struct of_device_id of_dwc3_match[] = {
 	{
-		"ti,dwc3",
+		"ti,omap5430-dwc3"
+	},
+	{
+		"ti,omap5-dwc3"
 	},
 	{ },
 };
-MODULE_DEVICE_TABLE(of, of_dwc3_matach);
+MODULE_DEVICE_TABLE(of, of_dwc3_match);
 
 static struct platform_driver dwc3_omap_driver = {
 	.probe		= dwc3_omap_probe,
 	.remove		= __devexit_p(dwc3_omap_remove),
 	.driver		= {
 		.name	= "omap-dwc3",
-		.of_match_table	= of_dwc3_matach,
+		.of_match_table	= of_dwc3_match,
 	},
 };
 
-- 
1.7.8.rc3
