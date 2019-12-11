Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F87C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD5752073D
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 23:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzgLuY1q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfLKXJI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 18:09:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42987 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLKXJI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 18:09:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so497091wro.9
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3xQ5hPAFKzWM3fXARbGtC1d78GhAfc9hvN3EgXVObjE=;
        b=kzgLuY1q5wvKV+L/pkheyq78HxWN0J07IxRVHhd3d8LqFt2ppaN4K2wZBCFu6b7qpy
         4Q0SjLpYqDDEa41BA/8NeIFBf2+9iKb/shT1eKfEHbEv9vEbgwCMbx/ZQhAy0e9x6SNV
         3r4CLWMeGho0w7xCe6ShEB8zsAUlQew5ymU0CBz6A2UEavmbKWul4iGl8OEfUru9+Lcv
         uDE846DT+ovt7Ovs0OWONNKlvIUthBz4e/9B49JLYlicUVn58NeY+IKJs+4smviO7peJ
         C7q3JsLhH6kM08c6F7yWzOAYCHtyiZGK4rzDtNi7gEdBzDb+xffv5AVrwjiyUBwx3cpD
         BNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3xQ5hPAFKzWM3fXARbGtC1d78GhAfc9hvN3EgXVObjE=;
        b=pJ9h0V7udN+3QVgl/6594yKX54p6L68rc3hv6S/pZQJ71RlxPxjvMkh34wUcvXwUyd
         TBg4LXU9tfHs/hmUTTb9D7CW2c5+nXC7G/DfnaQ0QdTdd1bjx8lK9HF0TidfSvihKk2D
         2cBIM5rOdsF4e4dMTgMxto5mm1nib99DzghNyqDi8C7E7cxlv3pupHk4YExQa5F2NYAR
         gL6qVAFhZgJgw968tXmogQ65qNewMzTYQxyalp0YyYYos/IM6hu1kMDUPuE7EEDbL+sV
         JluaP+HaBLq8cJxxLCjXtT3QfVTWU5XDxlqUTkc97Vaz/8UaTmrCQ8OuhsgavNk5XzxR
         R/Kw==
X-Gm-Message-State: APjAAAUANGwU60pPPEJ6mI1ej1MOwnOUyTeXJRAoBdwvJvGNnTdrWQsK
        ZUjCwOno8gDQAbDp0v7mKVl80A==
X-Google-Smtp-Source: APXvYqzRP7gAc3F4ZrWNyScIFh3oBby9NpO2X9RZtjXnwMPmoQPKox/Vo2rBqFs29Ph2QaldAeGTHQ==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr2446243wru.350.1576105746121;
        Wed, 11 Dec 2019 15:09:06 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:140f:3f8d:647c:49b0])
        by smtp.gmail.com with ESMTPSA id 4sm3921260wmg.22.2019.12.11.15.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 15:09:05 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        robh+dt@kernel.org, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
Subject: [PATCH v6 10/15] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Wed, 11 Dec 2019 23:09:02 +0000
Message-Id: <20191211230902.5414-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
(Dragonboard DB410C).
System CTIs 2-11 are omitted as no information available at present.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e101905c..68587968f5c0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1357,7 +1358,7 @@
 			cpu = <&CPU3>;
 		};
 
-		etm@85c000 {
+		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
 
@@ -1375,7 +1376,7 @@
 			};
 		};
 
-		etm@85d000 {
+		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85d000 0x1000>;
 
@@ -1393,7 +1394,7 @@
 			};
 		};
 
-		etm@85e000 {
+		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85e000 0x1000>;
 
@@ -1411,7 +1412,7 @@
 			};
 		};
 
-		etm@85f000 {
+		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85f000 0x1000>;
 
@@ -1429,6 +1430,82 @@
 			};
 		};
 
+		/* System CTIs */
+		/* CTI 0 - TMC connections */
+		cti@810000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x810000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTI 1 - TPIU connections */
+		cti@811000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x811000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+		};
+
+		/* CTIs 2-11 - no information - not instantiated */
+
+		/* Core CTIs; CTIs 12-15 */
+		/* CTI - CPU-0 */
+		cti@858000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x858000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU0>;
+			arm,cs-dev-assoc = <&etm0>;
+
+		};
+
+		/* CTI - CPU-1 */
+		cti@859000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x859000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU1>;
+			arm,cs-dev-assoc = <&etm1>;
+		};
+
+		/* CTI - CPU-2 */
+		cti@85a000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x85a000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU2>;
+			arm,cs-dev-assoc = <&etm2>;
+		};
+
+		/* CTI - CPU-3 */
+		cti@85b000 {
+			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+				     "arm,primecell";
+			reg = <0x85b000 0x1000>;
+
+			clocks = <&rpmcc RPM_QDSS_CLK>;
+			clock-names = "apb_pclk";
+
+			cpu = <&CPU3>;
+			arm,cs-dev-assoc = <&etm3>;
+		};
+
+
 		venus: video-codec@1d00000 {
 			compatible = "qcom,msm8916-venus";
 			reg = <0x01d00000 0xff000>;
-- 
2.17.1

