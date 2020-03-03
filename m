Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC04CC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D67E24673
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="EAXXXRg9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCCAqh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 19:46:37 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36931 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCCAqg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 19:46:36 -0500
Received: by mail-qk1-f196.google.com with SMTP id m9so1785984qke.4
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 16:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJzJAEuKHPY6L62lnbjtAROsD95ktjZMnZsb3UGNdoo=;
        b=EAXXXRg9yWE/eu15wdXFiqqdRa8fvC7j6/kiQ+sZ5+8VcUZulKti8KEB12QryZBORD
         qPVfEjioSfSlwMQikCxVTN/PQedu3dYDAnrBbf8RdCzvLZl0erDdcS8qK8occGQEqIM9
         JOxL5KH2n1UfL9ekZ9hDNZflV3kW5hyRkH3rFhw6ALROthslfQW7vWcKmVN6sLQV70po
         +ejYu9Uk99kD7EEOr8xSkDlM1jVYKV4R3gs89mvA/WKrGk33OvPEGewFf5KW4L4bhWOI
         /dmOHA97nBl34b1RwpNzhJmyqUwICIkRL9fN/zGnhdN5dfc6am8LZbY9ce/irTlo97QZ
         0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FJzJAEuKHPY6L62lnbjtAROsD95ktjZMnZsb3UGNdoo=;
        b=XwQddHilUBUNIy1TvBzX6J17Y6eui8CsRq2zIKKyKngGxQB6HcLcRWCRJEvpfvTslI
         yIBWpPYFvaV+RWIpQCUBP50fPQjvrZ3yHPrc5mGfQwArNHIprmlHoz64WV0TI+8AK0M+
         0TiJVrJexzaOGgjnt7YtWsLC4gAiy8UNanOkYL9906IQUpTJnBGaHCnrXj6FT8NcTt0u
         bv7ty+r7TwxZ0371mGglGY5IoXmWDYb669Rx0jHvigtkuo8515tW6XcPV/3oKhjKvj2C
         JZB2cb9OaNHgYTKueuNE0dDRA9LjIZZiBWrRSBN93h/eQLSm4smainduzkWYeHo7xGwr
         Or0A==
X-Gm-Message-State: ANhLgQ0vZFeEYdlLi5+Tw5UtaGt0hYXoOR/Eamv8DLW1x1RSLYd4q1BZ
        Onw2K982MYnqgN0Q9CWUX52AZVodPxDFStvj
X-Google-Smtp-Source: ADFU+vt190SBEdDRnqimw8AigTuE5fSCYYi1HXhNY+pZ3S7DEWJhp2+r7BeEN2P7CAIlnUuqjkLXSQ==
X-Received: by 2002:a05:620a:15cf:: with SMTP id o15mr1899012qkm.140.1583196395553;
        Mon, 02 Mar 2020 16:46:35 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id s139sm7167406qke.70.2020.03.02.16.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 16:46:34 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v4] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
Date:   Mon,  2 Mar 2020 21:46:30 -0300
Message-Id: <20200303004630.13663-1-vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

It was based on Google Source Code for Coral Edge TPU Mendel release:
https://coral.googlesource.com/linux-imx/

It was tested on Coral Dev Board using this command:
  sudo stress --cpu 4 --timeout 3600

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
v2:
 * Fix underscore in property name;
 * Add pinctrl entry for gpio-fan;
 * Removes undocumented property;

v3:
 * Fix subject pattern;
 * Fix order of pinctrl entries;
 * Fix MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 flags;
 * Typo pattern (from "gpiofanp" to "gpiofangrp");
 * Fix tabs on MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 line;

v4:
 * Fix cpu_thermal order;

BR,
Vitor
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 64 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 3f2a489a4ad8..f1fce2b1b5c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -35,6 +35,16 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	fan: gpio-fan {
+		compatible = "gpio-fan";
+		gpio-fan,speed-map = <0 0 8600 1>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+		#cooling-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_fan>;
+		status = "okay";
+	};
 };
 
 &A53_0 {
@@ -53,6 +63,53 @@
 	cpu-supply = <&buck2>;
 };
 
+&cpu_thermal {
+	trips {
+		cpu_alert0: trip0 {
+			temperature = <75000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		cpu_alert1: trip1 {
+			temperature = <80000>;
+			hysteresis = <2000>;
+			type = "passive";
+		};
+
+		cpu_crit0: trip3 {
+			temperature = <90000>;
+			hysteresis = <2000>;
+			type = "critical";
+		};
+
+		fan_toggle0: trip4 {
+			temperature = <65000>;
+			hysteresis = <10000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&cpu_alert0>;
+			cooling-device =
+			<&A53_0 0 1>; /* Exclude highest OPP */
+		};
+
+		map1 {
+			trip = <&cpu_alert1>;
+			cooling-device =
+			<&A53_0 0 2>; /* Exclude two highest OPPs */
+		};
+
+		map4 {
+			trip = <&fan_toggle0>;
+			cooling-device = <&fan 0 1>;
+		};
+	};
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -254,6 +311,12 @@
 };
 
 &iomuxc {
+	pinctrl_gpio_fan: gpiofangrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5			0x16
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
@@ -374,3 +437,4 @@
 		>;
 	};
 };
+
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6a1e83922c71..a3bb17a6b9df 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -198,7 +198,7 @@
 	};
 
 	thermal-zones {
-		cpu-thermal {
+		cpu_thermal: cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <2000>;
 			thermal-sensors = <&tmu 0>;
-- 
2.21.1

