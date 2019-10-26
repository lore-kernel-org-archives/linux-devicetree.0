Return-Path: <SRS0=rl0j=YT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AE5CA9EB9
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 11:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26FAA21655
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 11:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PcCgI+5U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfJZLDd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 26 Oct 2019 07:03:33 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:36080 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfJZLDd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 26 Oct 2019 07:03:33 -0400
Received: by mail-pf1-f175.google.com with SMTP id v19so3451781pfm.3
        for <devicetree@vger.kernel.org>; Sat, 26 Oct 2019 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=PcCgI+5Uk4+2QOtva7LrdqGw/ak4nk7qSeEMr723khYMa6gWpChw9Y1C3ZnkguEkqM
         c30XftThaNU0RSa1jFu71B1uf6OaYSYBcB1+3aDnHBRABZtmHFGr68aYpUFS3ksTD4yu
         ToYrqU935IGFVtWTsMtW3qnaOo5aYDgFcXgyuDIqA26QagZ/4qh3TR5nl9KDeCqjB79u
         2bZX41wlop6pBV3KM3JWxgPBzwmXbEOPrqIAo1GYRO8WMe/Q5SzURqTHazHRiF8o/m8X
         01ZsUl2qF4PCODOGd+L8C1enhAuY+jK1mYfmxzlSXzE7VpgOEss89Y7jkI+Sl7AEiEZc
         miag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=hBH5t14MePhTyB8bri2/b+KbKLtCxlnWfk7LUguGqZkiN0Tcmk8MclVJ6cT0YNL7bG
         NEnS6k2YwMHUr6P3FHNlW1nE0glac/T5JAdViz45Cy4GOA/WT9UPwRmyQ/y5sEcT4gd7
         4Y47ehDHIVLBdQD71nyDPr03GhwPM3h3OzaDfrpS0P1W6IP3V7P2zmV9t7s+yYB8zQ4G
         H1E532OB34V7PmF14Ut0J3DA/QsBM4wOrqhP7Y913yrE365RvZ0u43VzqTa4iLz3iVG0
         igSWOX2rBi10lRnwlMsYHDm4i09AaZ0l15gdAX2YulEMtWYvNvXcpchS0rhaAA3fWNE9
         CEeQ==
X-Gm-Message-State: APjAAAVRD9IxB0/oH1tmnwzqFOKjl2yl3u13vb0IC59zVGtFyOZVg5xo
        FPZ3vK+PvZ+YVh+SGrWRPDXX
X-Google-Smtp-Source: APXvYqzowpzR04MTwmL3N8OyfcVyg17NzEjCzBIUt7ybdLxmxuCT8V1POkDgpr/m0PBBlzk8wfKDgQ==
X-Received: by 2002:a17:90a:a384:: with SMTP id x4mr1395313pjp.116.1572087812466;
        Sat, 26 Oct 2019 04:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6214:69c4:49ad:ba3c:6f9:2d8a])
        by smtp.gmail.com with ESMTPSA id x129sm5543379pfx.14.2019.10.26.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 04:03:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 4/7] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Sat, 26 Oct 2019 16:32:50 +0530
Message-Id: <20191026110253.18426-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
References: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add clock controller support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index d65453f99a99..8471662413da 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -4,6 +4,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <dt-bindings/clock/bm1880-clock.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/bitmain,bm1880-reset.h>
 
@@ -66,6 +67,12 @@
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	osc: osc {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -94,6 +101,15 @@
 				reg = <0x400 0x120>;
 			};
 
+			clk: clock-controller@e8 {
+				compatible = "bitmain,bm1880-clk";
+				reg = <0xe8 0x0c>, <0x800 0xb0>;
+				reg-names = "pll", "sys";
+				clocks = <&osc>;
+				clock-names = "osc";
+				#clock-cells = <1>;
+			};
+
 			rst: reset-controller@c00 {
 				compatible = "bitmain,bm1880-reset";
 				reg = <0xc00 0x8>;
-- 
2.17.1

