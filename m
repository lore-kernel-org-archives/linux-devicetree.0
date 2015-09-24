From: RAJESH BHAGAT <rajesh.bhagat@freescale.com>
Subject: RE: [PATCH 1/3][v4] Documentation: dt: dwc3: Add
 snps,quirk-frame-length-adjustment property
Date: Thu, 24 Sep 2015 09:42:59 +0000
Message-ID: <BN1PR0301MB0675A3534647A872F433E689E9430@BN1PR0301MB0675.namprd03.prod.outlook.com>
References: <1441341894-17327-1-git-send-email-nikhil.badola@freescale.com>
 <SN1PR0301MB1629AAEC687AF3E058BB701DF35A0@SN1PR0301MB1629.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <SN1PR0301MB1629AAEC687AF3E058BB701DF35A0@SN1PR0301MB1629.namprd03.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe, 

Any comments on the below [v4] patches?

[PATCH 1/3][v4] Documentation: dt: dwc3: Add snps,quirk-frame-length-adjustment property
[PATCH 2/3][v4] drivers: usb: dwc3: Add frame length adjustment quirk
[PATCH 3/3][v4] arm: dts: ls1021a: Add quirk for Erratum A009116

I will be taking forward these patches, as Nikhil has left freescale.

Thanks,
Rajesh Bhagat

-----Original Message-----
From: Nikhil Badola [mailto:nikhil.badola@freescale.com] 
Sent: Friday, September 04, 2015 10:15 AM
To: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-usb@vger.kernel.org
Cc: balbi@ti.com; Badola Nikhil-B46172 <nikhil.badola@freescale.com>
Subject: [PATCH 1/3][v4] Documentation: dt: dwc3: Add snps,quirk-frame-length-adjustment property

Add snps,quirk-frame-length-adjustment property which provides value for post silicon frame length adjustment

Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
---
Changes for v4: None

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
