Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81EFC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 20:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8501120774
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 20:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtLslw7c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441988AbgDOUMj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 16:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437890AbgDOUMg (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 16:12:36 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0E3C061A0F
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 13:12:34 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z6so1372780wml.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 13:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fvXqzMHbMJp2j4B2lInx24GEHI2N8OZM9NDxrCv9Xyc=;
        b=dtLslw7ceM0JZWnrKJqjNzgGGOmyxBG57q1zTSmgKHUPakZcr7anEilneJpoolo8Ee
         HPcAwuQprNBpXMxD7AqP7XI8FUt/t1hTwtZTdX3eDjGNAtP1S9qErvW4JT29nb8UAW0n
         jCzY6UNlkiNwXy0UA9r5m0sRsIUuRMhgOP0EZAqSRbMAgL20frPQ07HQg8RCJCZ0tot7
         ret0qwvT7lUPs9IudJuwBQgm4ijT2LRJ7N8ebitd+YVo+fXsCrHFOWgt11Cphdf8rXh+
         +H9Y4401vkKcNs8nFRXmLLg1+ZMQECKpcGOljsVh58aBYnpvKsATv3t5r8B2ukJL11EQ
         WdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fvXqzMHbMJp2j4B2lInx24GEHI2N8OZM9NDxrCv9Xyc=;
        b=k88738qoF6QCYSVpIhsiO690i5ng9m4gEeHfDvclm8Wv9q7JbiJJ76tEuGBLcK33FX
         E89clholBweLb6cPYQgXz8eNvn/H7sjngAR5H/lPu7/LkWOBYv600jl+oiPVDNpk/vcO
         YvAvHhz5siR5dPinbtlSx7PokfsEQVXqEDRZTf/RaQPZbQz9scE5WQe0DmpwzIwdrU33
         tGxwadsi9o14y/vwU2j3ZB/pMNqsNQHHoWaOWdD8wKbBgQikE87/UPtWxPfAjm8coGI1
         oPNgLfdSt6kKUYN5sLRdsTQaPHum8bdJkZ7RvCJiGTKvZ4XfML/GlumAiavGH+mm6wq4
         D/2w==
X-Gm-Message-State: AGi0PuZcpoBzBJNiIJe+4RXPo5jif2OLTLGGmMinev7GbyHdotv+Wkvj
        WG8Yvv5u01O7KrppK4w42XSlUw==
X-Google-Smtp-Source: APiQypLHrQERecjU6IWFmwl7YFKyLqM/PAxye+ao6jO+WXzd66KK8k3W0wD4IXNpZMAW9QIjAiDwoA==
X-Received: by 2002:a05:600c:2c47:: with SMTP id r7mr976048wmg.50.1586981553123;
        Wed, 15 Apr 2020 13:12:33 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:8bee:312:6092:58f2])
        by smtp.gmail.com with ESMTPSA id f18sm789372wrq.29.2020.04.15.13.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 13:12:32 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH] dt-bindings: qcom: Add CTI options for qcom msm8916
Date:   Wed, 15 Apr 2020 21:12:30 +0100
Message-Id: <20200415201230.15766-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
(Dragonboard DB410C).
System CTIs 2-11 are omitted as no information available at present.

Tested on Linux 5.7-rc1.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index a88a15f2352b..194d5e45f4e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1424,7 +1425,7 @@
 			cpu = <&CPU3>;
 		};
 
-		etm@85c000 {
+		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85c000 0x1000>;
 
@@ -1443,7 +1444,7 @@
 			};
 		};
 
-		etm@85d000 {
+		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85d000 0x1000>;
 
@@ -1462,7 +1463,7 @@
 			};
 		};
 
-		etm@85e000 {
+		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85e000 0x1000>;
 
@@ -1481,7 +1482,7 @@
 			};
 		};
 
-		etm@85f000 {
+		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x85f000 0x1000>;
 
@@ -1500,6 +1501,82 @@
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

