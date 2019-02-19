From: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [RFC v9 2/5] dt-bindings: pstore-block: new support for blkoops
Date: Tue, 19 Feb 2019 19:52:47 +0800
Message-ID: <1550577170-18761-3-git-send-email-liaoweixiong@allwinnertech.com>
References: <1550577170-18761-1-git-send-email-liaoweixiong@allwinnertech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550577170-18761-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, liaoweixiong <liaoweixiong@allwinnertech.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Create DT binding document for blkoops.

Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
---
 .../devicetree/bindings/pstore/blkoops.txt         | 53 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pstore/blkoops.txt

diff --git a/Documentation/devicetree/bindings/pstore/blkoops.txt b/Documentation/devicetree/bindings/pstore/blkoops.txt
new file mode 100644
index 0000000..5462915
--- /dev/null
+++ b/Documentation/devicetree/bindings/pstore/blkoops.txt
@@ -0,0 +1,53 @@
+Blkoops oops logger
+===================
+
+Blkoops provides a block partition for oops, excluding panics now, so they can
+be recovered after a reboot.
+
+Any space of block device will be used for a circular buffer of oops records.
+These records have a configurable size, with a size of 0 indicating that they
+should be disabled.
+
+At least one of "block-device" and "total_size" must be set.
+
+At least one of "dmesg-size" or "pmsg-size" must be set non-zero.
+
+Required properties:
+
+- compatible: must be "blkoops".
+
+Optional properties:
+
+- block-device: The block device to use. Most of the time, it is a partition of
+		device. If block-device is NULL, no block device is effective
+		and the data will be lost after rebooting.
+		It accept the following variants:
+		1) <hex_major><hex_minor> device number in hexadecimal
+		   represents itself no leading 0x, for example b302.
+		2) /dev/<disk_name> represents the device number of disk
+		3) /dev/<disk_name><decimal> represents the device number of
+		   partition - device number of disk plus the partition number
+		4) /dev/<disk_name>p<decimal> - same as the above, that form is
+		   used when disk name of partitioned disk ends on a digit.
+		5) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing
+		   the unique id of a partition if the partition table provides
+		   it. The UUID may be either an EFI/GPT UUID, or refer to an
+		   MSDOS partition using the format SSSSSSSS-PP, where SSSSSSSS
+		   is a zero-filled hex representation of the 32-bit
+		   "NT disk signature", and PP is a zero-filled hex
+		   representation of the 1-based partition number.
+		6) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in
+		   relation to a partition with a known unique id.
+		7) <major>:<minor> major and minor number of the device
+		   separated by a colon.
+
+- total-size: The total size in kbytes pstore/blk can use. It must be a multiple
+	      of 4. It must be less than or equal to size of block-device. If
+	      total-size is zero with block-devce valid, it will be set to equal
+	      to size of block-device.
+
+- dmesg-size: maximum size in kbytes of each dump done on oops, which must be a
+	      multiple of 4.
+
+- pmsg-size: maximum size in kbytes for userspace messages, which must be a
+	     multiple of 4.
diff --git a/MAINTAINERS b/MAINTAINERS
index 51029a4..f49dd37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12318,6 +12318,7 @@ F:	drivers/firmware/efi/efi-pstore.c
 F:	drivers/acpi/apei/erst.c
 F:	Documentation/admin-guide/ramoops.rst
 F:	Documentation/devicetree/bindings/reserved-memory/ramoops.txt
+F:	Documentation/devicetree/bindings/pstore-block/
 K:	\b(pstore|ramoops)
 
 PTP HARDWARE CLOCK SUPPORT
-- 
1.9.1
