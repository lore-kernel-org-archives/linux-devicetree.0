From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v3 3/3] remoteproc/keystone: Ensure the DSPs are in reset in
 probe
Date: Tue, 13 Jun 2017 18:45:13 -0500
Message-ID: <20170613234513.7624-4-s-anna@ti.com>
References: <20170613234513.7624-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170613234513.7624-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Sam Nelson <sam.nelson@ti.com>
List-Id: devicetree@vger.kernel.org

From: "Andrew F. Davis" <afd@ti.com>

The DSPs are expected to be in reset when the driver probes a device.
If the DSPs are out of reset in probe, the system may crash when the
firmware is being loaded. So, add a check to make sure the DSP resets
are asserted, and if not, throw a eye-catchy warning and assert the
resets specifically.

Signed-off-by: Andrew F. Davis <afd@ti.com>
[s-anna@ti.com: replace warning with a WARN]
Signed-off-by: Suman Anna <s-anna@ti.com>
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
---
v3: No code changes, picked up Santosh's Ack
v2: https://patchwork.kernel.org/patch/9773679/

 drivers/remoteproc/keystone_remoteproc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 6e09ef76f7c7..5f776bfd674a 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -456,6 +456,16 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (of_reserved_mem_device_init(dev))
 		dev_warn(dev, "device does not have specific CMA pool\n");
 
+	/* ensure the DSP is in reset before loading firmware */
+	ret = reset_control_status(ksproc->reset);
+	if (ret < 0) {
+		dev_err(dev, "failed to get reset status, status = %d\n", ret);
+		goto release_mem;
+	} else if (ret == 0) {
+		WARN(1, "device is not in reset\n");
+		keystone_rproc_dsp_reset(ksproc);
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "failed to add register device with remoteproc core, status = %d\n",
-- 
2.13.1
