From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 3/4 v2] of/overlay: documentation for sysfs ABI
Date: Tue, 20 Dec 2016 20:04:54 +0100
Message-ID: <20161220190455.25115-4-xypron.glpk@gmx.de>
References: <20161220190455.25115-1-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220190455.25115-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

The sysfs filesystem ABI to load and unload device tree
overlays is decribed.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---

v2:
	Change sysfs path to
	/sys/firmware/devicetree/overlays

 .../ABI/testing/sysfs-firmware-devicetree-overlays | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-devicetree-overlays

diff --git a/Documentation/ABI/testing/sysfs-firmware-devicetree-overlays b/Documentation/ABI/testing/sysfs-firmware-devicetree-overlays
new file mode 100644
index 0000000..bda0001
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-firmware-devicetree-overlays
@@ -0,0 +1,24 @@
+What:		/sys/firmware/devicetree/overlays
+Date:		Dec 2016
+KernelVersion:	4.11
+Contact:	Heinrich Schuchardt <xypron.glpk@gmx.de>
+Description:	Devicetree overlays can be used to update the devicetree
+		while the system is running. For details see
+		Documentation/devicetree/overlay-notes.txt.
+
+		The following attributes are provided:
+
+		load:	This is a write only file.
+			A string written to it is interpreted as the path to a
+			flattened device tree overlay file. It is used to create
+			and apply the contained overlays.
+
+		loaded: This is a read only file.
+			It provides the count of loaded overlays as a decimal
+			number.
+
+		unload: This is a write only file.
+		        If a positive number n is wrtten to this file the n
+			most recent overlays are destroyed.
+			If a negative number is written to this file all
+			overlays are destroyed.
-- 
2.10.2
