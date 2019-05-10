From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: [PATCH v3 1/3] doc: dt: bindings: usb: dwc3: Update entries for disabling U1 and U2
Date: Fri, 10 May 2019 12:37:26 +0530
Message-ID: <1557472048-10536-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
References: <1557472048-10536-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557472048-10536-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Claus H. Stovgaard" <cst@phaseone.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling the link entering
into the U1 and U2 states

Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
---
 Changes in v3:
	-None

 Changes in v2
	1. As suggested by Thinh Nguyen changed the "snps,dis_u1_entry_quirk"
	   to "snps,dis-u1-entry-quirk"
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 8e5265e..66780a4 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -64,6 +64,8 @@ Optional properties:
  - snps,dis_u2_susphy_quirk: when set core will disable USB2 suspend phy.
  - snps,dis_enblslpm_quirk: when set clears the enblslpm in GUSB2PHYCFG,
 			disabling the suspend signal to the PHY.
+ - snps,dis-u1-entry-quirk: set if link entering into U1 needs to be disabled.
+ - snps,dis-u2-entry-quirk: set if link entering into U2 needs to be disabled.
  - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
 			in PHY P3 power state.
  - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
-- 
2.1.1
