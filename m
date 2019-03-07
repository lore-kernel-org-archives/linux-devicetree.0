From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 armsoc/drivers/bus+gpio 2/5] dt-bindings: bus: Document moxtet bus binding
Date: Thu,  7 Mar 2019 13:52:48 +0100
Message-ID: <20190307125251.724-3-marek.behun@nic.cz>
References: <20190307125251.724-1-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307125251.724-1-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds device tree binding documentation for the Moxtet bus, a bus
via which the different modules connected to the Turris Mox router can
be configured.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/bus/moxtet.txt        | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/moxtet.txt

diff --git a/Documentation/devicetree/bindings/bus/moxtet.txt b/Documentation/devicetree/bindings/bus/moxtet.txt
new file mode 100644
index 000000000000..7be9d00c1767
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/moxtet.txt
@@ -0,0 +1,44 @@
+Turris Mox module status and configuration bus (over SPI)
+
+Required properties:
+ - compatible		: Should be "cznic,moxtet"
+ - #address-cells	: Has to be 1
+ - #size-cells		: Has to be 0
+ - spi-cpol		: Required inverted clock polarity
+ - spi-cpha		: Required shifted clock phase
+ - interrupts		: Must contain reference to the shared interrupt line
+ - interrupt-controller	: Required
+ - #interrupt-cells	: Has to be 1
+
+For other required and optional properties of SPI slave nodes please refer to
+../spi/spi-bus.txt.
+
+Required properties of subnodes:
+ - reg			: Should be position on the Moxtet bus
+
+The driver finds the devices connected to the bus by itself, but it may be
+needed to reference some of them from other parts of the device tree. In that
+case the devices can be defined as subnodes of the moxtet node.
+
+Example:
+
+	moxtet@1 {
+		compatible = "cznic,moxtet";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		spi-max-frequency = <10000000>;
+		spi-cpol;
+		spi-cpha;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&gpiosb>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+
+		moxtet_sfp: gpio@0 {
+			compatible = "cznic,moxtet-sfp";
+			gpio-controller;
+			#gpio-cells = <2>;
+			reg = <0>;
+		}
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index d96d36c83bc3..3f461a2d776a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1502,6 +1502,7 @@ ARM/CZ.NIC TURRIS MOX SUPPORT
 M:	Marek Behun <marek.behun@nic.cz>
 W:	http://mox.turris.cz
 S:	Maintained
+F:	Documentation/devicetree/bindings/bus/moxtet.txt
 F:	include/linux/moxtet.h
 F:	drivers/bus/moxtet.c
 
-- 
2.19.2
