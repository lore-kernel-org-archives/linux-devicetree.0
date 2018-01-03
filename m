From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [v2 PATCH 1/6] usb: mtu3: fix error code for getting extcon device
Date: Wed, 3 Jan 2018 16:53:17 +0800
Message-ID: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, Catalin Marinas <catalin.marinas@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

When failing to get extcon device, extcon_get_edev_by_phandle()
may return different error codes, but not only -EPROBE_DEFER,
so can't always return -EPROBE_DEFER, and fix it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 3650fd1..5b2110b 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -308,7 +308,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		otg_sx->edev = extcon_get_edev_by_phandle(ssusb->dev, 0);
 		if (IS_ERR(otg_sx->edev)) {
 			dev_err(ssusb->dev, "couldn't get extcon device\n");
-			return -EPROBE_DEFER;
+			return PTR_ERR(otg_sx->edev);
 		}
 	}
 
-- 
1.9.1
