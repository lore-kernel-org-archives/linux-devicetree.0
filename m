Return-Path: <SRS0=oGub=MD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36238 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbeIUTCv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Sep 2018 15:02:51 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180921131401euoutp0222533d9ee4b2d07a90a0bc9ec89ec9d3~WbIUBsusJ1539415394euoutp02M
        for <devicetree@vger.kernel.org>; Fri, 21 Sep 2018 13:14:01 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3] arm64: dts: exynos: add OF graph between USB-PHY and
 MUIC
Date: Fri, 21 Sep 2018 15:13:55 +0200
Message-Id: <20180921131359eucas1p2fd46913e0a9845bbb6e8260aa9f5c20f~WbISmyGpy1936319363eucas1p2i@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180921131359eucas1p2fd46913e0a9845bbb6e8260aa9f5c20f@eucas1p2.samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list : DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, "open list : OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

OF graph describes USB data lanes between USB-PHY and respective MUIC.
Since graph is present and DWC driver can use it to get extcon, obsolete
extcon property can be removed.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
v3:
 - removed #address-cells/#size-cells from ports node.

Hi Krzysztof,

This is next version of the patch I forgot. I have addressed your comments,
I hope correctly :)

Regards
Andrzej
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index a1e3194b7483..95cbf5f0921d 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -868,6 +868,14 @@
 					};
 				};
 			};
+
+			ports {
+				port {
+					muic_to_usb: endpoint {
+						remote-endpoint = <&usb_to_muic>;
+					};
+				};
+			};
 		};
 
 		regulators {
@@ -1283,12 +1291,17 @@
 
 &usbdrd_dwc3 {
 	dr_mode = "otg";
-	extcon = <&muic>;
 };
 
 &usbdrd30_phy {
 	vbus-supply = <&safeout1_reg>;
 	status = "okay";
+
+	port {
+		usb_to_muic: endpoint {
+			remote-endpoint = <&muic_to_usb>;
+		};
+	};
 };
 
 &xxti {
-- 
2.18.0
