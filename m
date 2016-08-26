From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 16/19] dt-bindings: img-ascii-lcd: Document a binding for simple ASCII LCDs
Date: Fri, 26 Aug 2016 15:17:48 +0100
Message-ID: <20160826141751.13121-17-paul.burton@imgtec.com>
References: <20160826141751.13121-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160826141751.13121-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Add documentation for a devicetree binding for the simple ASCII LCD
displays found on development boards such as the MIPS Boston, MIPS Malta
& MIPS SEAD3 from Imagination Technologies.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>

---

Changes in v2:
- Fix filename & path in MAINTAINERS

 .../devicetree/bindings/auxdisplay/img-ascii-lcd.txt    | 17 +++++++++++++++++
 MAINTAINERS                                             |  5 +++++
 2 files changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt

diff --git a/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt b/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
new file mode 100644
index 0000000..b69bb68
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
@@ -0,0 +1,17 @@
+Binding for ASCII LCD displays on Imagination Technologies boards
+
+Required properties:
+- compatible : should be one of:
+    "img,boston-lcd"
+    "mti,malta-lcd"
+    "mti,sead3-lcd"
+
+Required properties for "img,boston-lcd":
+- reg : memory region locating the device registers
+
+Required properties for "mti,malta-lcd" or "mti,sead3-lcd":
+- regmap: phandle of the system controller containing the LCD registers
+- offset: offset in bytes to the LCD registers within the system controller
+
+The layout of the registers & properties of the display are determined
+from the compatible string, making this binding somewhat trivial.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0bbe4b1..f7a68b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5953,6 +5953,11 @@ M:	Stanislaw Gruszka <stf_xl@wp.pl>
 S:	Maintained
 F:	drivers/usb/atm/ueagle-atm.c
 
+IMGTEC ASCII LCD DRIVER
+M:	Paul Burton <paul.burton@imgtec.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
+
 INA209 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
-- 
2.9.3
