Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED83C33C9B
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 506A221775
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 08:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNFeLVY8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgAFIGc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 03:06:32 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43339 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgAFIGc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 03:06:32 -0500
Received: by mail-pl1-f195.google.com with SMTP id p27so21558052pli.10
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 00:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYRccObnk82yOuczGFINBWdofPbLBtY0H0yJpULHPjk=;
        b=WNFeLVY8U/lxitGZj8Rc0L8mcEsI22Phr3Tf2fkYMix/CGW1nlayn8f4GbLzDCDwdn
         gxyXGEq6hQAXX/fh27mDoV09ksfcoJ3FrWFgiILeP+cP8hyjkZyIfwKK5KIHedp1iqMC
         RRt/7kvuzNG1/34ksAGwg0HoFZMoCWR92PYM8dXKQOrFQCpeA9UKR06+p6XHwSMk+VxR
         1bD7kKmYTzKQ4+X9azfGP4NrxXKnB/ihSelJkOsgPgkdki/OUyNroCH2D83Sc8CaB+5v
         iS+Mr8LlCu9LidwZaa3Zc3UH6m5Awa8utZyMieI14oNw60p7g4CcQAjsylIQIoeu6qvc
         0q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYRccObnk82yOuczGFINBWdofPbLBtY0H0yJpULHPjk=;
        b=BkVYUPJwNRdqNYR95LJ86AYqsDlTrerQRziKJe4cWAVY4ZGnA5Em6R6ayGRM1tPw5t
         Q6Ag5jZuLbFrsxHfp7vuOikONHE45VjRuZb1Go5XstFfrNDJkOMdzXdcZgnXba3ZkUK6
         cLT58rKFI7CQM2Em5r0iS19UJAPr880Gku8IMYwNDKrVybQdF740H2e5/Vc+qjX/+94/
         JvDPH+8IFu/3pSu3fmM0SEpehyG8uHdVqQvlMMNDdOY8jm5zohunKNkYjoedPbwnyTYv
         5mliSi8HosUZP2gNuUL0C+j5vg2gRD4WnpAHMaDVdo8Mz6WBCrviGyD5JzUdm9AQWsB2
         j2mA==
X-Gm-Message-State: APjAAAWiGffTo1aMa0PyfDTZ9ffhrg8vtw28JnTdZ6q5q51qgSx1opf2
        rXiSnmcACIR55ocoGXxXOIspCQ==
X-Google-Smtp-Source: APXvYqw+lIGuD+A4LDdzWoXK1cnrFoom4bHZhnFIZo0rynTuP2KhlLmKuZzMGvJqe4Trr0zPwz8P/Q==
X-Received: by 2002:a17:90b:1110:: with SMTP id gi16mr40017182pjb.110.1578297991310;
        Mon, 06 Jan 2020 00:06:31 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y20sm11916038pfe.107.2020.01.06.00.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 00:06:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8996: Define parent clocks for gcc
Date:   Mon,  6 Jan 2020 00:05:46 -0800
Message-Id: <20200106080546.3192125-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200106080546.3192125-1-bjorn.andersson@linaro.org>
References: <20200106080546.3192125-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The CLKREF clocks in GCC are parented by RPM_SMD_LN_BB_CLK, through the
CXO2 pad. Wire this up so that this is properly enabled when need by the
various PHYs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased patch

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 023dafc6cfd4..b22a1b9cb9ce 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -443,6 +443,9 @@ gcc: clock-controller@300000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x00300000 0x90000>;
+
+			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>;
+			clock-names = "cxo2";
 		};
 
 		tsens0: thermal-sensor@4a9000 {
-- 
2.24.0

