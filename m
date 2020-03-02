Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F006C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3489214DB
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 21:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="v1NVxwUh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgCBVgD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 16:36:03 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38643 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCBVgD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 16:36:03 -0500
Received: by mail-qt1-f194.google.com with SMTP id e20so1235976qto.5
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 13:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9MdSe3Cp1lK2gG7CSugFJQzL+Ftzyoa9ZuWFdMMRyU=;
        b=v1NVxwUhDEc9KuoY0dQgfwrrdS+ySgl/dlgzB0wKwecXQH50HdSVu3ak9BFzS+kKV9
         EKpyy5eE/2OnF03JnYiaQDgusRCKsOTcXNS2NTw5DTPiXWO2ZYI/pNs2V9f6OdfdtONL
         qkc17l4+XYYOEV51IBBoFKt1AfmdfnG5PPBd+FchacXw8vr2QFFRsQBpWMhn5EvuCQzj
         bbCyt6KSX78myxtdU4DytNRUBBavvwpG5/kPhvpjXxsw4uHL6PcTO6C6QjZgPL8uOXgr
         F2+OyrRCa0TKT32QfPyyXq13lD7fCj/AW7WYozx5DwikeowcAId7mBl0VZtNek/QJWaH
         fm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r9MdSe3Cp1lK2gG7CSugFJQzL+Ftzyoa9ZuWFdMMRyU=;
        b=KbFJrjk02ZaYh5Z6JPGdRH8Q0qD5OMNlIBkLBKICIlEl2wimicFGZRBCRjXiwn0Dim
         ZQNyv/q7Dv2/kPl+An+itp1OyZEqZCeER9mENKbkMprKKw8DWmt4rfBCI9XepFNtIyQ+
         q8crbVZ3MpqT5HAsE8Ar/lFsvtE+BU5loSWV2+4YmOiWlAENgqQMf0rx0PdKbfkoUp4q
         jmBJWpEL0lrd/ZUdCWRpjZx8dXHZi1VUrAQXQcQjED8BNJiqj1UBSXn1SYthgsAxxzSO
         Mld9Lq3efAwHwMcIQBuw9+rBoC9njysBXJmeg3Pveb4mvA5/p+RN9U1R0ql7S+feraD+
         6GFw==
X-Gm-Message-State: ANhLgQ2BDLdkoJKg3zCLQZQpFV5DP5E0Fp4oElAs28jp6jh2nc20RvuJ
        uikwUFb66tSzo4kAp6JDuS3GITam5Yt/LCnZ
X-Google-Smtp-Source: ADFU+vvXTcOclxCW7n8FPaNrlZeCSsnViuh2KdNCzSYQltwtpBLHuD8NYy/7EiI4MQzpeYFg25dwsw==
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr1510643qtu.213.1583184961902;
        Mon, 02 Mar 2020 13:36:01 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id b5sm1378122qkk.16.2020.03.02.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 13:36:01 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v3] arm64: dts: imx8mq-phanbell: Add gpio-fan/thermal support
Date:   Mon,  2 Mar 2020 18:35:57 -0300
Message-Id: <20200302213557.11128-1-vitor@massaru.org>
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

BR,
Vitor
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 64 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 3f2a489a4ad8..e20032110e0e 100644
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
@@ -254,6 +264,12 @@
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
@@ -374,3 +390,51 @@
 		>;
 	};
 };
+
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

