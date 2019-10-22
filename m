Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F65CA9EB9
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5D89222D1
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387979AbfJVNfD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:35:03 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:52690 "EHLO
        6.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388000AbfJVNfC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 09:35:02 -0400
Received: from player793.ha.ovh.net (unknown [10.109.160.54])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id 0B18B146378
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:18:52 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id 6FF1CB3E4182;
        Tue, 22 Oct 2019 13:18:38 +0000 (UTC)
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
Subject: [PATCH 5/9] ARM: dts: imx6qdl-apf6: fix WiFi
Date:   Tue, 22 Oct 2019 15:16:51 +0200
Message-Id: <20191022131655.25737-6-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 124974891696215109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These changes make the WiFi on the APF6 board work again.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6.dtsi b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
index c99e764a25b7..997d685ecc98 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
@@ -5,6 +5,24 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		vin-supply = <&reg_3p3v>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <15>;
+		power-off-delay-us = <70>;
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_enet>;
@@ -40,6 +58,12 @@
 &usdhc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc1>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	cap-power-off-card;
+	keep-power-in-suspend;
 	non-removable;
 	status = "okay";
 
@@ -106,8 +130,8 @@
 			MX6QDL_PAD_SD1_DAT1__SD1_DATA1	0x17059
 			MX6QDL_PAD_SD1_DAT2__SD1_DATA2	0x17059
 			MX6QDL_PAD_SD1_DAT3__SD1_DATA3	0x17059
-			MX6QDL_PAD_SD4_DAT0__GPIO2_IO08	0x1b0b0 /* WL_EN */
-			MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x1b0b0 /* WL_IRQ */
+			MX6QDL_PAD_SD4_DAT0__GPIO2_IO08	0x130b0 /* WL_EN */
+			MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x130b0 /* WL_IRQ */
 		>;
 	};
 
-- 
2.21.0

