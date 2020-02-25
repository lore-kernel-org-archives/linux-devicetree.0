Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E52C35E02
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 12:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7791E2084E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 12:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kjA6ZmUy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730579AbgBYMIh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 07:08:37 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50728 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728913AbgBYMIg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 07:08:36 -0500
Received: by mail-pj1-f66.google.com with SMTP id r67so1176860pjb.0
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 04:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX9C7ZPdxFmb0GlMBS8FC0FI8zrtThCVdwItF7qjLfw=;
        b=kjA6ZmUypj1HTXa94pZwT1LV+aMpSC/ydMHJTp+4q+7EG4FOXyv9INFTwKISt0b+sR
         +mJV5JIIHoFJ1f3kcrgqQyeEaYANDpG8oJd3L4pT5sJ4F/I0ds9vpCpr46TWyruzjVSb
         mYs3K4X8rs7aNqutA28nCMJUxq32XAMyf1+acFED/1cY/i/AIhDUxMobZGtpRqiSeP9e
         a17RztLLMJN/yS6+eRKQERjzDN9lXPi7R5TWZGArptDgtBQwVuD6VYoJGddV5B34zt2k
         HN2N4iFydeEBezXTM5W12mr5NceG5XLhy5v6vjWNGkKDHyPuuzq+TqCOySFSLCa7fiXt
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SX9C7ZPdxFmb0GlMBS8FC0FI8zrtThCVdwItF7qjLfw=;
        b=SWG5bLG8NRHFbMWTWymP79+NE9svgU84jE15vEnq97s5zylykzkp2SEQOhw5AwOqhK
         E3AJWDnzUIkTtasIQIL4sFkbfkjVgrjFPQatKegyRxYilQ2cV0oaVTg4f2u3kUiz/x5/
         r0LAe0jCj9JslhIlCI8I9HDtMUDFKHeC8c1EALtJn5GW4rBFiq1ygXsSue3utFYVTOLF
         YEWbanf8qPxOM+Q8SwoRWi9z/Y/HTY45TdT/hiWpoWMqqq8dymj5g69bNRB8Ft9w9WN3
         lhgLfMJfW+fhxtD8pVNMEI0Kc9c0dW/IbOdg6uyNTZFilYQBMxFHfvvf1G2l4NIvDqfc
         7Otg==
X-Gm-Message-State: APjAAAX2mVkIamWPM3V+j3ncB3UR/QPDssT8AvuPOEXb+6+SemtixpZN
        pUBe9AUH3aqiQh4VGHt5DGAVwg==
X-Google-Smtp-Source: APXvYqyzTnMsiUNjG7S4OAApXWLWj1aNMDRVPTG3vQ+vG4st5HCB6AZCGVIId6V9JLkteFhP1wx4RA==
X-Received: by 2002:a17:902:426:: with SMTP id 35mr54061530ple.176.1582632514117;
        Tue, 25 Feb 2020 04:08:34 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id t17sm9471387pgn.94.2020.02.25.04.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 04:08:33 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 0/3] Cleanup dtbs_check warnings for tsens
Date:   Tue, 25 Feb 2020 17:38:26 +0530
Message-Id: <cover.1582632110.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Make dtbs_check pass for tsens bindings. I'm working on another series to
cleanup other DT warnings for QC platforms.

Amit Kucheria (3):
  dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8916 tsens
  dt-bindings: thermal: tsens: Make dtbs_check pass for msm8996 tsens

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

