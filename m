Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8A0C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 00:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D487524697
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 00:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="carO0kFs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgCBAL5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 1 Mar 2020 19:11:57 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41899 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgCBAL5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 1 Mar 2020 19:11:57 -0500
Received: by mail-qk1-f194.google.com with SMTP id b5so8491258qkh.8
        for <devicetree@vger.kernel.org>; Sun, 01 Mar 2020 16:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/YCjZ1oaKRZgdjhxl8DLn+nRy9DD18mNfW/zomwFzE=;
        b=carO0kFs1H4HE9z1tt2Yn3Llcx8sXHWgu5rJipogdsli2uizchBvU9ydf+1yIw0U6v
         TWQX65v4oKXz2HMztMrBG0qDyINAkfqwHMP1ELbl2rfBOAcyCXVJ9PWgXioNq1G093n/
         ieXrYGXG1eB2G/RR66betZPBripGPC0rjJPwLWFHDx15AEr9WO3UHafFLhHLAYBWXky/
         NbPSlUCy7vKAbC88dlDfnWd9uFqrSQgCgAKCXZDeFspnznj560BIkUBGKNjF0AOfqYPD
         +dyJi0/wrT+tvMKe+OvuaIEvrHqJl83v1crOZMRW3DT6jkpvu3t0SBMcZ5AeRPLAMVDO
         iihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/YCjZ1oaKRZgdjhxl8DLn+nRy9DD18mNfW/zomwFzE=;
        b=TbD1aEigfkKR4rNfTMmRYYECkosi5hQB9oxJS870ggTjVttFaGLOERkEPquo7MUkAX
         oFpz72Trqscemx+eFANHoUoAS83KtBx/uKlrwx3sUUGFV1yR0t76PT312gKEZiJwjF3d
         dQUx0zKWoAdPmcdJtZdws8HUK5PWTDxGhIwesEeuejFwNFqpP9aD+0zN0Mbd5KHFOty5
         Pc/a0eJF6zsWP6RnPcb1RD8YlyxBy713SCsJcU+yhnW/EVgChjTT44jknIdgSDTVBe8i
         VYALpXNOfgEzRkbHCx1SeD/H1tdzuqIvDDpOVobc2qsUCw+wb3bIuiVrFdNfyR+vru/Q
         JrsQ==
X-Gm-Message-State: APjAAAWhzjaKeCGzEPNLr0vsOi+/abURvH9q7RKhPLomQ/SfzcHBFHeV
        Hb08g/yGNq2YPrZsks/ynReB2vpZnqwA8JAH
X-Google-Smtp-Source: APXvYqx6If6whTCbu1kaCgR0TRrpOFIWdC6fmEUBVEcHG8zBm14f496mkUEMnQZ/aYydOZrT1VUKcw==
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr14087296qki.331.1583107915740;
        Sun, 01 Mar 2020 16:11:55 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id l16sm4921372qke.68.2020.03.01.16.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 16:11:55 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH v2] arm64: dts: freescale: add gpio-fan/thermal support for Google i.MX 8MQ Phanbell
Date:   Sun,  1 Mar 2020 21:11:49 -0300
Message-Id: <20200302001150.27952-1-vitor@massaru.org>
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
 * Removes undocumented property.

BR,
Vitor
---
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 64 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 3f2a489a4ad8..3302e5c127ca 100644
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
@@ -373,4 +383,58 @@
 			MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B 0xc6
 		>;
 	};
+
+	pinctrl_gpio_fan: gpiofanp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5 0x01
+		>;
+	};
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

