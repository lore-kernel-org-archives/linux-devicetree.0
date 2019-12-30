Return-Path: <SRS0=2Mri=2U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03130C2D0C2
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C77F2206DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Dec 2019 16:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ue9Dh2bN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfL3QnQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Dec 2019 11:43:16 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45074 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfL3QnQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Dec 2019 11:43:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so33131298wrj.12
        for <devicetree@vger.kernel.org>; Mon, 30 Dec 2019 08:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YB3f30pJRu3JULH7XG/mWzUNFJ0TPVlsc2Y5J8rGS1s=;
        b=Ue9Dh2bNnHoL9o8EcVY3qR9lIVVycoMC1u1NtH9SFNUioxB6SkJz3IKPMgaCQ/UAkt
         0vMGRXrHWGGj2mRu9BhayYSw4X2/dkWxRAvSMi8vfzZpFyPBdLq3+Lkxlke1j/apaCN5
         3YTqtO94MKtRyOAY00LlN6rok4TvaCzWCMRjuh99uUmQmWhucbhqQ2mRUoAzIWkeFN7f
         r+GLhAcRUhSSXY51YjweNm7dFxMnIEWm+9t3t60t8PDJRJhgjEkoT3idhOoP753tQWCJ
         IfI947cQ3mzLdkwDy0YYQa39vg8GFJ8zDshhST0tF8ICm8khyPlHC5dpi4TB1lv5/rff
         1J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YB3f30pJRu3JULH7XG/mWzUNFJ0TPVlsc2Y5J8rGS1s=;
        b=FJ9vENfG2bRh2glqruU94rJeCz9X7C2HNgmIGOTGSPjzxYQFnoYe2UXDpAmWmJeX+y
         Huzbn/SWLlEbYfk6KjCBCGQo4APXnEN9dcZtBdcf4tKjZzgPqHwY4vqjGDula4UmbYXi
         DobSql8YOUrKrkp0izMOrHkwVl+gny8qwd2wBKff1Iww+McOEIB6wxcU1a54CcZxm5wP
         BpXz8gphiteAyebgTHf7Sl50Bp8P8N15/9NU2iDVQwV+WhifFJz42Aq4smhM7WWfkDEQ
         OmhwmzgFurlbsULb27oUOico1ZEv1n7dQXxDUcIxURkTRuTMZccouXFnxI89+GuU5wyE
         JSyw==
X-Gm-Message-State: APjAAAU4Plm66weCTfV4ghsWDb8Fgua1lx+QNOuEOxVNEohDNsrTE6Hq
        5yxx2b/9DGGsqaQ1JnLvCm91xw==
X-Google-Smtp-Source: APXvYqyditLM4czt6DXltQROybhVhYPGdF3xp/LxygA3E4yhhkZTRYqMwvzcOg1NkjI3oh5TgzYlTg==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr70947710wro.105.1577724193953;
        Mon, 30 Dec 2019 08:43:13 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g25sm344901wmh.3.2019.12.30.08.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:43:13 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 10/15] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Mon, 30 Dec 2019 16:43:06 +0000
Message-Id: <20191230164306.28259-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230164306.28259-1-mike.leach@linaro.org>
References: <20191230164306.28259-1-mike.leach@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
(Dragonboard DB410C).
System CTIs 2-11 are omitted as no information available at present.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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

