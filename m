From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] ARM: shmobile: r8a7790: Enable DMA for HSUSB
Date: Fri, 8 May 2015 16:13:07 +0900
Message-ID: <1431069187-6088-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1431069187-6088-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1431069187-6088-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds DMA properties to the HSUSB node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index c03a915..62a9086 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -673,6 +673,9 @@
 		renesas,buswait = <4>;
 		phys = <&usb0 1>;
 		phy-names = "usb";
+		dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
+		       <&usb_dmac1 0>, <&usb_dmac1 1>;
+		dma-names = "ch0", "ch1", "ch2", "ch3";
 		status = "disabled";
 	};
 
-- 
1.9.1

