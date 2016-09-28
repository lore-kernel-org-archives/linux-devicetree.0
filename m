From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH v19 04/12] add sysfs document for fpga bridge class
Date: Wed, 28 Sep 2016 13:21:52 -0500
Message-ID: <20160928182200.15800-5-atull@opensource.altera.com>
References: <20160928182200.15800-1-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160928182200.15800-1-atull@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, delicious.quinoa@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alan Tull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Cartwright <joshc@ni.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Cyril Chemparathy <cyril.chemparathy@xilinx.com>, devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, Jon Masters <jcm@redhat.com>, Matthew Gerlach <mgerlach@opensource.altera.com>, Frank Rowand <frowand.list@gmail.com>, Walter Goossens <waltergoossens@home.nl>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add documentation for new FPGA bridge class's sysfs interface.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
--
v15: Document added in v15 of patch set
v16: No change to this patch in v16 of patch set
v17: No change to this patch in v17 of patch set
v18: No change to this patch in v18 of patch set
v19: No change to this patch in this version of patch set
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
2.9.3
