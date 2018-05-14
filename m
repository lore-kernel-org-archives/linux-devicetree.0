Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v3 4/4] arm64: dts: renesas: r8a7795: add OF graph for usb role switch
Date: Mon, 14 May 2018 18:16:00 +0900
Message-Id: <1526289360-3997-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds OF graph properties for usb role switch in r8a7795
into USB3.0 host/peripheral nodes.

TODO:
 - need patches for other SoCs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1d5e3ac..50d3312 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1746,6 +1746,12 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_host0_ep: endpoint {
+					remote-endpoint = <&usb3_peri0_ep>;
+				};
+			};
 		};
 
 		usb3_peri0: usb@ee020000 {
@@ -1757,6 +1763,12 @@
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 328>;
 			status = "disabled";
+
+			port {
+				usb3_peri0_ep: endpoint {
+					remote-endpoint = <&usb3_host0_ep>;
+				};
+			};
 		};
 
 		usb_dmac0: dma-controller@e65a0000 {
-- 
1.9.1
