From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 2/5] USB: host: ohci-at91: remove useless uclk clock
Date: Tue, 17 Mar 2015 17:15:47 +0100
Message-ID: <1426608950-31555-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1426608950-31555-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1426608950-31555-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris Brezillon <boris.brezillon@free-electrons.com>, Douglas Gilbert <dgilbert@interlog.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Robert Nelson <robert.nelson@digikey.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that the system clock driver is forwarding set_rate request to the
parent clock, we can safely call clk_set_rate on the system clk and get
rid of the uclk field.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/usb/host/ohci-at91.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index 7cce85a..15df00c 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -39,7 +39,6 @@
 struct ohci_at91_priv {
 	struct clk *iclk;
 	struct clk *fclk;
-	struct clk *uclk;
 	struct clk *hclk;
 	bool clocked;
 	bool wakeup;		/* Saved wake-up state for resume */
@@ -64,10 +63,8 @@ static void at91_start_clock(struct ohci_at91_priv *ohci_at91)
 {
 	if (ohci_at91->clocked)
 		return;
-	if (IS_ENABLED(CONFIG_COMMON_CLK)) {
-		clk_set_rate(ohci_at91->uclk, 48000000);
-		clk_prepare_enable(ohci_at91->uclk);
-	}
+
+	clk_set_rate(ohci_at91->fclk, 48000000);
 	clk_prepare_enable(ohci_at91->hclk);
 	clk_prepare_enable(ohci_at91->iclk);
 	clk_prepare_enable(ohci_at91->fclk);
@@ -78,11 +75,10 @@ static void at91_stop_clock(struct ohci_at91_priv *ohci_at91)
 {
 	if (!ohci_at91->clocked)
 		return;
+
 	clk_disable_unprepare(ohci_at91->fclk);
 	clk_disable_unprepare(ohci_at91->iclk);
 	clk_disable_unprepare(ohci_at91->hclk);
-	if (IS_ENABLED(CONFIG_COMMON_CLK))
-		clk_disable_unprepare(ohci_at91->uclk);
 	ohci_at91->clocked = false;
 }
 
@@ -191,14 +187,6 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
 		retval = PTR_ERR(ohci_at91->hclk);
 		goto err;
 	}
-	if (IS_ENABLED(CONFIG_COMMON_CLK)) {
-		ohci_at91->uclk = devm_clk_get(dev, "usb_clk");
-		if (IS_ERR(ohci_at91->uclk)) {
-			dev_err(dev, "failed to get uclk\n");
-			retval = PTR_ERR(ohci_at91->uclk);
-			goto err;
-		}
-	}
 
 	board = hcd->self.controller->platform_data;
 	ohci = hcd_to_ohci(hcd);
-- 
1.9.1
