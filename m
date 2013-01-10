From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH 3/4] usb: mxs-phy: add set_suspend API
Date: Thu, 10 Jan 2013 16:35:53 +0800
Message-ID: <1357806954-27960-3-git-send-email-peter.chen@freescale.com>
References: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1357806954-27960-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: alexander.shishkin@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, shawn.guo@linaro.org, dong.aisheng@linaro.org, rob@landley.net, balbi@ti.com, kernel@pengutronix.de
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, festevam@gmail.com, marex@denx.de, mkl@pengutronix.de, m.grzeschik@pengutronix.de, matt@genesi-usa.com, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

It needs to call set_suspend during USB suspend/resume

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 drivers/usb/otg/mxs-phy.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/otg/mxs-phy.c b/drivers/usb/otg/mxs-phy.c
index 7dca384..40643c9 100644
--- a/drivers/usb/otg/mxs-phy.c
+++ b/drivers/usb/otg/mxs-phy.c
@@ -79,6 +79,25 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
 	clk_disable_unprepare(mxs_phy->clk);
 }
 
+static int mxs_phy_suspend(struct usb_phy *x, int suspend)
+{
+	struct mxs_phy *mxs_phy = to_mxs_phy(x);
+
+	if (suspend) {
+		writel_relaxed(0xffffffff, x->io_priv + HW_USBPHY_PWD);
+		writel_relaxed(BM_USBPHY_CTRL_CLKGATE,
+			x->io_priv + HW_USBPHY_CTRL_SET);
+		clk_disable_unprepare(mxs_phy->clk);
+	} else {
+		clk_prepare_enable(mxs_phy->clk);
+		writel_relaxed(BM_USBPHY_CTRL_CLKGATE,
+			x->io_priv + HW_USBPHY_CTRL_CLR);
+		writel_relaxed(0, x->io_priv + HW_USBPHY_PWD);
+	}
+
+	return 0;
+}
+
 static int mxs_phy_on_connect(struct usb_phy *phy,
 		enum usb_device_speed speed)
 {
@@ -141,6 +160,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->phy.label		= DRIVER_NAME;
 	mxs_phy->phy.init		= mxs_phy_init;
 	mxs_phy->phy.shutdown		= mxs_phy_shutdown;
+	mxs_phy->phy.set_suspend	= mxs_phy_suspend;
 	mxs_phy->phy.notify_connect	= mxs_phy_on_connect;
 	mxs_phy->phy.notify_disconnect	= mxs_phy_on_disconnect;
 
-- 
1.7.0.4


