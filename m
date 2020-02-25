Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F654C4BA0F
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 352D72072D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BVDQ4C/j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgBYXqt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 18:46:49 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54846 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729613AbgBYXqt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 18:46:49 -0500
Received: by mail-wm1-f67.google.com with SMTP id z12so1047266wmi.4
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=C1WY7m7LZykVt5uJs3pBqs/4NQKr7Ot6cOn9UjLkSJM=;
        b=BVDQ4C/jc/Pi/GKzSD13nQmRjO8HeGX+aflCA1KgwjNFyVjpjDIv5UflF52DFsWq1/
         NDOz5gjxMrsxX9IBV+cqvew/3ZSPbPtKebTLsk9WSRCflDfc15InF0JDq0356hYv8k5z
         QtOwDSntDwnGv7DS+TMaopRA4TPrvMZkRLg7h1TGwii1xrl/RpAFSdAbs4+YFExicRUB
         GJ72d5vzQomUVzkGZ/HkHvCqzOfyBWyqg4u3nz7KU144qUkfwZsuW1lqkh9MbR+CYFl2
         m8MitwlgbsBk9dubF3gBtadtqm0jYBgGtvG96zaQ435AyRB70Q7eFn1SkbX9k7SY+yLe
         2bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=C1WY7m7LZykVt5uJs3pBqs/4NQKr7Ot6cOn9UjLkSJM=;
        b=rBz5PN0G/rWW1RXYnVxc7k+bSrBLiaviQ4N9SpthYi0jvhbZa+dZ7HaEEq+UC5au63
         h1NIBgy5XWHuYAd7XYLjHZKMD/69ae4waJERNlw7XSZYhUUPVv6SE9ALSB8zohOipmuO
         QC9IG+sBNhltVLBmJgjRbvaazLxP8HJjC/c+FWDK/YuYn68Wq+C3cz+QZiRXLOzKihJu
         aYsoxw7PFeuwOdV3V3fnoMXeKZwliDKgQnUdsWxHnIzXk7IryFseC9mxw7OPcE5HGAds
         PFuoMggSHMeuTzbYyVJ4NX+VIR86/7OYpQ+FkR969ko1GhR/cAuwn7qFMwZ/PBq1mlqi
         R4IA==
X-Gm-Message-State: APjAAAUf/O6iGHS4uU7YAQDfJkfhWGN3XW6/NLEJ3O9W29NndA+tZg+p
        r9+mlmNAGIhQ/eqbj8bAAmGZ6A==
X-Google-Smtp-Source: APXvYqz+VYXFM+4XZeOXyIhjD49lx+yExSB7FEN4yZZIGxqakwdynspTKJ2Yyypuipq9hBmIxa+3Ig==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr1621610wmg.151.1582674405950;
        Tue, 25 Feb 2020 15:46:45 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:45 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 10/15] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Tue, 25 Feb 2020 23:46:06 +0000
Message-Id: <20200225234611.11067-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
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
index 9f31064f2374..d13b5fb5c4d6 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1409,7 +1410,7 @@
 			cpu = <&CPU3>;
 		};
 
-		etm@85c000 {
+		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
 
@@ -1427,7 +1428,7 @@
 			};
 		};
 
-		etm@85d000 {
+		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85d000 0x1000>;
 
@@ -1445,7 +1446,7 @@
 			};
 		};
 
-		etm@85e000 {
+		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85e000 0x1000>;
 
@@ -1463,7 +1464,7 @@
 			};
 		};
 
-		etm@85f000 {
+		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85f000 0x1000>;
 
@@ -1481,6 +1482,82 @@
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

