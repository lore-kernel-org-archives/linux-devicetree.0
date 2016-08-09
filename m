From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH 17/20] dt-bindings: img-ascii-lcd: Document a binding for simple ASCII LCDs
Date: Tue, 9 Aug 2016 13:35:42 +0100
Message-ID: <20160809123546.10190-18-paul.burton@imgtec.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160809123546.10190-1-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Add documentation for a devicetree binding for the simple ASCII LCD
displays found on development boards such as the MIPS Boston, MIPS Malta
& MIPS SEAD3 from Imagination Technologies.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

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
index 20bb1d0..d08cf6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1971,6 +1971,11 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621
 F:	drivers/hwmon/asc7621.c
 
+ASCII LCD DRIVER
+M:	Paul Burton <paul.burton@imgtec.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/ascii-lcd.txt
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 L:	acpi4asus-user@lists.sourceforge.net
-- 
2.9.2
