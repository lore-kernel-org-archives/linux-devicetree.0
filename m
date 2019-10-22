Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7024CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 835572064B
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730515AbfJVNiA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:38:00 -0400
Received: from 19.mo7.mail-out.ovh.net ([178.33.251.118]:46572 "EHLO
        19.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388388AbfJVNiA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 09:38:00 -0400
X-Greylist: delayed 776 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 09:37:58 EDT
Received: from player793.ha.ovh.net (unknown [10.108.42.176])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 71E7013895E
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:19:49 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id A5AE2B3E4570;
        Tue, 22 Oct 2019 13:19:35 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Julien Boibessot <julien.boibessot@armadeus.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 9/9] ARM: dts: imx6qdl-apf6dev: use DRM bindings
Date:   Tue, 22 Oct 2019 15:16:55 +0200
Message-Id: <20191022131655.25737-10-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 141018965105529925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Describe the parallel LCD using simple panel driver.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi | 50 ++++++++++++++------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index f617089be9cc..0aae958640db 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -21,33 +21,27 @@
 
 	disp0 {
 		compatible = "fsl,imx-parallel-display";
-		interface-pix-fmt = "bgr666";
 		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_ipu1_disp1>;
-
-		display-timings {
-			lw700 {
-				clock-frequency = <33000033>;
-				hactive = <800>;
-				vactive = <480>;
-				hback-porch = <96>;
-				hfront-porch = <96>;
-				vback-porch = <20>;
-				vfront-porch = <21>;
-				hsync-len = <64>;
-				vsync-len = <4>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				de-active = <1>;
-				pixelclk-active = <1>;
-			};
-		};
+		pinctrl-0 = <&pinctrl_ipu1_disp0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
 
-		port {
 			display_in: endpoint {
 				remote-endpoint = <&ipu1_di0_disp0>;
 			};
 		};
+
+		port@1 {
+			reg = <1>;
+
+			display_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
 	};
 
 	gpio-keys {
@@ -76,6 +70,18 @@
 		};
 	};
 
+	panel {
+		compatible = "armadeus,st0700-adapt";
+		power-supply = <&reg_3p3v>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&display_out>;
+			};
+		};
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "3P3V";
@@ -351,7 +357,7 @@
 		>;
 	};
 
-	pinctrl_ipu1_disp1: ipu1disp1grp {
+	pinctrl_ipu1_disp0: ipu1disp0grp {
 		fsl,pins = <
 			MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK	0x100b1
 			MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15		0x100b1
-- 
2.21.0

