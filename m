From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH v19 06/12] fpga: add fpga image information struct for socfpga
 support
Date: Wed, 28 Sep 2016 13:21:54 -0500
Message-ID: <20160928182200.15800-7-atull@opensource.altera.com>
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

Minor changes to the Altera SoCFPGA FPGA Manager support driver
due to FPGA Manager framework API changes for the new fpga
image information struct.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v19: Added in v19 of this patchset
---
 drivers/fpga/socfpga.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/fpga/socfpga.c b/drivers/fpga/socfpga.c
index 27d2ff2..b6672e6 100644
--- a/drivers/fpga/socfpga.c
+++ b/drivers/fpga/socfpga.c
@@ -407,13 +407,14 @@ static int socfpga_fpga_reset(struct fpga_manager *mgr)
 /*
  * Prepare the FPGA to receive the configuration data.
  */
-static int socfpga_fpga_ops_configure_init(struct fpga_manager *mgr, u32 flags,
+static int socfpga_fpga_ops_configure_init(struct fpga_manager *mgr,
+					   struct fpga_image_info *info,
 					   const char *buf, size_t count)
 {
 	struct socfpga_fpga_priv *priv = mgr->priv;
 	int ret;
 
-	if (flags & FPGA_MGR_PARTIAL_RECONFIG) {
+	if (info->flags & FPGA_MGR_PARTIAL_RECONFIG) {
 		dev_err(&mgr->dev, "Partial reconfiguration not supported.\n");
 		return -EINVAL;
 	}
@@ -478,7 +479,7 @@ static int socfpga_fpga_ops_configure_write(struct fpga_manager *mgr,
 }
 
 static int socfpga_fpga_ops_configure_complete(struct fpga_manager *mgr,
-					       u32 flags)
+					       struct fpga_image_info *info)
 {
 	struct socfpga_fpga_priv *priv = mgr->priv;
 	u32 status;
-- 
2.9.3
