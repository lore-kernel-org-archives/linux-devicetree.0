Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC935C3F2D7
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 18:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3AF32166E
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 18:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P+wHUgAf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388307AbgCDS5Y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 13:57:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45480 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgCDS5Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 13:57:24 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so1405155pfg.12
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 10:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idtFy8s7OaNPWyKbg7P+1dRKvA+ZRf5zuxknR7OyW1o=;
        b=P+wHUgAfTLxMQ2NcHR/tTiyoigV9cEhyD/cKtzqf91Cc47F9lSfj2Sbn3vBkR8MKA4
         HKATzrSgYdIqrlRSJ+u52MpPHsjvVLLagl6mT+sTceC5IVRaJI/IVta88WVHPHpDjCi/
         MdtGjOBHDRAVq41VdjCz1mMvtjAHJogDft0A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idtFy8s7OaNPWyKbg7P+1dRKvA+ZRf5zuxknR7OyW1o=;
        b=f74s+KzeXaxsZgXhTJhwjmoIxWJH9S14ZpkoRORNlCM4RlUghkvhyjUv2X3ESNzYyk
         5FpP+Bhp1MJD8cdzBQoRntCjf0WT7K2aWgpkVh9PvXwCTqpcrEsr3jQqJ1E78oFHzr9u
         kLYNXqIIOXyCKg/fs5zzT2sQDH+P0MyToSvUmFovE9GHMT9aosUVCernGDzirNXdXYNR
         3ndhIZbS0O9HsmJArY2KSLOkNQToWyLHWfrFYFsWxO4flqO54gVAdiAMDXXS7waZnx8F
         CKyLdz6BDos0nxhTB3CeBxiypSUX751sCnhWTMzFRpBLZ2Ondt7uRk7F9k6tf5rY/Z2M
         ToHg==
X-Gm-Message-State: ANhLgQ1sg3ixjeWS5furTwNPdw04aVEzV9z0hAJS6wSz34KAKdct49r4
        NmZf+I1z0fSNYIspyn1JOi4n8Q==
X-Google-Smtp-Source: ADFU+vsFNLAgknRkVaIM88rGnq3JGV02sq8SLXTLvL9+Yxwez8qby8TqAzle/IPrOWuYWkvutiT15w==
X-Received: by 2002:a63:5859:: with SMTP id i25mr3699184pgm.74.1583348243434;
        Wed, 04 Mar 2020 10:57:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id cm2sm3576394pjb.23.2020.03.04.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 10:57:22 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: sc7180: Add unit name to soc node
Date:   Wed,  4 Mar 2020 10:56:56 -0800
Message-Id: <20200304105638.1.I9ea0d337fcb927f52a28b20613b2377b6249c222@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is just like commit a1875bf98290 ("arm64: dts: qcom: sdm845: Add
unit name to soc node") but for sc7180.

For reference, the warning being fixed was:
  Warning (unit_address_vs_reg): /soc:
  node has a reg or ranges property, but no unit name

Fixes: 90db71e48070 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 253274d5f04c..8e71f543819e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -359,7 +359,7 @@ psci {
 		method = "smc";
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
-- 
2.25.0.265.gbab2e86ba0-goog

