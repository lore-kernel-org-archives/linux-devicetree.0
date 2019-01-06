From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 6/7] amba: Allow pclk to be controlled by power domain
Date: Sun,  6 Jan 2019 00:09:14 -0800
Message-ID: <20190106080915.4493-7-bjorn.andersson@linaro.org>
References: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190106080915.4493-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On the Qualcomm SDM845 platform the apb_pclk is controlled as part of
the QDSS power/clock domain. Handle this by allowing amba to operate
without direct apb_pclk control, when a powerdomain is attached and no
clock is described.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/amba/bus.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index 41b706403ef7..3e13050c6d59 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -219,8 +219,13 @@ static int amba_get_enable_pclk(struct amba_device *pcdev)
 	int ret;
 
 	pcdev->pclk = clk_get(&pcdev->dev, "apb_pclk");
-	if (IS_ERR(pcdev->pclk))
-		return PTR_ERR(pcdev->pclk);
+	if (IS_ERR(pcdev->pclk)) {
+		/* Continue with no clock specified, but pm_domain attached */
+		if (PTR_ERR(pcdev->pclk) == -ENOENT && pcdev->dev.pm_domain)
+			pcdev->pclk = NULL;
+		else
+			return PTR_ERR(pcdev->pclk);
+	}
 
 	ret = clk_prepare_enable(pcdev->pclk);
 	if (ret)
-- 
2.18.0
