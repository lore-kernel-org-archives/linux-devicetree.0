From: <kamlakant.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] Documentation: Add Netlogic XLP GPIO devicetree bindings documentation
Date: Tue, 28 Apr 2015 20:10:44 +0530
Message-ID: <1430232045-5114-2-git-send-email-kamlakant.patel@broadcom.com>
References: <1430232045-5114-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430232045-5114-1-git-send-email-kamlakant.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kamlakant Patel <kamlakant.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Provide documentation for Netlogic XLP SoCs GPIO controller DTS bindings.

Signed-off-by: Kamlakant Patel <kamlakant.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/gpio/gpio-xlp.txt          |   47 ++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-xlp.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-xlp.txt b/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
new file mode 100644
index 0000000..262ee4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-xlp.txt
@@ -0,0 +1,47 @@
+Netlogic XLP Family GPIO
+========================
+
+This GPIO driver is used for following Netlogic XLP SoCs:
+	XLP832, XLP316, XLP208, XLP980, XLP532
+
+Required properties:
+-------------------
+
+- compatible: Should be one of the following:
+  - "netlogic,xlp832-gpio": For Netlogic XLP832
+  - "netlogic,xlp316-gpio": For Netlogic XLP316
+  - "netlogic,xlp208-gpio": For Netlogic XLP208
+  - "netlogic,xlp980-gpio": For Netlogic XLP980
+  - "netlogic,xlp532-gpio": For Netlogic XLP532
+- reg: Physical base address and length of the controller's registers.
+- #gpio-cells: Should be two. The first cell is the pin number and the second
+  cell is used to specify optional parameters (currently unused).
+- gpio-controller: Marks the device node as a GPIO controller.
+- nr-gpios: Number of GPIO pins supported by the controller.
+- interrupt-cells: Should be two. The first cell is the GPIO Number. The
+  second cell is used to specify flags. The following subset of flags is
+  supported:
+  - trigger type:
+	1 = low to high edge triggered.
+	2 = high to low edge triggered.
+	4 = active high level-sensitive.
+	8 = active low level-sensitive.
+- interrupts: Interrupt number for this device.
+- interrupt-parent: phandle of the parent interrupt controller.
+- interrupt-controller: Identifies the node as an interrupt controller.
+
+Example:
+
+	gpio: xlp_gpio@34000 {
+		compatible = "netlogic,xlp316-gpio";
+		reg = <0 0x34100 0x1000
+		       0 0x35100 0x1000>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		nr-gpios = <57>;
+
+		#interrupt-cells = <2>;
+		interrupt-parent = <&pic>;
+		interrupts = <39>;
+		interrupt-controller;
+	};
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
