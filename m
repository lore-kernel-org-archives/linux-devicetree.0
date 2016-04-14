From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 6/7] usb: musb: da8xx: Use devm in probe
Date: Thu, 14 Apr 2016 13:35:17 -0500
Message-ID: <1460658919-4965-7-git-send-email-david@lechnology.com>
References: <1460658919-4965-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460658919-4965-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, khilman@kernel.org, nsekhar@ti.com, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Simplify things a bit by using devm functions where possible.

Signed-off-by: David Lechner <david@lechnology.com>
---

v4 changes: no change


 drivers/usb/musb/da8xx.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index b03d3b8..0c1997c 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -490,20 +490,18 @@ static int da8xx_probe(struct platform_device *pdev)
 	struct da8xx_glue		*glue;
 	struct platform_device_info	pinfo;
 	struct clk			*clk;
+	int				ret;
 
-	int				ret = -ENOMEM;
-
-	glue = kzalloc(sizeof(*glue), GFP_KERNEL);
+	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
 	if (!glue) {
 		dev_err(&pdev->dev, "failed to allocate glue context\n");
-		goto err0;
+		return -ENOMEM;
 	}
 
-	clk = clk_get(&pdev->dev, "usb20");
+	clk = devm_clk_get(&pdev->dev, "usb20");
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-		ret = PTR_ERR(clk);
-		goto err3;
+		return PTR_ERR(clk);
 	}
 
 	ret = clk_enable(clk);
@@ -560,12 +558,7 @@ err5:
 	clk_disable(clk);
 
 err4:
-	clk_put(clk);
-
-err3:
-	kfree(glue);
 
-err0:
 	return ret;
 }
 
@@ -576,8 +569,6 @@ static int da8xx_remove(struct platform_device *pdev)
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(glue->phy);
 	clk_disable(glue->clk);
-	clk_put(glue->clk);
-	kfree(glue);
 
 	return 0;
 }
-- 
1.9.1
