From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] ARM: shmobile: r8a7791: Enable DMA for HSUSB
Date: Tue, 7 Apr 2015 16:53:51 +0900
Message-ID: <1428393231-5272-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1428393231-5272-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1428393231-5272-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@vger.kernel.org, linux-sh@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds DMA properties to the HSUSB node.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7791.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index db3772e..5f20ad4 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -722,6 +722,9 @@
 		renesas,buswait = <4>;
 		phys = <&usb0 1>;
 		phy-names = "usb";
+		dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
+		       <&usb_dmac1 0>, <&usb_dmac1 1>;
+		dma-names = "rx0", "tx1", "rx2", "tx3";
 		status = "disabled";
 	};
 
-- 
1.9.1

