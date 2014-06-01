From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] thermal: ti-soc-thermal: ti-bandgap.c:  Cleaning up memory leak
Date: Sun,  1 Jun 2014 13:33:51 +0200
Message-ID: <1401622431-13554-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
To: Eduardo Valentin <eduardo.valentin@ti.com>, Zhang Rui <rui.zhang@intel.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There is a risk for memory leak in when something unexpected happens
and the function returns.

This was largely found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/thermal/ti-soc-thermal/ti-bandgap.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index 3ab12ee..8401d2e 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -1155,8 +1155,9 @@ static struct ti_bandgap *ti_bandgap_build(struct platform_device *pdev)
 	/* register shadow for context save and restore */
 	bgp->regval = devm_kzalloc(&pdev->dev, sizeof(*bgp->regval) *
 				   bgp->conf->sensor_count, GFP_KERNEL);
-	if (!bgp) {
+	if (!bgp->regval) {
 		dev_err(&pdev->dev, "Unable to allocate mem for driver ref\n");
+		devm_kfree(&pdev->dev, bgp);
 		return ERR_PTR(-ENOMEM);
 	}
 
-- 
1.7.10.4

