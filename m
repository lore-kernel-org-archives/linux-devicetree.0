From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 1/2] ARM: shmobile: r8a7790: add HS-USB device node
Date: Wed, 08 Oct 2014 23:54:36 +0400
Message-ID: <10323171.5b5fxKKK8u@wasted.cogentembedded.com>
References: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1674850.BZpGW9kEud@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com
List-Id: devicetree@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Define the R8A7790 generic part of the HS-USB device node. It is up to the board
file to enable the device.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[Sergei: fixed summary, added changelog]
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 3:
- uppercased "arm" in the summary;
- added changelog.

 arch/arm/boot/dts/r8a7790.dtsi |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7790.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7790.dtsi
+++ renesas/arch/arm/boot/dts/r8a7790.dtsi
@@ -600,6 +600,17 @@
 		status = "disabled";
 	};
 
+	hsusb: usb@e6590000 {
+		compatible = "renesas,usbhs-r8a7790";
+		reg = <0 0xe6590000 0 0x100>;
+		interrupts = <0 107 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp7_clks R8A7790_CLK_HSUSB>;
+		renesas,buswait = <4>;
+		phys = <&usb0 1>;
+		phy-names = "usb";
+		status = "disabled";
+	};
+
 	usbphy: usb-phy@e6590100 {
 		compatible = "renesas,usb-phy-r8a7790";
 		reg = <0 0xe6590100 0 0x100>;

