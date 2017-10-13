From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 10/13] usb: mtu3: set otg_sel for u2port only if works as dual-role mode
Date: Fri, 13 Oct 2017 17:10:46 +0800
Message-ID: <4b26d4f134ebad397b9ff16142e39d52308f331c.1507885127.git.chunfeng.yun@mediatek.com>
References: <6dc39e99240f25c83f8c36d23361ec89dcfb33ce.1507885126.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6dc39e99240f25c83f8c36d23361ec89dcfb33ce.1507885126.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When set otg_sel(SSUSB_U2_PORT_OTG_SEL) for u2port which supports
dual-role mode, the controller will automatically switch mode
between host and device according to IDDIG signal. But if the
u2port only supports device mode, and no IDDIG pin is provided,
setting otg_sel may cause failure of detection by host.
So set it only for dual-role mode.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 67f7a30..7c149a7 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -115,7 +115,9 @@ static int mtu3_device_enable(struct mtu3 *mtu)
 	mtu3_clrbits(ibase, SSUSB_U2_CTRL(0),
 		(SSUSB_U2_PORT_DIS | SSUSB_U2_PORT_PDN |
 		SSUSB_U2_PORT_HOST_SEL));
-	mtu3_setbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG)
+		mtu3_setbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
 
 	return ssusb_check_clocks(mtu->ssusb, check_clk);
 }
@@ -130,7 +132,10 @@ static void mtu3_device_disable(struct mtu3 *mtu)
 
 	mtu3_setbits(ibase, SSUSB_U2_CTRL(0),
 		SSUSB_U2_PORT_DIS | SSUSB_U2_PORT_PDN);
-	mtu3_clrbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+
+	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG)
+		mtu3_clrbits(ibase, SSUSB_U2_CTRL(0), SSUSB_U2_PORT_OTG_SEL);
+
 	mtu3_setbits(ibase, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
-- 
1.7.9.5
