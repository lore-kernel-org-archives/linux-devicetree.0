Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B07AC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 15:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FACE2076F
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 15:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8TohSDz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgCXP6u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 11:58:50 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36201 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgCXP6u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 11:58:50 -0400
Received: by mail-wm1-f67.google.com with SMTP id g62so4116511wme.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7M4e9o8R/jlXCe3wT9wHDDQVcDFKUG87A79NboJcc9g=;
        b=z8TohSDzWj88TpVJhThWuXq681EwUXuzU9+8xtlGDkVL3r68Bl+dAIRrlT2C/sZuWo
         brgZVhD9TslO4j7iCZuuAuvA1LNNGdHkAG6Bo+yVOeqJEMhZiyp+/U1GiMi0df4BfusY
         mFwJpD+ixuHJOHOViP4SvpraMe/+EmG2GMAY0lXpZwLSA51RQLtAOoXFLVCj03WTTjdv
         frk/+6VRuOcKd7uC4oaRlLR+gJpOHytttAFZyTwKuLbqTEch6q/4DGJU+dD4yOa7vUu7
         U+JHXOv04ci6cB3rPq2aSqN62I6uOz3qMDEzJij+2pp4fT1/8Dz7cNuagSyb5pU6KKR0
         9imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7M4e9o8R/jlXCe3wT9wHDDQVcDFKUG87A79NboJcc9g=;
        b=F5BgRc48ZjL27sYdjVCSqJ01emGYn+A0IF+5U2btbT1FC08pQaO4XMy5Mt9I9hq0yJ
         HhDsKfVax0z0JhpuOyNnsh9pp6Lv5TOft4aFDPDbTc6TMIpoLoBAUnmQX+ImX5hKzRKF
         /c6RyFIlyuuUt/sn1xqg9IfvIUcVpTDhkkhhO2IXTBSZjwpuL7c0jojvc9TR5o/eKCL6
         0cc/m4+Km6ZDD3rBkV6eg2AWK6w3yPkpots9wBA3AlYPv+2DEBqSdaAleVLdu3nozPSE
         e6Dzr9zGqcqzIjaz5X0xa5m2veEnv2JTqQMSocRI8tToDM5HZ8tdLa0OYXz3JNbpreCO
         IRxg==
X-Gm-Message-State: ANhLgQ0avYh+CtFuP3RpItOk5BAOLUGutPvqh7ObsGof4LXl1IoDG3UV
        Zqc8NCXiZ6MsFFediyBhowC7ow==
X-Google-Smtp-Source: ADFU+vvN9RnVfxIazz7BTv+QNT+flflr45uROfuowXNpL/mjn+CLdjWfsK3biA4LZIq+XOLMJndlig==
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr6305800wml.158.1585065528914;
        Tue, 24 Mar 2020 08:58:48 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e15d:2127:89a:e5dc])
        by smtp.gmail.com with ESMTPSA id t124sm4993321wmg.13.2020.03.24.08.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 08:58:48 -0700 (PDT)
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
Subject: [v3 0/6] Qualcomm CCI & Camera for db410c & db845c
Date:   Tue, 24 Mar 2020 16:58:36 +0100
Message-Id: <20200324155843.10719-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series depends on the Qualcom CCI I2C driver series:
https://patchwork.kernel.org/cover/10569957/

This series enables basic camera functionality on the Qualcomm db410c and
db845c (RB3) platforms.

This includes building drivers as modules, adding devicetree nodes
for camera controllers, clocks, regulators and sensor nodes.


Loic Poulain (2):
  arm64: dts: msm8916: Add i2c-qcom-cci node
  arm64: dts: apq8016-sbc: Add CCI/Sensor nodes

Robert Foss (4):
  arm64: dts: sdm845: Add i2c-qcom-cci node
  arm64: dts: sdm845-db845c: Add pm_8998 gpio names
  arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
  arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi  |  76 ++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  27 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 210 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       |  92 +++++++++
 arch/arm64/configs/defconfig               |   3 +
 5 files changed, 408 insertions(+)

-- 
2.25.1

