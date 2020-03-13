Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BEEC4CECE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C24172074D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHJUb0/I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgCMLwq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 07:52:46 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33328 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgCMLwq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 07:52:46 -0400
Received: by mail-qt1-f194.google.com with SMTP id d22so7206980qtn.0
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJYEwhvvykhNvLjfomJTk+7wfFhPwkWPWJYIsxK+5ik=;
        b=WHJUb0/IaXI8YcDSsvqHVkiPkhBDtqH3G5v2AxaXMmjzE/v8jmczleWms+uAsMI/3b
         Epb2+MASyIy28CDMCjlAhiccteW/2XOnn89UAbJyPDCisRmVM3sbY1zz7RboW4xGOlyb
         iiW+iaQ01QvGTk0YkEFZMaGSVeYpotCjYe8UHBdflbY66Eqd/q1nJNzvUVnPywKUMlWx
         979eYmyVlHyNAobDzaJsWSv/9DzlZWR38drY0TMzDHiTZhWo6kY1R5RppESnLc89vHBW
         6DoOXQIrB04CYSNdGJIZe+svMlcmaw1rkTAPLoNqEy0diOdYI8TuazDEyDCNd9TmLipY
         3ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJYEwhvvykhNvLjfomJTk+7wfFhPwkWPWJYIsxK+5ik=;
        b=a3gjLOK/IKY6R4YWZ2DEImh9yRsSZsWJdGp2MGec54opIypmHQuLKlJJJwgW0iwFPx
         i69IQ4u/yvTBgclESOrIfpdQ61peDxT5l+z9V+ShXr4Y7AgPIbzKEWss7g/nteMQl/kc
         SyihEvnJgoqtDRO9SMrJ01ZYsZWV8Dvcj5TzHDeCjLW+atI5XJuFUS1LQl8w5gnBTew9
         p2oUnFQ5BViBBQ6r+NH6XqNQ29pnEpMDah2lyUAqlrm8LVauSNe5pRn6nBWtgRoD3DVh
         eaRHU8wYUemPAmBRxTOvT9HvhnSAtoioxY8g+mxuvDpWq3yWsqHIyffFqTFOORey2fpT
         3fGA==
X-Gm-Message-State: ANhLgQ2yBBPTgJ57Ogol5bYicScSRKTpbpIwwoRZbDHEVhPbcYDOPOg4
        qGqdZbpKdiTnHpl+c4sjbLqgYg==
X-Google-Smtp-Source: ADFU+vvej74YRXY/m6GfPvQUsq2YU9gpzqc0nY21UEsUUCQi5bwxmriEBtGWTbteSOh6z5lB/G3bYA==
X-Received: by 2002:ac8:4e14:: with SMTP id c20mr11766098qtw.141.1584100365397;
        Fri, 13 Mar 2020 04:52:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 199sm11031143qkm.7.2020.03.13.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:52:44 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     David Dai <daidavid1@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Miller <davem@davemloft.net>,
        Evan Green <evgreen@chromium.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: sdm845: update IPA interconnect providers
Date:   Fri, 13 Mar 2020 06:52:37 -0500
Message-Id: <20200313115237.10491-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313115237.10491-1-elder@linaro.org>
References: <20200313115237.10491-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit:
  b303f9f0050b arm64: dts: sdm845: Redefine interconnect provider DT nodes
removed/redefined the interconnect provider node(s) used for IPA.

Update the IPA interconnect specifications accordingly.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0ebe12e4c07f..e0fd1f0c9b07 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1734,9 +1734,10 @@
 			clock-names = "core";
 
 			interconnects =
-				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
-				<&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
-				<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
+				<&aggre2_noc MASTER_IPA &mem_noc SLAVE_EBI1>,
+				<&aggre2_noc MASTER_IPA &system_noc SLAVE_IMEM>,
+				<&gladiator_noc MASTER_APPSS_PROC
+					&config_noc SLAVE_IPA_CFG>;
 			interconnect-names = "memory",
 					     "imem",
 					     "config";
-- 
2.20.1

