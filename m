From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v10 04/15] usb: doc: phy-mxs: update binding for adding anatop phandle
Date: Thu, 20 Feb 2014 13:14:33 +0800
Message-ID: <1392873284-9386-5-git-send-email-peter.chen@freescale.com>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, robh+dt@kernel.org, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add anatop phandle which is used to access anatop registers to
control PHY's power and other USB operations.

Signed-off-by: Peter Chen <peter.chen@freescale.com>
---
 Documentation/devicetree/bindings/usb/mxs-phy.txt |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mxs-phy.txt b/Documentation/devicetree/bindings/usb/mxs-phy.txt
index b43d4c9e..fc6659d 100644
--- a/Documentation/devicetree/bindings/usb/mxs-phy.txt
+++ b/Documentation/devicetree/bindings/usb/mxs-phy.txt
@@ -5,10 +5,12 @@ Required properties:
   for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
+- fsl,anatop: phandle for anatop register, it is only for imx6 SoC series
 
 Example:
 usbphy1: usbphy@020c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 	reg = <0x020c9000 0x1000>;
 	interrupts = <0 44 0x04>;
+	fsl,anatop = <&anatop>;
 };
-- 
1.7.8


