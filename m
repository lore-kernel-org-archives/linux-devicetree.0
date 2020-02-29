Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E0C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 10:43:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0955246A3
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 10:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="1EMgyUrZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgB2Knz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 05:43:55 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37702 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgB2Kny (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 29 Feb 2020 05:43:54 -0500
Received: by mail-qk1-f193.google.com with SMTP id m9so5562320qke.4
        for <devicetree@vger.kernel.org>; Sat, 29 Feb 2020 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWLh3cGNIdtmam3OU5Dca7rYeIjQy825G41ll9rpNfc=;
        b=1EMgyUrZE/3eoHr19mlRudElQgXg3GyTeFmnUg2jKH/9lOE8A2LdAQFKDLQSULVbp8
         i32HSDCeXR27luc1aSM27riRvQvW9J7cFC3/LBQeONwnuyo/1iZtgA1rkF/oINU/L/SN
         ZBYth62kfJUwYsyOYMEMb84l36Ya8H2sw830g8Y58qM2U427A/8XhzdcPIAP1sYx4dWK
         QlvWDCfmRjYIXkCX9FU62uH7EF4Z/QCQSn+HtT324B42EpzQn1DwGuuq6WS8UpZeixE3
         Sz/CSMeJG7IS5Ys7v801rrhea6xGiQutfawP3um4149+cAG/BfBlR7lQ5eFXhxiP+2Po
         xNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWLh3cGNIdtmam3OU5Dca7rYeIjQy825G41ll9rpNfc=;
        b=ig70osmVL8BMOjHjIkGMzzmDHzUjOBaXRticZUiuAcPfWhacyJP2n6g84knhBPR43a
         Tilw3tcmzAp+awPeB0TLpRJYwVJyXb4jDU7egNZgu9TI4Kj8BqNVmk13v6YFuW5CUF45
         +LMn6+7LeUO/Plj+x3FWb/5EJsKFv/slNew7FC2ZTQHbs8w1V2MNmWIfq9XdYM7ZRRSs
         XWNpoBAHEXZ9F2wJ90tzeSv03h4cBzA1RFSCLmEIt0V/vJvwxAZOyTeJNaBcLdDweLtj
         bHIyY9TwP2OOd7d9YaMSn9SIIAnUonXRhLfRnAqaxjbvMd9Y7IMAQQeuQ+8KKE5HIfED
         eQyQ==
X-Gm-Message-State: APjAAAUUw/YUGh2BPnz0mcKfw3i7xkDu8I5+eyLAkPU/gd5DHJxkMUxd
        5tY7FnyTN+YrEXKp3D8RNbhfgGXjJNfzJw==
X-Google-Smtp-Source: APXvYqzKSpOtCuGl13wtVyIl+A2uueLeUiyltEAJsnTd8/rg0gyfETvajHr+CRxRePNxGXOCXGTTHQ==
X-Received: by 2002:a37:9181:: with SMTP id t123mr8094431qkd.230.1582973031766;
        Sat, 29 Feb 2020 02:43:51 -0800 (PST)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id t6sm6737843qke.57.2020.02.29.02.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Feb 2020 02:43:51 -0800 (PST)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, marco.franchi@nxp.com,
        linux-imx@nxp.com, lkcamp@lists.libreplanetbr.org
Subject: [PATCH] arm64: dts: freescale: add gpio-fan/thermal support for Google i.MX 8MQ Phanbell
Date:   Sat, 29 Feb 2020 07:43:47 -0300
Message-Id: <20200229104347.11126-1-vitor@massaru.org>
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
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 78 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  2 +-
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 3f2a489a4ad8..fb9f208d1e41 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -35,6 +35,14 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	fan: gpio_fan {
+		compatible = "gpio-fan";
+		gpio-fan,speed-map = <0 0 8600 1>;
+		gpios = <&gpio3 5 GPIO_ACTIVE_HIGH>;
+		#cooling-cells = <2>;
+		status = "okay";
+	};
 };
 
 &A53_0 {
@@ -374,3 +382,73 @@
 		>;
 	};
 };
+
+&tmu {
+	throttle-cfgs {
+		throttle_devfreq: devfreq {
+			throttle,max_state = <2>;
+			#cooling-cells = <2>;
+		};
+	};
+};
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
+		cpu_alert2: trip2 {
+			temperature = <85000>;
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
+			<&throttle_devfreq 0 1>, /* 1/2 GPU Clock */
+			<&A53_0 0 1>; /* Exclude highest OPP */
+		};
+
+		map1 {
+			trip = <&cpu_alert1>;
+			cooling-device =
+			<&A53_0 0 2>; /* Exclude two highest OPPs */
+		};
+
+		map2 {
+			trip = <&cpu_alert2>;
+			cooling-device =
+			<&throttle_devfreq 0 2>; /* Min GPU Clock, disable CPU2/3 */
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

