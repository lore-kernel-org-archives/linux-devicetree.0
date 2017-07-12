From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] Macchiatobin updates
Date: Wed, 12 Jul 2017 18:54:42 +0200
Message-ID: <87fue1bnot.fsf@free-electrons.com>
References: <20170708191317.GM4902@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170708191317.GM4902-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org> (Russell King's
        message of "Sat, 8 Jul 2017 20:13:17 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Hi Russell King,
 
 On sam., juil. 08 2017, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> This series, based upon the 4.12-rc6 backports branch in the MISL tree:
> - adds a maintainer entry for the Macchiatobin board.
> - adds GPIO interrupt support to the CP110s
> - adds the pinmux entries
> - corrects the 5V regulator GPIO entry
> - adds support for the I2C mux (used for the SFP slots)
> - adds PCIe support
>
> All entries include the appropriate pinmux and GPIO configuration.
>
> PCIe support has not been tested locally as I have no PCIe cards to
> test with; this patch includes support for the PCIe reset GPIO signal.
> If others can test that patch and let me know whether it works, I would
> be most grateful.
>

The first patch had been applied on mvebu/arm64-for-4.14.

Patch 2 to 6 had been applied on mvebu/dt64-for-4.14.

For the patch 4, I merged it with the patch that Thomas previously sent
because it was not in mainline yet even if it was on the backport
branch. The resulting patch is attached.
--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment;
 filename=0001-arm64-dts-marvell-fix-USB3-regulator-definition-on-M.patch

>From e8f260a4b40e658ab473ff8509192dcc08862d68 Mon Sep 17 00:00:00 2001
From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Date: Wed, 12 Jul 2017 14:56:55 +0200
Subject: [PATCH] arm64: dts: marvell: fix USB3 regulator definition on
 MacchiatoBin

Due to the lack of GPIO support, the USB3 regulator definition was
left unfinished in the MacchiatoBin DT description. Now that GPIO
support is available, this commit adjusts the Device Tree to properly
describe the USB3 regulator.

[gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org: use commit log from Thomas]

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
index fe91433d6fcd..da13ab2103aa 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts
@@ -46,6 +46,8 @@
 
 #include "armada-8040.dtsi"
 
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model = "Marvell 8040 MACHIATOBin";
 	compatible = "marvell,armada8040-mcbin", "marvell,armada8040",
@@ -77,11 +79,13 @@
 
 	v_5v0_usb3_hst_vbus: regulator-usb3-vbus0 {
 		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&cpm_gpio2 15 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cpm_xhci_vbus_pins>;
 		regulator-name = "v_5v0_usb3_hst_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		/* actually GPIO controlled, but 8k has no GPIO support yet */
-		regulator-always-on;
 		status = "okay";
 	};
 
@@ -136,6 +140,10 @@
 		marvell,pins = "mpp37", "mpp38";
 		marvell,function = "i2c0";
 	};
+	cpm_xhci_vbus_pins: xhci0-vbus-pins {
+		marvell,pins = "mpp47";
+		marvell,function = "gpio";
+	};
 	cpm_sdhci_pins: sdhci-pins {
 		marvell,pins = "mpp55", "mpp56", "mpp57", "mpp58", "mpp59",
 			       "mpp60", "mpp61";
-- 
2.13.2


--=-=-=
Content-Type: text/plain



Finally I tested the last patch with an Ethernet PCIe card it worked
well, but the reset part was not tested as I don't know how it should be
tested.

As soon as the v4.13-rc1 will be released then the branches will be rebased
on it and renamed mvebu/arm64 and mvebu/dt64.

Thanks,

Gregory


>  MAINTAINERS                                        |  6 ++
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts  | 89 +++++++++++++++++++++-
>  .../boot/dts/marvell/armada-cp110-master.dtsi      | 11 ++-
>  .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 11 ++-
>  4 files changed, 112 insertions(+), 5 deletions(-)
>
> -- 
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
