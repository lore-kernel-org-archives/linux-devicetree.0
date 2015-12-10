From: <atull@opensource.altera.com>
Subject: [PATCH v14 3/7] add sysfs document for fpga bridge class
Date: Thu, 10 Dec 2015 17:37:05 -0600
Message-ID: <1449790629-5517-4-git-send-email-atull@opensource.altera.com>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add documentation for new FPGA bridge class's sysfs interface.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 Documentation/ABI/testing/sysfs-class-fpga-bridge |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge

diff --git a/Documentation/ABI/testing/sysfs-class-fpga-bridge b/Documentation/ABI/testing/sysfs-class-fpga-bridge
new file mode 100644
index 0000000..e45d952
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-fpga-bridge
@@ -0,0 +1,11 @@
+What:		/sys/class/fpga_bridge/<bridge>/name
+Date:		December 2015
+KernelVersion:	4.4
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Name of low level FPGA bridge driver.
+
+What:		/sys/class/fpga_bridge/<bridge>/state
+Date:		December 2015
+KernelVersion:	4.4
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Show bridge state as "enabled" or "disabled"
-- 
1.7.9.5
