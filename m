Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51AEC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:38:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AF5F227BF
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 13:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE+3Kd1G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbfLLNid (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 08:38:33 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42326 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729405AbfLLNid (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 08:38:33 -0500
Received: by mail-vk1-f195.google.com with SMTP id u123so427869vkb.9
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XPKbrW+GgXfnBsWc7n0t7J3uGHJbpmRlzdz7rtslnHY=;
        b=iE+3Kd1GgBQF3lyW6ramHAzFk+QQ2Q5jORErzDUki4eMcUGwDnDWApNJiRAbJPdw3a
         WikqMtVoswNKSb5VR3Z59b7Q41cBWac2wXGDZOUZYxBKEEESvVFNOLSZDM2L1g/H+Wwe
         unB6M/q/Vy3ePxpxuODUPwuPgCNxQMN/pNcCZzgobOaAyRsebCQjJJVYhb+0/lzegYxo
         hiFq10BMi5/kVn4UWzhjTZwjwTGCmnRMN5FbKN64b5flKNoLlkApk6QADnDp/VRbQlHV
         rGUbSgNnvGfqqitztC0zNNLIpNlPrXrxWWJieDn50ZML6AivK0mcoGNjejrinCYA/gM5
         0Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XPKbrW+GgXfnBsWc7n0t7J3uGHJbpmRlzdz7rtslnHY=;
        b=SzZWEsTQM3kg4/CjOsLakXx4GhXtfa3uY3c8mbzDa7tqpnOfFlVC1XRC3b5snzCWCQ
         /rTBztNZJBWHzTH48kS6xuyx2Qw3JpJ41hUypiVHfb79JunPW3ZlYxsJoORaHE8X1Woh
         9DQB0YxBfpCO9cMAg3gwrongrNgq3B04Rm11Z8SrnlE/e4suB9faUbWA0jxVlurhPtia
         jO2t7kI6N3wfVk8F9A8j3fS/BRWhzwvINNXHnQHJOXiIG8j4mKQI6CEAht4Wr7x/qF7J
         0RsChdShFap9OhjYcZSxzLJcN7xowZe9fDjyjpANkzSnFie7ypGT7PpkSvWT2ilpTE0n
         VwHg==
X-Gm-Message-State: APjAAAXJbFgx6x/2cmhuil4IvvuKH2O9+PO2T7arBL5HErvX/xV8EXAC
        LZGzvkb/IMLW15o02FgkLvA=
X-Google-Smtp-Source: APXvYqxvK61sSavkykq4QNG9tYNWWBNHfyVEwcTu5xdzPBX7Kta9bK6Va01hthPZ/7gCdZhJKO+Pvg==
X-Received: by 2002:a1f:1e13:: with SMTP id e19mr8915993vke.88.1576157912480;
        Thu, 12 Dec 2019 05:38:32 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id 41sm3246132uaf.8.2019.12.12.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 05:38:31 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: imx7: Unify temp-grade and speed-grade nodes
Date:   Thu, 12 Dec 2019 10:38:00 -0300
Message-Id: <20191212133800.17929-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following warning is seen when building with W=1:

arch/arm/boot/dts/imx7s.dtsi:551.39-553.7: Warning (unique_unit_address): /soc/aips-bus@30000000/ocotp-ctrl@30350000/temp-grade@10: duplicate unit-address (also used in node /soc/aips-bus@30000000/ocotp-ctrl@30350000/speed-grade@10)

Since temp-grade and speed-grade point to the same node, replace them by
a single one to avoid the duplicate unit-address warning.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 2 +-
 arch/arm/boot/dts/imx7s.dtsi | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index d8acd7cc7918..92f6d0c2a74f 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -12,7 +12,7 @@
 			clock-frequency = <996000000>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>;
-			nvmem-cells = <&cpu_speed_grade>;
+			nvmem-cells = <&fuse_grade>;
 			nvmem-cell-names = "speed_grade";
 		};
 
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 1b812f4e7453..05d099da5a02 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -152,8 +152,7 @@
 		interrupt-parent = <&gpc>;
 		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 		fsl,tempmon = <&anatop>;
-		nvmem-cells = <&tempmon_calib>,
-			<&tempmon_temp_grade>;
+		nvmem-cells = <&tempmon_calib>,	<&fuse_grade>;
 		nvmem-cell-names = "calib", "temp_grade";
 		clocks = <&clks IMX7D_PLL_SYS_MAIN_CLK>;
 	};
@@ -548,11 +547,7 @@
 					reg = <0x3c 0x4>;
 				};
 
-				tempmon_temp_grade: temp-grade@10 {
-					reg = <0x10 0x4>;
-				};
-
-				cpu_speed_grade: speed-grade@10 {
+				fuse_grade: temp-grade@10 {
 					reg = <0x10 0x4>;
 				};
 			};
-- 
2.17.1

