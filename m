Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8BFC35DF5
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A5DB218AC
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 08:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SekV8AVX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgBYIJr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 03:09:47 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39392 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbgBYIJq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 03:09:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so5163760plp.6
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 00:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GMndQt2LnEzHjp6exHJ3T1kYTJRoFEg9wZ1HqA6gkQ=;
        b=SekV8AVX6D+Htv0APvQ/2D+MFX2epnEwFRcP84WiMctH3PKMmMv3J7li3o6RdTIYQy
         7G+7xHWlBDJYSHCbl0SaHksode9OJULFyaTJvq+71L4aY4H8UIyLkxaNqd1w0I2huZIg
         Ghr6tkjBcWxetOGM/b7t2weEV1nrXLOgV+SQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GMndQt2LnEzHjp6exHJ3T1kYTJRoFEg9wZ1HqA6gkQ=;
        b=rRzrQ3BVy8fDlM6TZoQwajnd87Ojx+Fz19z+VHwLEM3XuCbY7d5PRZJEgqiYOD2UUs
         PGt45uUGOyxJz2OZ8Kuy3Av+WiVWAZSSa1LTrSbrt9LlSFJnPpiM0Zh2gx0kXyO6DSZc
         fn50gu3RnJs+uobAZJHG/NJdBaI9kvgyWwiKef02c8lZBQmgqXhOC77DVESIxgweYPAO
         h70B7cjXrHzGS8flfqP/q20w+KR+OnrQMFZ1ti1yIv8SdM/AOwyMqQSi8A3VFGPJIiLv
         ZvkmhFN+srV7nSeOVoV/Pa+JFYoKv1StWfiBAwOI3giTVZMbVCglUIEGjfUEvcS0bDD2
         cjjA==
X-Gm-Message-State: APjAAAUyzk109vMk1Re3OiCekgtN6x38cdOUI582MuupOXSWxav3KCWi
        rzNQW261x9+oCnQdsmhb4QeaOA==
X-Google-Smtp-Source: APXvYqyHkDcXeUanCiEXGA0ZJYMMwDV4rYcjrFNFdPbqYec8VEXM5eZDYZphfwlSJ62fbCzN6dUrFg==
X-Received: by 2002:a17:90a:5d97:: with SMTP id t23mr3732775pji.61.1582618186124;
        Tue, 25 Feb 2020 00:09:46 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id c26sm16071506pfj.8.2020.02.25.00.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 00:09:45 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-mediatek@lists.infradead.org,
        James Liao <jamesjj.liao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, hsinyi@chromium.org,
        drinkcat@chromium.org, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH] arm64: dts: mt8183: adjust cpuidle target residency
Date:   Tue, 25 Feb 2020 16:07:53 +0800
Message-Id: <20200225080752.200952-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Split a cluster level cpuidle state into two, so mt8183 variant
boards can adjust parameters for each cluster, and reduce cluster0's
default target residency to 1000us as power measurements showed that
its minimum residency is slightly less than cluster1's 1300us.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 ++++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f1381e77918b..5c7dd262eaf3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -74,7 +74,7 @@ cpu0: cpu@0 {
 			reg = <0x000>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu1: cpu@1 {
@@ -83,7 +83,7 @@ cpu1: cpu@1 {
 			reg = <0x001>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu2: cpu@2 {
@@ -92,7 +92,7 @@ cpu2: cpu@2 {
 			reg = <0x002>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,7 +101,7 @@ cpu3: cpu@3 {
 			reg = <0x003>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu4: cpu@100 {
@@ -110,7 +110,7 @@ cpu4: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu5: cpu@101 {
@@ -119,7 +119,7 @@ cpu5: cpu@101 {
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu6: cpu@102 {
@@ -128,7 +128,7 @@ cpu6: cpu@102 {
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu7: cpu@103 {
@@ -137,7 +137,7 @@ cpu7: cpu@103 {
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		idle-states {
@@ -152,7 +152,15 @@ CPU_SLEEP: cpu-sleep {
 				min-residency-us = <800>;
 			};
 
-			CLUSTER_SLEEP: cluster-sleep {
+			CLUSTER_SLEEP0: cluster-sleep@0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <250>;
+				exit-latency-us = <400>;
+				min-residency-us = <1000>;
+			};
+			CLUSTER_SLEEP1: cluster-sleep@1 {
 				compatible = "arm,idle-state";
 				local-timer-stop;
 				arm,psci-suspend-param = <0x01010001>;
-- 
2.25.0.265.gbab2e86ba0-goog

