Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FC6C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 10:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B925208E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 10:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcnlHAN4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgC3KGg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 06:06:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35650 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbgC3KGf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 06:06:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id u68so8350970pfb.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCDZDJlysJhXfpiBO1XjknNGnMdzqMitgGarrB4D0Go=;
        b=rcnlHAN4S2P3qXI5QF+Y5grQereDq1PNGtU/ubadlUiv5qvNhmTbHits4RPEwRyOBU
         hRlQXEGPnVApcVzTULEl4e/FgB2OfkQ6Fo139anpYQAfq8g/UU3y8+9kA4JD5gHeSV3W
         8cyTa6kjfk1EGbmAxzjt1h5r9fl5RoBpeYG5/b6tkjCVj/jtXPwuTYvfEgW3/NkpqTGt
         o6VqrHEBrqPAzGTFVbbe8k9Ey3pSm+2+bxABpTWFvloHdWSMILzznSG9IbS9VRxVrVPd
         PZAx1+c/dD22RgpnCDGCV+Gf5ZpO2CXPnpZRGzbPAnN20XaEatKxrXMwHQWhKZwT5Wmn
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rCDZDJlysJhXfpiBO1XjknNGnMdzqMitgGarrB4D0Go=;
        b=FF2pq5O1NdCiF83AFVrZJOaMIkGRP4idfrFRSf0zLM/AcdXmeekQp8lcYI85v26+Nk
         jzK7bHIpHApOvW5fDp4anKp1AjomAhl3aV9Gszkeef/YgbkT8lDDwUp8DiW/IajY2DDs
         1w6gDBlMR/pCEmqkl7s2PDuaItEH/FP/2wqDyqDurezLTvSvTIZOEfQN/89FiS8qH95n
         HInoPw9FQKF9WPh9XmDYsrcyVXfTcNZeT3Gm7AAJ6I6wB/US7k0dox8qEQFNyC94q8LM
         +Ljum2vAd+vMxov+zAwr4Qscsoje33iexjMoA9XBugaftSYqGQMExQzhlFPbchhsOFtY
         zcxA==
X-Gm-Message-State: ANhLgQ13p4PdG9xnHfLpZLBO1aND9or1S8wqN6l+BiyB7aU3r8y3oh/Y
        mXO1XeiqvxmHHfjTDbm1Qig3qg==
X-Google-Smtp-Source: ADFU+vswMuTmj07ZJkt13uQAo+NdaDRcPhPAaO5t3pkoEPzJ6O3wxeHdKQc6XeaQ7YJyx0FfBFnoyg==
X-Received: by 2002:a65:5383:: with SMTP id x3mr12028223pgq.279.1585562792992;
        Mon, 30 Mar 2020 03:06:32 -0700 (PDT)
Received: from localhost ([103.195.202.48])
        by smtp.gmail.com with ESMTPSA id my15sm10223033pjb.28.2020.03.30.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 03:06:31 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 0/3] make dtbs_check cleanups for qcom thermal
Date:   Mon, 30 Mar 2020 15:36:25 +0530
Message-Id: <cover.1585562459.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Clean up the remaining trip-point names in qcom dtsi files. This is similar
to the cleanups done before:

commit e8c48eb08ab14 ("arm64: dts: qcom: qcs404: remove unit name for thermal trip points")
commit 19e684e835f63 ("arm64: dts: qcom: sdm845: remove unit name for thermal trip points")


Amit Kucheria (3):
  arm64: dts: qcom: msm8916: remove unit name for thermal trip points
  arm64: dts: qcom: msm8996: remove unit name for thermal trip points
  arm64: dts: qcom: msm8998: remove unit name for thermal trip points

 arch/arm64/boot/dts/qcom/msm8916.dtsi |  8 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 ++++++++++----------
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 38 +++++++++++++--------------
 3 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.20.1

