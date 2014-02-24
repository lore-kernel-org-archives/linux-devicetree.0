From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v11 01/15] usb: doc: phy-mxs: Add more compatible strings
Date: Mon, 24 Feb 2014 10:20:53 +0800
Message-ID: <1393208467-6355-2-git-send-email-peter.chen@freescale.com>
References: <1393208467-6355-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1393208467-6355-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, robh+dt@kernel.org, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add "fsl,imx6q-usbphy" for imx6dq and imx6dl, add
"fsl,imx6sl-usbphy" for imx6sl, and "fsl,imx23-usbphy"
is still a fallback for other strings.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 Documentation/devicetree/bindings/usb/mxs-phy.txt |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index 5835b27..ea5134a 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -1,7 +1,11 @@
 * Freescale MXS USB Phy Device
 
 Required properties:
-- compatible: Should be "fsl,imx23-usbphy"
+- compatible: should contain:
+	* "fsl,imx23-usbphy" for imx23 and imx28
+	* "fsl,imx6q-usbphy" for imx6dq and imx6dl
+	* "fsl,imx6sl-usbphy" for imx6sl
+  "fsl,imx23-usbphy" is still a fallback for other strings
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
 
-- 
1.7.8


