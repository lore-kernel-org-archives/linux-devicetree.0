From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] eeprom: Add IDT 89HPESx driver bindings file
Date: Tue, 29 Nov 2016 01:38:21 +0300
Message-ID: <1480372701-30560-3-git-send-email-fancer.lancer@gmail.com>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
 <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480372701-30560-1-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

See cover-letter for changelog

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
 .../devicetree/bindings/misc/idt_89hpesx.txt       | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt

diff --git a/Documentation/devicetree/bindings/misc/idt_89hpesx.txt b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
index 0000000..469cc93
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/idt_89hpesx.txt
@@ -0,0 +1,41 @@
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
+		 Current implementation of the driver doesn't have any device-
+		 specific functionalities. But since each of them differs
+		 by registers mapping, CSRs read/write restrictions can be
+		 added in future.
+  - reg :	 I2C address of the IDT 89HPES device.
+
+Optional properties:
+  - read-only :	 Parameterless property disables writes to the EEPROM
+  - idt,eesize : Size of EEPROM device connected to IDT 89HPES i2c-master bus
+		 (default value is 4096 bytes if option isn't specified)
+  - idt,eeaddr : Custom address of EEPROM device
+		 (If not specified IDT 89HPESx device will try to communicate
+		  with EEPROM sited by default address - 0x50)
+
+Example:
+	idt_pcie_sw@60 {
+		compatible = "idt,89hpes12nt3";
+		reg = <0x60>;
+		read-only;
+		idt,eesize = <65536>;
+		idt,eeaddr = <0x50>;
+	};
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
