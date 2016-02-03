From: Paul Burton <paul.burton@imgtec.com>
Subject: [PATCH v2 01/15] dt-bindings: ascii-lcd: Document a binding for simple ASCII LCDs
Date: Wed, 3 Feb 2016 11:30:31 +0000
Message-ID: <1454499045-5020-2-git-send-email-paul.burton@imgtec.com>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>, Joe Perches <joe@perches.com>, Kalle Valo <kvalo@codeaurora.org>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add documentation for a devicetree binding for simple memory-mapped
ASCII LCD displays, such as those found on the Imagination Technologies
Boston & Malta development boards.

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/ascii-lcd.txt | 10 ++++++++++
 MAINTAINERS                                     |  5 +++++
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ascii-lcd.txt

diff --git a/Documentation/devicetree/bindings/ascii-lcd.txt b/Documentation/devicetree/bindings/ascii-lcd.txt
new file mode 100644
index 0000000..40ae536
--- /dev/null
+++ b/Documentation/devicetree/bindings/ascii-lcd.txt
@@ -0,0 +1,10 @@
+Binding for simple memory-mapped ASCII LCD displays
+
+Required properties:
+- compatible : should be one of:
+    "img,boston-lcd"
+    "mti,malta-lcd"
+- reg : memory region locating the device registers
+
+The layout of the registers & properties of the display are determined
+from the compatible string, making this binding somewhat trivial.
diff --git a/MAINTAINERS b/MAINTAINERS
index 30aca4a..cd19e5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1819,6 +1819,11 @@ S:	Maintained
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
2.7.0
