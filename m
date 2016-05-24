From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/4] arm64: dts: salvator-x: enable HSUSB
Date: Tue, 24 May 2016 19:34:18 +0900
Message-ID: <1464086058-1276-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1464086058-1276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464086058-1276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since related drivers doesn't support OTG framework yet, the renesas_usbhs
driver cannot detect VBUS in particular situations. And then a gadget
driver doesn't work correctly (even if a USB cable is connected to a USB
host, nothing happens).
However, we can avoid such a situation if we operate the followings:

 1) rmmod/unbind all gadget drivers
 2) rmmod/unbind the renesas_usbhs driver
  e.g. # echo e6590000.usb > /sys/bus/platform/drivers/renesas_usbhs/unbind
 3) connect the USB cable of CN9 to a USB host
 4) insmod/bind the renesas_usbhs driver
  e.g. # echo e6590000.usb > /sys/bus/platform/drivers/renesas_usbhs/bind
 5) insmod/bind a gadget driver

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 23bc06b..7dc3ca6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -603,6 +603,10 @@
 	status = "okay";
 };
 
+&hsusb {
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 	status = "okay";
-- 
1.9.1
