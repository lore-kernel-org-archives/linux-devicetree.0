From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH v21 3/9] add sysfs document for fpga bridge class
Date: Tue, 25 Oct 2016 09:55:34 -0500
Message-ID: <20161025145540.3722-4-atull@opensource.altera.com>
References: <20161025145540.3722-1-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20161025145540.3722-1-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <moritz.fischer@ettus.com>, Joel Holdsworth <joel@airwebreathe.org.uk>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Masters <jcm@redhat.com>, Julia Cartwright <julia@ni.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Corbet <corbet@lwn.net>, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Add documentation for new FPGA bridge class's sysfs interface.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
--
v15: Document added in v15 of patch set
v16: No change to this patch in v16 of patch set
v17: No change to this patch in v17 of patch set
v18: No change to this patch in v18 of patch set
v19: No change to this patch in this version of patch set
v20: Added Moritz' ack
v21: No change for this patch in v21 of patchset
---
 Documentation/ABI/testing/sysfs-class-fpga-bridge | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge

diff --git a/Documentation/ABI/testing/sysfs-class-fpga-bridge b/Documentation/ABI/testing/sysfs-class-fpga-bridge
new file mode 100644
index 0000000..312ae2c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-fpga-bridge
@@ -0,0 +1,11 @@
+What:		/sys/class/fpga_bridge/<bridge>/name
+Date:		January 2016
+KernelVersion:	4.5
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Name of low level FPGA bridge driver.
+
+What:		/sys/class/fpga_bridge/<bridge>/state
+Date:		January 2016
+KernelVersion:	4.5
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Show bridge state as "enabled" or "disabled"
-- 
2.10.1

