From: Thierry Escande <thierry.escande@collabora.com>
Subject: [PATCH 4/5] firmware: Add coreboot device tree binding documentation
Date: Thu, 23 Mar 2017 22:04:28 +0100
Message-ID: <1490303069-13230-5-git-send-email-thierry.escande@collabora.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset = "utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
Content-Transfert-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

From: Julius Werner <jwerner@chromium.org>

This patch adds documentation describing a device tree binding for the
coreboot firmware. It is meant to be dynamically added during boot and
contains address definitions for the coreboot table (a list of
variable-sized descriptors providing information about various compile-
and run-time generated firmware parameters) and the CBMEM area (the
structure containing most run-time resident memory regions set up by
coreboot).

These definitions allow kernel drivers to easily access data contained
in and pointed to by these regions (such as coreboot's in-memory log).
(An example implementation can be seen in the following patch)

Signed-off-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Thierry Escande <thierry.escande@collabora.com>
---
 .../devicetree/bindings/firmware/coreboot.txt      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt

diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
new file mode 100644
index 0000000..4c95570
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
@@ -0,0 +1,33 @@
+COREBOOT firmware information
+
+The device tree node to communicate the location of coreboot's memory-resident
+bookkeeping structures to the kernel. Since coreboot itself cannot boot a
+device-tree-based kernel (yet), this node needs to be inserted by a
+second-stage bootloader (a coreboot "payload").
+
+Required properties:
+ - compatible: Should be "coreboot"
+ - reg: Address and length of the following two memory regions, in order:
+	1.) The coreboot table. This is a list of variable-sized descriptors
+	that contain various compile- and run-time generated firmware
+	parameters. It is identified by the magic string "LBIO" in its first
+	four bytes.
+	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
+	details.
+	2.) The CBMEM area. This is a downward-growing memory region used by
+	coreboot to dynamically allocate data structures that remain resident.
+	It may or may not include the coreboot table as one of its members. It
+	is identified by a root node descriptor with the magic number
+	0xc0389481 that resides in the topmost 8 bytes of the area.
+	See coreboot's src/include/imd.h for details.
+
+Example:
+	firmware {
+		ranges;
+
+		coreboot {
+			compatible = "coreboot";
+			reg = <0xfdfea000 0x264>,
+			      <0xfdfea000 0x16000>;
+		}
+	};
-- 
2.7.4
