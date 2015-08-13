From: <atull@opensource.altera.com>
Subject: [PATCH v10 7/8] staging: simple-fpga-bus: add TODO document
Date: Thu, 13 Aug 2015 12:37:31 -0500
Message-ID: <1439487452-23977-9-git-send-email-atull@opensource.altera.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Alan Tull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add a TODO document for the simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v10: This patch added in v10 of the patch set
---
 drivers/staging/simple-fpga-bus/TODO |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 drivers/staging/simple-fpga-bus/TODO

diff --git a/drivers/staging/simple-fpga-bus/TODO b/drivers/staging/simple-fpga-bus/TODO
new file mode 100644
index 0000000..c218a57
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/TODO
@@ -0,0 +1,13 @@
+TODO:
+
+This simple-fpga-bus design avoids adding a new FPGA bridge framework as
+another dependency.  FPGA bridges are seen as phandles to resets.  I'd like
+to see if this will work for people.
+
+	- Waiting on configfs interface for DT Overlays
+	- Are the simple-fpga-bus bindings acceptable?
+	- Children don't get populated if FPGA manager is a module. Not a
+	  problem if FPGA manager is built in.
+
+Patches to:
+	Alan Tull <atull@opensource.altera.com>
-- 
1.7.9.5
