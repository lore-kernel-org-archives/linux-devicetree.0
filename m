From: George Cherian <george.cherian@ti.com>
Subject: [PATCH v2 3/3] phy: omap-usb2: Add different compatible for OMAP5
Date: Thu, 6 Mar 2014 18:11:54 +0530
Message-ID: <1394109714-31228-4-git-send-email-george.cherian@ti.com>
References: <1394109714-31228-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394109714-31228-1-git-send-email-george.cherian@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: s.nawrocki@samsung.com, tony@atomide.com, george.cherian@ti.com, gregkh@linuxfoundation.org, kishon@ti.com, rob@landley.net, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Add a new compatible for OMAP5 since it does not use any of the
OTG operations as of now.
HAS_SRP and SET_VBUS functionalities are used only for OMAP4.

Update the Documentation also to add new comaptible.

Signed-off-by: George Cherian <george.cherian@ti.com>
---
 Documentation/devicetree/bindings/usb/usb-phy.txt | 3 ++-
 drivers/phy/phy-omap-usb2.c                       | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-phy.txt b/Documentation/devicetree/bindings/usb/usb-phy.txt
index 03de61a5..ec199a5 100644
--- a/Documentation/devicetree/bindings/usb/usb-phy.txt
+++ b/Documentation/devicetree/bindings/usb/usb-phy.txt
@@ -4,7 +4,8 @@ OMAP USB2 PHY
 
 Required properties:
  - compatible: Should be either of
-	* "ti,omap-usb2" for OMAP4 and OMAP5
+	* "ti,omap-usb2" for OMAP4
+	* "ti,omap5-usb2" for OMAP5
 	* "ti,dra7x-usb2" for DRA7
 	* "ti,am437x-usb2" for AM437x
  - reg : Address and length of the register set for the device.
diff --git a/drivers/phy/phy-omap-usb2.c b/drivers/phy/phy-omap-usb2.c
index b220202..3cc4aba 100644
--- a/drivers/phy/phy-omap-usb2.c
+++ b/drivers/phy/phy-omap-usb2.c
@@ -154,6 +154,11 @@ static const struct usb_phy_data omap_usb2_data = {
 	.flags = OMAP_USB2_HAS_START_SRP | OMAP_USB2_HAS_SET_VBUS,
 };
 
+static const struct usb_phy_data omap5_usb2_data = {
+	.label = "omap5_usb2",
+	.flags = 0,
+};
+
 static const struct usb_phy_data dra7x_usb2_data = {
 	.label = "dra7x_usb2",
 	.flags = OMAP_USB2_CALIBRATE_FALSE_DISCONNECT,
@@ -170,6 +175,10 @@ static const struct of_device_id omap_usb2_id_table[] = {
 		.data = &omap_usb2_data,
 	},
 	{
+		.compatible = "ti,omap5-usb2",
+		.data = &omap5_usb2_data,
+	},
+	{
 		.compatible = "ti,dra7x-usb2",
 		.data = &dra7x_usb2_data,
 	},
-- 
1.8.3.1
