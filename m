Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7139BC2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4686B2187F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IrSmm8TV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbgBNJWx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 04:22:53 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54642 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgBNJWw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 04:22:52 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E9Mg3w113503;
        Fri, 14 Feb 2020 03:22:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581672162;
        bh=pIyaS5ys8ohp+Z+ExkY5QFJRkuhfYRBSJTMw3mE1fgs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IrSmm8TVtrW84YYCRBXCTPEbgbQOSYNyE3oZNGJ2WfIvu4VgAZiobdbCoXXJlSyIN
         ExB3loQb5rDxuSLHdEgWMMHw3xVZr4Fi0liwlEJeLPTb9pLwT85lnX2cqKXl4uHa41
         pucLrFhGSTBG3DPwpUByzUcQeRbi0tyvBCclv4oc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E9MgcK026731
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 03:22:42 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 03:22:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 03:22:41 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MJj8086345;
        Fri, 14 Feb 2020 03:22:30 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <praneeth@ti.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH resend 2/2] ARM: dts: keystone-k2g-evm: add HDMI video support
Date:   Fri, 14 Feb 2020 11:22:15 +0200
Message-ID: <f6f51177e44a36db2ba9f3411ee26db387c38e2f.1581671951.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581671951.git.jsarha@ti.com>
References: <cover.1581671951.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT nodes for HDMI video support for K2G EVM. The HDMI uses SiI9022
DPI as HDMI encoder. The DSS DPI is connected to SiI9022 HDMI
encoder's video input and encoder's output goes to HDMI connector.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index b7f10bf94576..db640bab8c1d 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -45,6 +45,19 @@
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 	};
+
+	hdmi: connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&sii9022_out>;
+			};
+		};
+	};
 };
 
 &k2g_pinctrl {
@@ -89,6 +102,13 @@
 		>;
 	};
 
+	i2c1_pins: pinmux_i2c1_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1384) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c1_scl.i2c1_scl */
+			K2G_CORE_IOPAD(0x1388) (BUFFER_CLASS_B | PIN_PULLUP | MUX_MODE0)	/* i2c1_sda.i2c1_sda */
+		>;
+	};
+
 	ecap0_pins: ecap0_pins {
 		pinctrl-single,pins = <
 			K2G_CORE_IOPAD(0x1374) (BUFFER_CLASS_B | MUX_MODE4)	/* pr1_mdio_data.ecap0_in_apwm0_out */
@@ -160,6 +180,40 @@
 			K2G_CORE_IOPAD(0x1188) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0)	/* MDIO_DATA.MDIO_DATA */
 		>;
 	};
+
+	vout_pins: pinmux_vout_pins {
+		pinctrl-single,pins = <
+			K2G_CORE_IOPAD(0x1078) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata23.dssdata23 */
+			K2G_CORE_IOPAD(0x107c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata22.dssdata22 */
+			K2G_CORE_IOPAD(0x1080) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata21.dssdata21 */
+			K2G_CORE_IOPAD(0x1084) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata20.dssdata20 */
+			K2G_CORE_IOPAD(0x1088) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata19.dssdata19 */
+			K2G_CORE_IOPAD(0x108c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata18.dssdata18 */
+			K2G_CORE_IOPAD(0x1090) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata17.dssdata17 */
+			K2G_CORE_IOPAD(0x1094) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata16.dssdata16 */
+			K2G_CORE_IOPAD(0x1098) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata15.dssdata15 */
+			K2G_CORE_IOPAD(0x109c) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata14.dssdata14 */
+			K2G_CORE_IOPAD(0x10a0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata13.dssdata13 */
+			K2G_CORE_IOPAD(0x10a4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata12.dssdata12 */
+			K2G_CORE_IOPAD(0x10a8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata11.dssdata11 */
+			K2G_CORE_IOPAD(0x10ac) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata10.dssdata10 */
+			K2G_CORE_IOPAD(0x10b0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata9.dssdata9 */
+			K2G_CORE_IOPAD(0x10b4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata8.dssdata8 */
+			K2G_CORE_IOPAD(0x10b8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata7.dssdata7 */
+			K2G_CORE_IOPAD(0x10bc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata6.dssdata6 */
+			K2G_CORE_IOPAD(0x10c0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata5.dssdata5 */
+			K2G_CORE_IOPAD(0x10c4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata4.dssdata4 */
+			K2G_CORE_IOPAD(0x10c8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata3.dssdata3 */
+			K2G_CORE_IOPAD(0x10cc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata2.dssdata2 */
+			K2G_CORE_IOPAD(0x10d0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata1.dssdata1 */
+			K2G_CORE_IOPAD(0x10d4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssdata0.dssdata0 */
+			K2G_CORE_IOPAD(0x10d8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssvsync.dssvsync */
+			K2G_CORE_IOPAD(0x10dc) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dsshsync.dsshsync */
+			K2G_CORE_IOPAD(0x10e0) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dsspclk.dsspclk */
+			K2G_CORE_IOPAD(0x10e4) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssde.dssde */
+			K2G_CORE_IOPAD(0x10e8) (BUFFER_CLASS_B | PULL_DISABLE | MUX_MODE0) /* dssfid.dssfid */
+		>;
+	};
 };
 
 &uart0 {
@@ -357,3 +411,50 @@
 	pinctrl-0 = <&emac_pins>;
 	status = "okay";
 };
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+	clock-frequency = <400000>;
+
+	sii9022: sii9022@3b {
+		#sound-dai-cells = <0>;
+		compatible = "sil,sii9022";
+		reg = <0x3b>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sii9022_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				sii9022_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	pinctrl-names = "default";
+	pinctrl-0 = <&vout_pins>;
+	status = "ok";
+
+	port {
+		dpi_out: endpoint {
+			remote-endpoint = <&sii9022_in>;
+			data-lines = <24>;
+		};
+	};
+};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

