Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF13C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 01:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 780AC2465E
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 01:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="umYklWYh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCCBPX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 20:15:23 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:36514 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCCBPW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 20:15:22 -0500
Received: by mail-qv1-f65.google.com with SMTP id r15so948408qve.3
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 17:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWljvu1Z0h+Ls6IHlbxUmdvdlpex8c5qLQ1lV9V+EAk=;
        b=umYklWYhe3xxKSCtXJYUkBktabKrCZvJ2LLPSATs301AsMO71sXYHDC2M2CUE2lYfq
         3C4cJMDyMOddPZ0jzCTWVI7+ERR7T4EZHM4FPXx986Mhi7CwoWfkad7BUEUH/lxdHJvq
         x84qts05ldxkdfmvhQ7+vyYidA7Zm302EPtBT/TPOr7iFbCPdmmm1Za8g0V1LGrF10fB
         KW/SoK7iGvMy9bdrHj3CAcsB8iRO5gFu7wXxaBIRo351KY2qoinwIFcrkdOZ8W/xVvDL
         FBvZCrMYVe35StQwNZchnLHMDwmShZTJB0jWt2ByqhgKNp62kh1I6r+i7rwPoj47mFqn
         /bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWljvu1Z0h+Ls6IHlbxUmdvdlpex8c5qLQ1lV9V+EAk=;
        b=aKLUV5aiPYxenq1EcnlMAxAbejzePnsgkfuCo5HXy6rSXGAns2rn5c7A+dQ2qlTh0c
         R1zaQVqZ0wxUz5JzXXV2oc9FUp0QtQ3YEhJ0YQQpSpAsQeT/+UBaKwM1Nj5V2M9oe+Nr
         QUXk9kNGB8pp/xLZoHBg9nKRzvJK8PaSft/GQqJVEAbpOGeuztecpwlRrk2ihK5UBfoI
         0wVWrFZzpS443vSHK9SkgJfR6bfwSczO5LYBY7mjtXrV6TGWvCBpDwtnf1TBPIKT2AtG
         ToKsSVEqLm7Y6uLIXQcqxAmGmPlBOD5asgJBpbxRw77jIK0XATIPAa2Kyn1w/ibyJ/Bk
         2KMg==
X-Gm-Message-State: ANhLgQ2dgasKzb3YooEGtS60363pV8Myoja+SLcMUZeO2W6olNihyaBg
        7BnBhmjHYBIR4FKIr2LgGLgvQZZ1ok2/rRjX
X-Google-Smtp-Source: ADFU+vsmXxQ0YjxEkyQxVibbF9pItS1rT2buTUlHOOEt1BdiFeJEBc2oROy/hYScVJb68Kaz/UT1jg==
X-Received: by 2002:ad4:474f:: with SMTP id c15mr2079042qvx.52.1583198121446;
        Mon, 02 Mar 2020 17:15:21 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id o7sm11105460qkd.119.2020.03.02.17.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 17:15:20 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v6] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
Date:   Mon,  2 Mar 2020 22:15:16 -0300
Message-Id: <20200303011516.14946-1-vitor@massaru.org>
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
Reviewed-by: Fabio Estevam <festevam@gmail.com>
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

v5:
 * Add missing Reviewed-by;

v6:
 * Removes unneeded blank line;

BR,
Vitor
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 63 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 3f2a489a4ad8..0ff100f3f8f0 100644
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

