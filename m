From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 armsoc/drivers/bus+gpio 5/5] dt-bindings: gpio: Document GPIOs via Moxtet bus
Date: Thu,  7 Mar 2019 13:52:51 +0100
Message-ID: <20190307125251.724-6-marek.behun@nic.cz>
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

This patch adds documentation of the device tree bindings for GPIOs
on the devices connected via Moxtet bus.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/gpio/gpio-moxtet.txt   | 18 ++++++++++++++++++
 MAINTAINERS                                    |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt b/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
new file mode 100644
index 000000000000..410759de9f09
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
@@ -0,0 +1,18 @@
+Turris Mox Moxtet GPIO expander via Moxtet bus
+
+Required properties:
+ - compatible		: Should be "cznic,moxtet-gpio".
+ - gpio-controller	: Marks the device node as a GPIO controller.
+ - #gpio-cells		: Should be two. For consumer use see gpio.txt.
+
+Other properties are required for a Moxtet bus device, please refer to
+Documentation/devicetree/bindings/bus/moxtet.txt.
+
+Example:
+
+	moxtet_sfp: gpio@0 {
+		compatible = "cznic,moxtet-gpio";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0>;
+	}
diff --git a/MAINTAINERS b/MAINTAINERS
index 6af384154ce5..ccb979f64431 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1505,6 +1505,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/debugfs-moxtet
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
+F:	Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
 F:	include/linux/moxtet.h
 F:	drivers/bus/moxtet.c
 F:	drivers/gpio/gpio-moxtet.c
-- 
2.19.2
