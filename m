From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/5] USB: ehci-atmel: rework clk handling
Date: Tue, 17 Mar 2015 17:15:46 +0100
Message-ID: <1426608950-31555-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1426608950-31555-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426608950-31555-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Gilbert <dgilbert-qazKcTl6WRFWk0Htik3J/w@public.gmane.org>, Robert Nelson <robert.nelson-9gsZL1vm+hpBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The EHCI IP only needs the UTMI/UPLL (uclk) and the peripheral (iclk)
clocks to work properly. Remove the useless system clock (fclk).

Avoid calling set_rate on the fixed rate UTMI/IPLL clock and remove
useless IS_ENABLED(CONFIG_COMMON_CLK) tests (all at91 platforms have been
moved to the CCF).

This patch also fixes a bug introduced by 3440ef1 (ARM: at91/dt: fix USB
high-speed clock to select UTMI), which was leaving the usb clock
uninitialized and preventing the OHCI driver from setting the usb clock
rate to 48MHz.
This bug was caused by several things:
1/ usb clock drivers set the CLK_SET_RATE_GATE flag, which means the rate
   cannot be changed once the clock is prepared
2/ The EHCI driver was retrieving and preparing/enabling the uhpck
   clock which was in turn preparing its parent clock (the usb clock),
   thus preventing any rate change because of 1/

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/usb/host/ehci-atmel.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 663f790..be0964a 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -34,7 +34,6 @@ static const char hcd_name[] = "ehci-atmel";
 
 struct atmel_ehci_priv {
 	struct clk *iclk;
-	struct clk *fclk;
 	struct clk *uclk;
 	bool clocked;
 };
@@ -51,12 +50,9 @@ static void atmel_start_clock(struct atmel_ehci_priv *atmel_ehci)
 {
 	if (atmel_ehci->clocked)
 		return;
-	if (IS_ENABLED(CONFIG_COMMON_CLK)) {
-		clk_set_rate(atmel_ehci->uclk, 48000000);
-		clk_prepare_enable(atmel_ehci->uclk);
-	}
+
+	clk_prepare_enable(atmel_ehci->uclk);
 	clk_prepare_enable(atmel_ehci->iclk);
-	clk_prepare_enable(atmel_ehci->fclk);
 	atmel_ehci->clocked = true;
 }
 
@@ -64,10 +60,9 @@ static void atmel_stop_clock(struct atmel_ehci_priv *atmel_ehci)
 {
 	if (!atmel_ehci->clocked)
 		return;
-	clk_disable_unprepare(atmel_ehci->fclk);
+
 	clk_disable_unprepare(atmel_ehci->iclk);
-	if (IS_ENABLED(CONFIG_COMMON_CLK))
-		clk_disable_unprepare(atmel_ehci->uclk);
+	clk_disable_unprepare(atmel_ehci->uclk);
 	atmel_ehci->clocked = false;
 }
 
@@ -146,20 +141,13 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 		retval = -ENOENT;
 		goto fail_request_resource;
 	}
-	atmel_ehci->fclk = devm_clk_get(&pdev->dev, "uhpck");
-	if (IS_ERR(atmel_ehci->fclk)) {
-		dev_err(&pdev->dev, "Error getting function clock\n");
-		retval = -ENOENT;
+
+	atmel_ehci->uclk = devm_clk_get(&pdev->dev, "usb_clk");
+	if (IS_ERR(atmel_ehci->uclk)) {
+		dev_err(&pdev->dev, "failed to get uclk\n");
+		retval = PTR_ERR(atmel_ehci->uclk);
 		goto fail_request_resource;
 	}
-	if (IS_ENABLED(CONFIG_COMMON_CLK)) {
-		atmel_ehci->uclk = devm_clk_get(&pdev->dev, "usb_clk");
-		if (IS_ERR(atmel_ehci->uclk)) {
-			dev_err(&pdev->dev, "failed to get uclk\n");
-			retval = PTR_ERR(atmel_ehci->uclk);
-			goto fail_request_resource;
-		}
-	}
 
 	ehci = hcd_to_ehci(hcd);
 	/* registers start at offset 0x0 */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
