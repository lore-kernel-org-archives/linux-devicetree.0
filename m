From: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [RFC v7 2/5] dt-bindings: pstore-block: new support for blkoops
Date: Wed, 23 Jan 2019 20:05:13 +0800
Message-ID: <1548245116-6360-3-git-send-email-liaoweixiong@allwinnertech.com>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, liaoweixiong <liaoweixiong@allwinnertech.com>
List-Id: devicetree@vger.kernel.org

Create DT binding document for blkoops.

Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
---
 .../devicetree/bindings/pstore-block/blkoops.txt   | 32 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pstore-block/blkoops.txt

diff --git a/Documentation/devicetree/bindings/pstore-block/blkoops.txt b/Documentation/devicetree/bindings/pstore-block/blkoops.txt
new file mode 100644
index 0000000..a25835b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pstore-block/blkoops.txt
@@ -0,0 +1,32 @@
+Blkoops oops logger
+===================
+
+Blkoops provides a block partition for oops, excluding panics now, so they can
+be recovered after a reboot.
+
+Any space of block partition will be used for a circular buffer of oops records.
+These records have a configurable size, with a size of 0 indicating that they
+should be disabled.
+
+"partition-size" and at least one of "dmesg-size" or "pmsg-size" must be set
+non-zero, but are otherwise optional as listed below.
+
+Blkoops will take value from Kconfig if device tree do not set, but settings
+from module parameters can also overwrite them.
+
+Required properties:
+
+- compatible: must be "blkoops".
+
+- partition-size: size in kbytes, must be a multiple of 4.
+
+Optional properties:
+
+- partition-path: strings must begin with "/dev", tell blkoops which partition
+  it can used. If it is not set, blkoops will drop all data when reboot.
+
+- dmesg-size: maximum size in kbytes of each dump done on oops, which must be a
+  multiple of 4.
+
+- pmsg-size: maximum size in kbytes for userspace messages, which must be a
+  multiple of 4.
diff --git a/MAINTAINERS b/MAINTAINERS
index 0abecc5..91c70df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12055,6 +12055,7 @@ F:	drivers/firmware/efi/efi-pstore.c
 F:	drivers/acpi/apei/erst.c
 F:	Documentation/admin-guide/ramoops.rst
 F:	Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+F:	Documentation/devicetree/bindings/pstore-block/
 K:	\b(pstore|ramoops)
 
 PTP HARDWARE CLOCK SUPPORT
-- 
1.9.1
