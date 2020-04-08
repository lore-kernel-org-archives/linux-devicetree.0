Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCF0C2BB85
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DC9C20753
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTY7ueTT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgDHNK4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 09:10:56 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55129 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729087AbgDHNK4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 09:10:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id h2so5078447wmb.4
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSMVnMgP4upKQElf5JgAZWIAcGCpvndMYRb9Vat/nes=;
        b=jTY7ueTTsIQBFnXQvHWdLsvwO1hONi41sVbUlwZ/VUcwNdlqIdWBAQsD9nxJ0K+TVf
         8NMjHWmXWYNwSu8kCRyJpvnUsLhXUO2DIlmKGobnOokpOtR0uFywBeNceQIgOaPGAXeH
         9cVDwKsyAXOkmsnXkdztrirkb9eBgQU22nZSZ8EppmCaWbkz/qDrqZiAziZ2x3ocvfMM
         AfJDvQRSDknm+9YHWF9eqB21A/INWL61t2kxFlMoGrTZXHSvEqopW6jdo5eSPKD88Ie5
         lrqoNff86K8IgVHW+5cG5+GQGHD+pf9LJZ/iT+v6WsAsZ/iqS0gWDmJppXPleskAyveD
         w8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSMVnMgP4upKQElf5JgAZWIAcGCpvndMYRb9Vat/nes=;
        b=DZRAok3QvBObvmmjRCeXM3cWqcde7SYyWBXWncDv/Kq+OHg1UebbRZKgQePBaNXK6X
         kKJg+UiNPWd6RPdz4rYe/u7EYSBZ0jw2weSeOUkBD5pvc7wfMKzYrW+bi1zIR52gY1Bb
         ryPY2X3Er6NbCaPtsPFKWqItOLeylBvj3sjZXS3fMkzfd1o620zHWh7WZOwIGhULsYmm
         ejlw/WH3ImjWImA5eWE0oFHLBa3CfYZ7XA2/giC29lzH/hRsQsW3pV7JvEsX8K/xNGWG
         LOVHBmVv4xrofJSD3ymDlh5aSgJiSeplNwNero9UdlrKrcogoD7/j6/KmzZN3bpAqxD+
         d8tg==
X-Gm-Message-State: AGi0PuZwDkam8zv3zu1glKvt0MyPndPoZjSIfUvy3R+7BcGjP7E+6HFh
        mB3PU0jwrw9kGlCNLJNSNIngRQ==
X-Google-Smtp-Source: APiQypLR7c3obm73L6raxreYTOjlint94xmBRATqvnqD/s3kybG5fJuCWGpEqrfbhkYkl15QKdl+NA==
X-Received: by 2002:a7b:c445:: with SMTP id l5mr4760057wmi.61.1586351454571;
        Wed, 08 Apr 2020 06:10:54 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 6/6] arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers
Date:   Wed,  8 Apr 2020 15:09:59 +0200
Message-Id: <20200408130959.2717409-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
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
index 24e534d85045..46ee13b6df27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -410,6 +410,7 @@ CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
+CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
@@ -582,6 +583,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
@@ -802,6 +804,7 @@ CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
+CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GCC_845=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_DISPCC_845=y
-- 
2.25.1

