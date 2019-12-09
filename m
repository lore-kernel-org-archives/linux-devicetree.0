Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1210C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 08:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 877742080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 08:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9gYohOs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbfLIIjm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 03:39:42 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37925 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfLIIjT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 03:39:19 -0500
Received: by mail-lj1-f193.google.com with SMTP id k8so14585452ljh.5
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v49ydhRHchofWzIVQxqpzPrTtsddtPryUTJT2t4dhHg=;
        b=v9gYohOsVaW5DeUzwcntIszGR11cpCwA1aGZQI/0YtSyva2+iY9Ho4nwPh1XkuEEcs
         ePzEjiMXfOWUfjkuL6au580P6z9q6aTIQ4BAFKeXFDBtnUhU+aVTh0lEAgY4C7HCpSV9
         ORwIprAIN+8zsxiBuym7PqglNRmEVQycLevLaHhL1ebSrdLLpkdVn/rdkrrGJkyYQf8v
         c/52xy2F25iRJr8xYXD9Nv2jRKO5G/tG/EsYycAbXnJ/v4Fz6AxBSvRdmt06fg7z7xF1
         U0uhvGFU/i/H8jRdR5icC6XyPExufkNMMEEbkYwB0qS9424ytO17ogMD6Dgb8ahdoFI9
         ukiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v49ydhRHchofWzIVQxqpzPrTtsddtPryUTJT2t4dhHg=;
        b=e4163rHCwXRRW2ZvL2RVmNiPgmmD1xMe1oueRy1g7Fg6cbtK1Nx3qB13qs/pvS+ubS
         UCBZpsAv8J7FE+s5fEOtyN8LfGBH3Z/9Ko4kG9lV/l07xikB6B13n6U342lgrFZBkAqY
         l6NML7tKM+JhE1RlVqeXkQw3/ojGDl93IfalYs9iipMfC/+KKwLHGSNLFgjaQ9qsLQgt
         +xq3Zh/eqTN+loOgLbc7tlYPaUirf9ZnIRCE1AtQ8FswiZXcUiVmvrjzNJsCF/R72mum
         hDknOEQ46+ZJYAj0f7bLqKgzlP8Xj0qWnhghzOve4dgXEDIGYsi2K7o2xAooILbK9b33
         9ZcA==
X-Gm-Message-State: APjAAAUvr+kM+QQxYe8imm5d9QoZ9XN3aY7EUrECdC+FS70+NAiKk3JO
        fBhDR9Oy5jrE9mS2sVqaHAyxog==
X-Google-Smtp-Source: APXvYqw8SpOAGnK9Y6ldb09TK9z4GTkamwKgzyRGZM1ZhvBxsbDATkag4guNVGmYYMSeCsQjPFddtA==
X-Received: by 2002:a2e:808a:: with SMTP id i10mr15268982ljg.151.1575880757072;
        Mon, 09 Dec 2019 00:39:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:16 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/6] arm64: dts: sdm845: move venus clocks and pmdomains in parent
Date:   Mon,  9 Dec 2019 10:38:21 +0200
Message-Id: <20191209083824.806-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move venus DT subnode resources like clocks and pmdomains in the
parent Venus DT node. This will make possible to support dynamic
core selection on Venus v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05..540028fed3ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2571,29 +2571,30 @@
 			compatible = "qcom,sdm845-venus";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&videocc VENUS_GDSC>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&videocc VCODEC1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
-				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
-			clock-names = "core", "iface", "bus";
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus",
+				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
 
 			video-core0 {
 				compatible = "venus-decoder";
-				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC0_GDSC>;
 			};
 
 			video-core1 {
 				compatible = "venus-encoder";
-				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC1_GDSC>;
 			};
 		};
 
-- 
2.17.1

