From: Chris Bostic <christopher.lee.bostic@gmail.com>
Subject: [PATCH 15/16] drivers/fsi: Add documentation for GPIO bindings
Date: Tue,  6 Dec 2016 18:14:36 -0600
Message-ID: <1481069677-53660-16-git-send-email-christopher.lee.bostic@gmail.com>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, sre@kernel.org, mturquette@baylibre.com, geert+renesas@glider.be, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chris Bostic <cbostic@us.ibm.com>, joel@jms.id.au, jk@ozlabs.org, linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au, benh@kernel.crashing.org
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic@us.ibm.com>

Add fsi master gpio device tree binding documentation

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
new file mode 100644
index 0000000..ff3a62e
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for gpio-based FSI master driver
+-----------------------------------------------------
+
+Required properties:
+	- compatible = "ibm,fsi-master-gpio";
+	- clk-gpios;
+	- data-gpios;
+
+Optional properties:
+	- enable-gpios;
+	- trans-gpios;
+	- mux-gpios;
+
+fsi-master {
+	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+	clk-gpios = <&gpio 0 &gpio 6>;
+	data-gpios = <&gpio 1 &gpio 7>;
+	enable-gpios = <&gpio 2 &gpio 8>;	/* Enable FSI data in/out */
+	trans-gpios = <&gpio 3 &gpio 9>;	/* Volts translator direction */
+	mux-gpios = <&gpio 4> &gpio 10>;	/* Multiplexer for FSI pins */
+}
-- 
1.8.2.2
