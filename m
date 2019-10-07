From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 2/2] drivers: firmware: xilinx: Add support for versal soc
Date: Mon,  7 Oct 2019 11:52:23 -0700
Message-ID: <1570474343-21524-3-git-send-email-jolly.shah@xilinx.com>
References: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jolly.shah@xilinx.com>
List-Id: devicetree@vger.kernel.org

Versal is xilinx's next generation soc. This patch adds
driver support required to be compatible with versal device.

Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
---
 drivers/firmware/xilinx/zynqmp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index fd3d837..75bdfaa 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -711,8 +711,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	int ret;
 
 	np = of_find_compatible_node(NULL, NULL, "xlnx,zynqmp");
-	if (!np)
-		return 0;
+	if (!np) {
+		np = of_find_compatible_node(NULL, NULL, "xlnx,versal");
+		if (!np)
+			return 0;
+	}
 	of_node_put(np);
 
 	ret = get_set_conduit_method(dev->of_node);
@@ -770,6 +773,7 @@ static int zynqmp_firmware_remove(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_firmware_of_match[] = {
 	{.compatible = "xlnx,zynqmp-firmware"},
+	{.compatible = "xlnx,versal-firmware"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, zynqmp_firmware_of_match);
-- 
2.7.4
