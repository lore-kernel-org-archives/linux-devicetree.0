From: John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: hisi: add refclk node to hip06 dts files for SAS
Date: Tue, 8 Nov 2016 00:44:25 +0800
Message-ID: <1478537065-169286-4-git-send-email-john.garry@huawei.com>
References: <1478537065-169286-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478537065-169286-1-git-send-email-john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We will only maintain 1 dts for D03 and there are 50MHz
and 66MHz versions of D03: so we expect UEFI to update
refclk rate in the fdt at boot time.

Signed-off-by: John Garry <john.garry-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Xiang Chen <chenxiang66-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hip06.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 5330abb..7b40dce 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -318,6 +318,12 @@
 		#size-cells = <2>;
 		ranges;
 
+		refclk: refclk {
+			compatible = "fixed-clock";
+			clock-frequency = <50000000>;
+			#clock-cells = <0>;
+		};
+
 		usb_ohci: ohci@a7030000 {
 			compatible = "generic-ohci";
 			reg = <0x0 0xa7030000 0x0 0x10000>;
@@ -552,6 +558,7 @@
 			ctrl-reset-reg = <0xa60>;
 			ctrl-reset-sts-reg = <0x5a30>;
 			ctrl-clock-ena-reg = <0x338>;
+			clocks = <&refclk 0>;
 			queue-count = <16>;
 			phy-count = <8>;
 			dma-coherent;
@@ -594,6 +601,7 @@
 			ctrl-reset-reg = <0xa18>;
 			ctrl-reset-sts-reg = <0x5a0c>;
 			ctrl-clock-ena-reg = <0x318>;
+			clocks = <&refclk 0>;
 			queue-count = <16>;
 			phy-count = <8>;
 			dma-coherent;
@@ -635,6 +643,7 @@
 			ctrl-reset-reg = <0xae0>;
 			ctrl-reset-sts-reg = <0x5a70>;
 			ctrl-clock-ena-reg = <0x3a8>;
+			clocks = <&refclk 0>;
 			queue-count = <16>;
 			phy-count = <9>;
 			dma-coherent;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
