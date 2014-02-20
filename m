From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v10 01/15] usb: doc: phy-mxs: Add more compatible strings
Date: Thu, 20 Feb 2014 13:14:30 +0800
Message-ID: <1392873284-9386-2-git-send-email-peter.chen@freescale.com>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, robh+dt@kernel.org, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
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


