From: Manish Narani <manish.narani@xilinx.com>
Subject: [PATCH v9 1/6] edac: synopsys: Add error handling for NULL in probe()
Date: Mon, 15 Oct 2018 10:59:43 +0530
Message-ID: <1539581388-23963-2-git-send-email-manish.narani@xilinx.com>
References: <1539581388-23963-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539581388-23963-1-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, manish.narani@xilinx.com, amit.kucheria@linaro.org, sudeep.holla@arm.com, olof@lixom.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The function of_device_get_match_data() can return NULL in case of
error. Add error handling for the same in probe().

Signed-off-by: Manish Narani <manish.narani@xilinx.com>
---
 drivers/edac/synopsys_edac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index 1c3795d..0005ef3 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -477,6 +477,9 @@ static int mc_probe(struct platform_device *pdev)
 		return PTR_ERR(baseaddr);
 
 	p_data = of_device_get_match_data(&pdev->dev);
+	if (!p_data)
+		return -ENODEV;
+
 	if (!p_data->get_ecc_state(baseaddr)) {
 		edac_printk(KERN_INFO, EDAC_MC, "ECC not enabled\n");
 		return -ENXIO;
-- 
2.1.1
