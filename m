Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A52CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E68E9218AE
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbfJVNyj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:54:39 -0400
Received: from 5.mo1.mail-out.ovh.net ([178.33.45.107]:39640 "EHLO
        5.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbfJVNyj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 09:54:39 -0400
X-Greylist: delayed 1800 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 09:54:38 EDT
Received: from player793.ha.ovh.net (unknown [10.108.42.192])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id 2C8B51952CF
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:19:22 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id 4DA2BB3E4403;
        Tue, 22 Oct 2019 13:19:08 +0000 (UTC)
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
Subject: [PATCH 7/9] ARM: dts: imx6qdl-apf6dev: rename usb-h1-vbus regulator to 5V
Date:   Tue, 22 Oct 2019 15:16:53 +0200
Message-Id: <20191022131655.25737-8-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 133419140173681733
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This regulator supplies other devices and not only usb host1 so
rename it.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index 331d55ae9ac9..9067355d8541 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -74,11 +74,12 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_5v>;
 	};
 
-	reg_usbh1_vbus: regulator-usb-h1-vbus {
+	reg_5v: regulator-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "usb_h1_vbus";
+		regulator-name = "5V";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -123,6 +124,7 @@
 &can2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
+	xceiver-supply = <&reg_5v>;
 	status = "okay";
 };
 
@@ -223,7 +225,7 @@
 };
 
 &usbh1 {
-	vbus-supply = <&reg_usbh1_vbus>;
+	vbus-supply = <&reg_5v>;
 	phy_type = "utmi";
 	status = "okay";
 };
-- 
2.21.0

