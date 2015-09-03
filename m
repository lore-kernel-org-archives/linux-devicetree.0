From: Nikhil Badola <nikhil.badola@freescale.com>
Subject: [PATCH 1/3][v3] Documentation: dt: dwc3: Add snps,quirk-frame-length-adjustment property
Date: Thu, 3 Sep 2015 11:33:24 +0530
Message-ID: <1441260204-27224-1-git-send-email-nikhil.badola@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc: balbi@ti.com, Nikhil Badola <nikhil.badola@freescale.com>
List-Id: devicetree@vger.kernel.org

Add snps,quirk-frame-length-adjustment property which provides value
for post silicon frame length adjustment

Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
---
Changes for v3 : None

 Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 0815eac..8c7d585 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -40,6 +40,9 @@ Optional properties:
  - snps,hird-threshold: HIRD threshold
  - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
    UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
+ - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
+	register for post-silicon frame length adjustment when the
+	fladj_30mhz_sdbnd signal is invalid or incorrect.
 
 This is usually a subnode to DWC3 glue to which it is connected.
 
-- 
2.1.0
