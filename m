From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/7] doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
Date: Sun, 28 Apr 2019 02:51:13 +0000
Message-ID: <20190428024847.5046-2-peter.chen@nxp.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190428024847.5046-1-peter.chen@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "balbi@kernel.org" <balbi@kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add compatible for 7ulp USB PHY.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
index 6ac98b3b5f57..32da8d17759a 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
@@ -7,6 +7,7 @@ Required properties:
 	* "fsl,imx6sl-usbphy" for imx6sl
 	* "fsl,vf610-usbphy" for Vybrid vf610
 	* "fsl,imx6sx-usbphy" for imx6sx
+	* "fsl,imx7ulp-usbphy" for imx7ulp
   "fsl,imx23-usbphy" is still a fallback for other strings
 - reg: Should contain registers location and length
 - interrupts: Should contain phy interrupt
-- 
2.14.1
