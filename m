From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 3/4] usb: mxs-phy: add set_suspend API
Date: Tue, 15 Jan 2013 14:08:36 +0800
Message-ID: <1358230117-19443-3-git-send-email-peter.chen@freescale.com>
References: <1358230117-19443-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358230117-19443-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: marex-ynQEQJNshbs@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

It needs to call set_suspend during USB suspend/resume

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/usb/otg/mxs-phy.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/otg/mxs-phy.c b/drivers/usb/otg/mxs-phy.c
index 49727dd..cad16e5 100644
--- a/drivers/usb/otg/mxs-phy.c
+++ b/drivers/usb/otg/mxs-phy.c
@@ -84,6 +84,25 @@ static void mxs_phy_shutdown(struct usb_phy *phy)
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
@@ -146,6 +165,7 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	mxs_phy->phy.label		= DRIVER_NAME;
 	mxs_phy->phy.init		= mxs_phy_init;
 	mxs_phy->phy.shutdown		= mxs_phy_shutdown;
+	mxs_phy->phy.set_suspend	= mxs_phy_suspend;
 	mxs_phy->phy.notify_connect	= mxs_phy_on_connect;
 	mxs_phy->phy.notify_disconnect	= mxs_phy_on_disconnect;
 
-- 
1.7.0.4
