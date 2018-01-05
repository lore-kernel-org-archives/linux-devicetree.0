From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH 1/4] arm: dts: ls1021a: Enable usb3-lpm-capable for usb3 node
Date: Fri, 5 Jan 2018 17:40:06 +0800
Message-ID: <20180105094009.22599-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Felipe Balbi <balbi@kernel.org>, Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

Enable USB3 HW LPM feature for ls1021a and active patch for
snps erratum A-010131. It will disable U1/U2 temperary when
initiate U3 request.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index f81fad2..21a4488 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -709,6 +709,8 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			usb3-lpm-capable;
+			snps,dis-u1u2-when-u3-quirk;
 		};
 
 		pcie@3400000 {
-- 
1.7.1
