From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v3] of: document /sys/firmware/fdt
Date: Wed, 28 Jun 2017 15:21:46 -0700
Message-ID: <1498688506-5924-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Add ABI documentation for /sys/firmware/fdt

Update contact email for /sys/firmware/devicetree/* and add mail list

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---

changes from v2:
  - ignore v2, v3 is based on v1

changes from v1:
  - updated Grant's email address
  - updated Frank's email address

 Documentation/ABI/testing/sysfs-firmware-ofw | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-ofw b/Documentation/ABI/testing/sysfs-firmware-ofw
index f562b188e71d..edcab3ccfcc0 100644
--- a/Documentation/ABI/testing/sysfs-firmware-ofw
+++ b/Documentation/ABI/testing/sysfs-firmware-ofw
@@ -1,6 +1,6 @@
 What:		/sys/firmware/devicetree/*
 Date:		November 2013
-Contact:	Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+Contact:	Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 Description:
 		When using OpenFirmware or a Flattened Device Tree to enumerate
 		hardware, the device tree structure will be exposed in this
@@ -26,3 +26,27 @@ Description:
 		name plus address). Properties are represented as files
 		in the directory. The contents of each file is the exact
 		binary data from the device tree.
+
+What:		/sys/firmware/fdt
+Date:		February 2015
+KernelVersion:	3.19
+Contact:	Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+Description:
+		Exports the FDT blob that was passed to the kernel by
+		the bootloader. This allows userland applications such
+		as kexec to access the raw binary. This blob is also
+		useful when debugging since it contains any changes
+		made to the blob by the bootloader.
+
+		The fact that this node does not reside under
+		/sys/firmware/device-tree is deliberate: FDT is also used
+		on arm64 UEFI/ACPI systems to communicate just the UEFI
+		and ACPI entry points, but the FDT is never unflattened
+		and used to configure the system.
+
+		A CRC32 checksum is calculated over the entire FDT
+		blob, and verified at late_initcall time. The sysfs
+		entry is instantiated only if the checksum is valid,
+		i.e., if the FDT blob has not been modified in the mean
+		time. Otherwise, a warning is printed.
+Users:		kexec, debugging
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
