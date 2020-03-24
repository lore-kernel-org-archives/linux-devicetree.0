Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C993DC2BAEE
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 15:59:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B0F320788
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 15:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cbo4qeBn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgCXP67 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 11:58:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43928 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728429AbgCXP67 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 11:58:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id b2so22104873wrj.10
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMq/EEyYYz6HWydBGjI4fuaJGHB5g+sKYV8/ecTsfnw=;
        b=Cbo4qeBnndE69etkLuKizylOxVcCmcdaFqQ8/ct9sDJJikWNyXNk8ZZ6zLf4hRPrMW
         l56jslKnUGo83vKTVAvhBIxzyrrH/9UvzP8GGTkw269WE/tUp1c5vHiI3guPOPFx+2jU
         otpKMEXqs7w3tXsYyzTrwAL1f6ht3I7RTewqEhEXXRtrQzXmOIhfZ6BZtuNaDtX/QGhF
         d8uR2xGZ+x+amFl+Pc1YODdzgdpqURlYziqetHbkrNP+k9GzC8A+XSTszxlNST78rD5I
         N+YlxU5l68N9n294cQoT7qG53b102vbtwQluMbmo2KHjKF2Aq6dijxo1T53f39+1yEEf
         G90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMq/EEyYYz6HWydBGjI4fuaJGHB5g+sKYV8/ecTsfnw=;
        b=tYrDdqaPs91SpRkaTgrJUKk6Qur97dB1W0aCxHrPIusuqG7xduAjNqjzm5y3oe4smY
         LF0XdI+q4i32LfpuXc4OQQY5pQBt+cSD7+Amc4nU6jsxVfWAAP3TyVFggq/vIlk7qsvC
         VHN4DywDaQ3Am/DHu2wGgM3CEMFd00QIn8F3iN3DGsRPt2MNK9ia+vnAxoF3RDhbHsYk
         NMK0lXMsMPcXfaKJkDgVnFAuiNQ665qGZ/fbAaPnbFRZw2DKP8lhPwy0IepBvGDXW4sv
         twxGBxB3WsyKp8loMkbr9WSSRvVrhGfobepQxNFap+LYOHaFynPkHMzjht0vfWTUVGSB
         Ykqw==
X-Gm-Message-State: ANhLgQ09ZpdzraXB4mWEFsimSZIRgcmukdApqkDQhkOsZvfHwi6FF78y
        dueP6PxLayw6Fuwc9XbV19UphA==
X-Google-Smtp-Source: ADFU+vubkYQyMAvXnpVSqfNhDN699hpGdG7F6l9ggO5EBX7SXW1DGYqomCS6qxOHeD7C5nHYtfLhYg==
X-Received: by 2002:adf:db02:: with SMTP id s2mr29329992wri.273.1585065537393;
        Tue, 24 Mar 2020 08:58:57 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e15d:2127:89a:e5dc])
        by smtp.gmail.com with ESMTPSA id t124sm4993321wmg.13.2020.03.24.08.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 08:58:56 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v3 6/6] arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers
Date:   Tue, 24 Mar 2020 16:58:42 +0100
Message-Id: <20200324155843.10719-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324155843.10719-1-robert.foss@linaro.org>
References: <20200324155843.10719-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Build camera clock, isp and controller drivers as modules.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
 - Removed duplicated CONFIG_SDM_CAMCC_845 defconfig

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4db223dbc549..676bb53fb8cc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -376,6 +376,7 @@ CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
+CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
@@ -530,6 +531,7 @@ CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_NOUVEAU=m
@@ -732,6 +734,7 @@ CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
+CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_QCOM_HFPLL=y
-- 
2.25.1

