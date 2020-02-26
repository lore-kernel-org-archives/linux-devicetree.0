Return-Path: <SRS0=+O1R=4O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E9C4BA0B
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 471BF24656
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Feb 2020 11:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlmcE8LW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBZL6V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Feb 2020 06:58:21 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45]:36244 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgBZL6V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 26 Feb 2020 06:58:21 -0500
Received: by mail-pj1-f45.google.com with SMTP id gv17so1187803pjb.1
        for <devicetree@vger.kernel.org>; Wed, 26 Feb 2020 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YMRvV+08eDz1zTAqAh41qKWUj9Ta+YFrJ/4O+JaQ+E=;
        b=XlmcE8LWadGLnbLkM6boQYBuEwDqamO2pB8rpBi9J0f4ffdx6t/8w/w0ns/yX3ZUOZ
         v3sGKC51IA7PqAV5dJ7VY/Ni/mWLfrQTyU/O2qYXtfPSskVOJJdEDXffvi4PJL15pIHr
         bdaK+Y/NacnkuQcgNvLWjQG97HLFnD0hnjOzoZT+TQw6rNoVmzbx9iRVos00rh7iG3iI
         siWMsJWAzl5YlPXH1GAlM+YxKb/u2406l8BL8pBO2FqqN8Yt2WtslbJNpmGHh9RmSDxf
         xZKUAWedusMDKR4J9+bNoj2woELORkGPJoMD/I+3xYTQYphSSo+6JZlhxroYKnueD1T4
         8kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YMRvV+08eDz1zTAqAh41qKWUj9Ta+YFrJ/4O+JaQ+E=;
        b=SY9kIRXetDK/z28O5HXm0W7Ds+6jfM18B6QnwjB6k/48p+f9rAlQLSqMG54SYPqVvJ
         hMMi/p379WqTnb00+u2PtW6HPB5nRQVuTOCZsXX+4Oe1EN2aO7OigBU4bMp/JWDh8pKz
         gDYRmyQx9migxyCyxTOC89iMDISbrF9k1+KTN2FZjkUfce/tjCHBMMdAMLlPVOHlM0zO
         /fcAA0SejNoAeXb7NZb4/e9b6tuEzoVTsfoRxFEOHNHTJj+dFSphqbxbhrcXqwfBH2jJ
         4ojX2cB3ciN98fJ/RMnfhEe2Mq2cURnYAqIUeG+IoRll+LTeCdhbBtw1BhoYCXnATveP
         csEw==
X-Gm-Message-State: APjAAAUYvH8f4vxs223Ep9jpfuSIu0biOo1CsjLuCSa00QXwQK84O2fH
        vF3gdwEgdnGIql096TidPE3uwQ==
X-Google-Smtp-Source: APXvYqy6SK3++pCleI5HCCFb8UN6ntnevHnMXBkL9kYIs0aj2I8qBTp78k6t6H0wMoJRCryfMW8vgA==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr3709323ple.302.1582718298449;
        Wed, 26 Feb 2020 03:58:18 -0800 (PST)
Received: from localhost ([2401:4900:1b38:7f42:3530:df3:7e53:a029])
        by smtp.gmail.com with ESMTPSA id c188sm2893183pfb.151.2020.02.26.03.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:58:17 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v3 0/3] Cleanup dtbs_check warnings for tsens
Date:   Wed, 26 Feb 2020 15:01:10 +0530
Message-Id: <cover.1582705101.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Make dtbs_check pass for tsens bits. I'm working on another series to
cleanup other DT warnings for QC platforms.

Amit Kucheria (3):
  dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
  dt-bindings: thermal: tsens: Add qcom,tsens-v0_1 to msm8916.dtsi
    compatible
  dt-bindings: thermal: tsens: Add qcom,tsens-v2 to msm8996.dtsi
    compatible

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

