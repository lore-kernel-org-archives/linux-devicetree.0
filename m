From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 2/2] eeprom: Add IDT 89HPESx driver bindings file
Date: Fri, 13 Jan 2017 15:16:53 +0300
Message-ID: <1484309813-25008-3-git-send-email-fancer.lancer@gmail.com>
References: <1481638971-6247-1-git-send-email-fancer.lancer@gmail.com>
 <1484309813-25008-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484309813-25008-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Sergey.Semin@t-platforms.ru, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

IDT 89HPESx PCIe-switches exposes SMBus interface to have an access to
the device CSRs and EEPROM. So to properly utilize the interface
functionality, developer should declare a valid dts-file node, which
would refer to the corresponding 89HPESx device.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 .../devicetree/bindings/misc/idt_89hpesx.txt       | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt

diff --git a/Documentation/devicetree/bindings/misc/idt_89hpesx.txt b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
new file mode 100644
index 0000000..b9093b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
@@ -0,0 +1,44 @@
+EEPROM / CSR SMBus-slave interface of IDT 89HPESx devices
+
+Required properties:
+  - compatible : should be "<manufacturer>,<type>"
+		 Basically there is only one manufacturer: idt, but some
+		 compatible devices may be produced in future. Following devices
+		 are supported: 89hpes8nt2, 89hpes12nt3, 89hpes24nt6ag2,
+		 89hpes32nt8ag2, 89hpes32nt8bg2, 89hpes12nt12g2, 89hpes16nt16g2,
+		 89hpes24nt24g2, 89hpes32nt24ag2, 89hpes32nt24bg2;
+		 89hpes12n3, 89hpes12n3a, 89hpes24n3, 89hpes24n3a;
+		 89hpes32h8, 89hpes32h8g2, 89hpes48h12, 89hpes48h12g2,
+		 89hpes48h12ag2, 89hpes16h16, 89hpes22h16, 89hpes22h16g2,
+		 89hpes34h16, 89hpes34h16g2, 89hpes64h16, 89hpes64h16g2,
+		 89hpes64h16ag2;
+		 89hpes12t3g2, 89hpes24t3g2, 89hpes16t4, 89hpes4t4g2,
+		 89hpes10t4g2, 89hpes16t4g2, 89hpes16t4ag2, 89hpes5t5,
+		 89hpes6t5, 89hpes8t5, 89hpes8t5a, 89hpes24t6, 89hpes6t6g2,
+		 89hpes24t6g2, 89hpes16t7, 89hpes32t8, 89hpes32t8g2,
+		 89hpes48t12, 89hpes48t12g2.
+  - reg :	 I2C address of the IDT 89HPESx device.
+
+Optionally there can be EEPROM-compatible subnode:
+  - compatible:  There are five EEPROM devices supported: 24c32, 24c64, 24c128,
+		 24c256 and 24c512 differed by size.
+  - reg:         Custom address of EEPROM device (If not specified IDT 89HPESx
+    (optional)	 device will try to communicate with EEPROM sited by default
+		 address - 0x50)
+  - read-only :	 Parameterless property disables writes to the EEPROM
+    (optional)
+
+Example:
+	idt@60 {
+		compatible = "idt,89hpes32nt8ag2";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eeprom@50 {
+			compatible = "onsemi,24c64";
+			reg = <0x50>;
+			read-only;
+		};
+	};
+
-- 
2.6.6
