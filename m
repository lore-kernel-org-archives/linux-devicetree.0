From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v7 01/14] usb: doc: phy-mxs: Add more compatible strings
Date: Fri, 20 Dec 2013 15:51:57 +0800
Message-ID: <1387525930-27313-2-git-send-email-peter.chen@freescale.com>
References: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387525930-27313-1-git-send-email-peter.chen@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@ti.com, shawn.guo@linaro.org, rob.herring@calxeda.com, grant.likely@linaro.org
Cc: marex@denx.de, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, peter.chen@freescale.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add "fsl,imx6q-usbphy" for imx6dq and imx6dl, add
"fsl,imx6sl-usbphy" for imx6sl.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 Documentation/devicetree/bindings/usb/mxs-phy.txt |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index 5835b27..b43d4c9e 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -1,7 +1,8 @@
 * Freescale MXS USB Phy Device
 
 Required properties:
-- compatible: Should be "fsl,imx23-usbphy"
+- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-usbphy"
+  for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
 
-- 
1.7.8
