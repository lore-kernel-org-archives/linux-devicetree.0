Return-Path: <SRS0=pK1f=P6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:33024
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727026AbfAVKib (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Jan 2019 05:38:31 -0500
From: Jun Li <jun.li@nxp.com>
Subject: [PATCH 1/2] Documentation: usb: dwc3: add power down clock scale
 property
Date: Tue, 22 Jan 2019 10:37:17 +0000
Message-ID: <1548152179-19472-1-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "balbi@kernel.org" <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

The USB3 suspend_clk input replaces pipe3_rx_pclk as a clock
source to a small part of the USB3 core that operates when the
SS PHY is in its lowest power(P3) state, and therefore does
not provide a clock. The power down scale specifies how many
suspend_clk periods fit into a 16 KHz clock period, details
can see DWC3 databook register GCTL.PWRDNSCALE.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation=
/devicetree/bindings/usb/dwc3.txt
index 3e4c38b..d1c8b62 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -102,6 +102,12 @@ Optional properties:
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
=20
+ - snps,power-down-scale: Power down scale field specifies how many suspen=
d_clk
+			periods fit into a 16 Khz clock period. When performing
+			the division, round up the remainder. Suspend clock is
+			from 32kHz to 125MHz, means the value range is 2~8000.
+			(details see DWC_usb3 databook register GCTL.PWRDNSCALE).
+
  - in addition all properties from usb-xhci.txt from the current directory=
 are
    supported as well
=20
--=20
2.7.4
