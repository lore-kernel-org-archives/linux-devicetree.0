From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 1/1] ARM: shmobile: r8a7791: add USB3.0 device node
Date: Fri, 24 Oct 2014 19:43:02 +0900
Message-ID: <1414147382-4660-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1414147382-4660-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1414147382-4660-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm/boot/dts/r8a7791.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 74f18d8..1f4b6db 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1152,6 +1152,16 @@
 		status = "disabled";
 	};
 
+	xhci: usb@ee000000 {
+		compatible = "renesas,xhci-r8a7791";
+		reg = <0 0xee000000 0 0xc00>;
+		interrupts = <0 101 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7791_CLK_SSUSB>;
+		phys = <&usb2 1>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
 	pci0: pci@ee090000 {
 		compatible = "renesas,pci-r8a7791";
 		device_type = "pci";
-- 
1.7.9.5

