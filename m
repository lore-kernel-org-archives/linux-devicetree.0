From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] drivers: edac: edac_reg_data[] can be static
Date: Wed, 29 Aug 2018 22:43:18 +0800
Message-ID: <20180829144318.GA53254@lkp-ib03>
References: <1535503347-20507-4-git-send-email-vnkgutta@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535503347-20507-4-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de, swboyd@chromium.org, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org


Fixes: 6984008cfe6b ("drivers: edac: Add EDAC driver support for QCOM SoCs")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 qcom_edac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
index 871ed07..69b4cb5 100644
--- a/drivers/edac/qcom_edac.c
+++ b/drivers/edac/qcom_edac.c
@@ -83,7 +83,7 @@ enum {
 	LLCC_TRAM_UE,
 };
 
-const struct llcc_edac_reg_data edac_reg_data[] = {
+static const struct llcc_edac_reg_data edac_reg_data[] = {
 	[LLCC_DRAM_CE] = {
 		.name = "DRAM Single-bit",
 		.synd_reg = DRP_ECC_SB_ERR_SYN0,
