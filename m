From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:23 +0200
Message-ID: <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: bbrezillon@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Tomasz Figa <tomasz.figa@gmail.com>

This patch adds dt-bindings for Samsung OneNAND driver.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 .../bindings/mtd/samsung-onenand.txt          | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/samsung-onenand.txt

diff --git a/Documentation/devicetree/bindings/mtd/samsung-onenand.txt b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
new file mode 100644
index 000000000000..341d97cc1513
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/samsung-onenand.txt
@@ -0,0 +1,46 @@
+Device tree bindings for Samsung SoC OneNAND controller
+
+Required properties:
+ - compatible : value should be either of the following.
+   (a) "samsung,s3c6400-onenand" - for onenand controller compatible with
+       S3C6400 SoC,
+   (b) "samsung,s3c6410-onenand" - for onenand controller compatible with
+       S3C6410 SoC,
+   (c) "samsung,s5pc100-onenand" - for onenand controller compatible with
+       S5PC100 SoC,
+   (d) "samsung,s5pv210-onenand" - for onenand controller compatible with
+       S5PC110/S5PV210 SoCs.
+
+ - reg : two memory mapped register regions:
+   - first entry: control registers.
+   - second and next entries: memory windows of particular OneNAND chips;
+     for variants a), b) and c) only one is allowed, in case of d) up to
+     two chips can be supported.
+
+ - interrupt-parent : phandle of interrupt controller to which the OneNAND
+   controller is wired,
+ - interrupts : specifier of interrupt signal to which the OneNAND controller
+   is wired; should contain just one entry.
+ - clock-names : should contain two entries:
+   - "bus" - bus clock of the controller,
+   - "onenand" - clock supplied to OneNAND memory.
+ - clock: should contain list of phandles and specifiers for all clocks listed
+   in clock-names property.
+ - #address-cells : must be 1,
+ - #size-cells : must be 1.
+
+For partition table parsing (optional) please refer to:
+ [1] Documentation/devicetree/bindings/mtd/partition.txt
+
+Example for an s5pv210 board:
+
+	onenand@b0600000 {
+		compatible = "samsung,s5pv210-onenand";
+		reg = <0xb0600000 0x2000>, <0xb0000000 0x20000>;
+		interrupt-parent = <&vic1>;
+		interrupts = <31>;
+		clock-names = "bus", "onenand";
+		clocks = <&clocks NANDXL>, <&clocks DOUT_FLASH>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
-- 
2.20.1
