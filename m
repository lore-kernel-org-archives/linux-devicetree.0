Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:60280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727594AbfAGQFW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 11:05:22 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
Date: Mon,  7 Jan 2019 08:05:12 -0800
Message-Id: <20190107160512.9480-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, "H . Nikolaus Schaller" <hns@goldelico.com>
List-ID: <devicetree@vger.kernel.org>

We're currently getting a warning with make dtbs:

arch/arm/boot/dts/omap3-gta04.dtsi:720.7-727.4: Warning (graph_port):
/ocp@68000000/dss@48050000/encoder@48050c0 0/port: graph node unit
address error, expected "0"

Cc: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -717,7 +717,7 @@
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	port {
+	port@0 {
 		reg = <0>;
 		venc_out: endpoint {
 			remote-endpoint = <&opa_in>;
-- 
2.20.1
