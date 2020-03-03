Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0E7C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CD4521D56
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 00:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Dln004/J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCCAwu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 19:52:50 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:45943 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCCAwu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 19:52:50 -0500
Received: by mail-qk1-f196.google.com with SMTP id z12so1736436qkg.12
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 16:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75lSUcP13Pt67uPW1s5ODO496/f8/lFD2CsoSXYcCLI=;
        b=Dln004/JTr1kxSkJRcH6E3EU0PcjAxhEcCyciMe/Bdk7OD0fsR48DcclIQqOUVZYde
         o+J8G023NZdZN0PA4cSOBu/JX1Idx3qq2ch+MEKOITRfgRL7KUgZziUNJZ0p19+Os7MU
         0LjdnaqWOHzOCGh+7xEnculT8ZZasSzYRMn+5UAvwjIgmKbpF4Om9mPBM67yxi+9FYTA
         iZC/Dh0TEPgoiDU/Hv8zBolIzZtLrJ2sab6a742EuXi8RLzq6hq031vREAHr2RkmMk9+
         y+shsra1aybiF7Q7a4nWj+/sIzxWg5FwFFPZpoLJI1xK5Zkv1uwAoVKTxKnJmMBeQRsa
         LCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=75lSUcP13Pt67uPW1s5ODO496/f8/lFD2CsoSXYcCLI=;
        b=VtIZzbag5sM1D/QII1US/nRkvhoZ0TecX4hwlkTJmbQr8l7xYKGBMJ3UgnWweesCf1
         g/rOac9ggTfbrHvf8gqgUqaW8FxxBLnTJTYJ1T952JcFTAjHFTlWERXQoIb5Iqaz8A/Y
         mqDBWaTSK2Yx95k5l7V7ufoJPKEXqs4rCQUd5f6PScFN/+b8V8hrl2GNoAT83vyneSCg
         J4lDifeaCpk9x61wAHVDhUpIfZgIdOw4Euw4WacZZBcO6AjlKDtF7gNiEFlE0DNYdNDq
         Cwmk8BqDamrbcc3gAH+StDNPUSaZpBkRIlLA7UAAeM8oLUm5RuEa4Jgk78WmUujvF8kc
         mH/A==
X-Gm-Message-State: ANhLgQ1vZRx4PPGW56k7ZmIk3fUrdz6JB/U83QL7I9xWC9XjY22inxpS
        KADvpdWkJqWv0lnKmHPQiRsfy6FlnlGU2m2Y
X-Google-Smtp-Source: ADFU+vscbmNSlKj45OtmQ9oSeaDjGM9mGDrea541vRtHvMJ6q6G/36H7oCgoamUprRx6IQCBQa1Ndw==
X-Received: by 2002:a05:620a:3dc:: with SMTP id r28mr1892959qkm.373.1583196768868;
        Mon, 02 Mar 2020 16:52:48 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id 79sm11182037qkf.129.2020.03.02.16.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 16:52:48 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v5] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
Date:   Mon,  2 Mar 2020 21:52:44 -0300
Message-Id: <20200303005244.13893-1-vitor@massaru.org>
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

