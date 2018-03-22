From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v2 2/6] phy: qcom-qusb2: Fix crash if nvmem cell not specified
Date: Thu, 22 Mar 2018 14:20:42 +0530
Message-ID: <1521708646-5379-3-git-send-email-mgautam@codeaurora.org>
References: <1521708646-5379-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521708646-5379-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, stable <stable@vger.kernel.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Driver currently crashes due to NULL pointer deference
while updating PHY tune register if nvmem cell is NULL.
Since, fused value for Tune1/2 register is optional,
we'd rather bail out.

Fixes: ca04d9d3e1b1 ("phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips")
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: stable <stable@vger.kernel.org> # 4.14+
Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 94afeac..40fdef8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -315,6 +315,10 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
 	const struct qusb2_phy_cfg *cfg = qphy->cfg;
 	u8 *val;
 
+	/* efuse register is optional */
+	if (!qphy->cell)
+		return;
+
 	/*
 	 * Read efuse register having TUNE2/1 parameter's high nibble.
 	 * If efuse register shows value as 0x0, or if we fail to find
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
