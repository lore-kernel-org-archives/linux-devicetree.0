Return-Path: <SRS0=aDgx=ZR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88665C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 13:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 623512084D
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 Nov 2019 13:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3TYauW4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfKYN7P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 08:59:15 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36839 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbfKYN7O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 08:59:14 -0500
Received: by mail-lj1-f195.google.com with SMTP id k15so15992362lja.3
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FQEFOP8k3SAXbImBIiqpJfmOdRRtRiacZt1f1LEqok=;
        b=E3TYauW4TPVtlpWpGNXnLdNMHfBBvPHEF/LwwlTf7OZlTcJs7jAMSgBLABLVt5PnL+
         HyQmbi9//rm6IdZN2fqORsmYqZqvnoh9wCoOBTEb4NKsB49CBGWc/PEXIQvarDJu1Hz/
         8cryvUe5/vf5R/kkJr1K6RrFV1VTIswF/l9LMCjIt87CWzPTyJ8Cvad3ehuamgYjSnsR
         IuRVmZ5Lu8RVNOJdeIjvALjUXXJdigAtIvBuGjCpcMrN6Fyvg0udAkykiAFb3+70GTTU
         IzahDBAnmlRYjE0pdqAJbwPWRE5hGQFCbiegt47/5qZYm0vlAqzQaAU/Sj1qTeL2V4v5
         frxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1FQEFOP8k3SAXbImBIiqpJfmOdRRtRiacZt1f1LEqok=;
        b=elfvt81qlH9/dbNZxqbFaagTFp9JHd1pyWGmtWobY2f+z1/Wfm5/fFFunW+cfgEt7g
         1r33dKQ7LtJAeqXDO1wKGMFbeYMhnYIDD7NK2uYZJWGmtyyZ36zNVS38vdc5odfvnVb6
         rbDgVbJQA/DynphyeKqHnd9DxeH5Af92WIKfp2l2jZhpwtm+rlL6KMEC+hBzsQNAddBX
         YAcTNp1tlG+T3CzR10IoxwIhWb9OVITM0fr0CTpD+XJmvh8CdtHF0oOzDt3aSUXkfWxz
         id5pUZZol+/o4WLVqmycQx3Jkw6pdylZvS5PrP583su+kPZZGM8JTm2PphWmO5wncnQG
         WAQQ==
X-Gm-Message-State: APjAAAUWXyaZe+XsXwBcL+WXpNl6H6J030HXwzGVKIapVkclFsYGU4da
        Q6tCy0QnfcWm3EnRVQcSeORJmQ==
X-Google-Smtp-Source: APXvYqy+vTpb4+HCLB7KdfFc3jtA6JL7ae0EIjboDWKhsxQ4bU4M2hS4PqfhXanx6PJ5pjpmGLU9yg==
X-Received: by 2002:a05:651c:1053:: with SMTP id x19mr22406217ljm.39.1574690352732;
        Mon, 25 Nov 2019 05:59:12 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id w71sm4189705lff.0.2019.11.25.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:11 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     amit.kucheria@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 0/7] Clock changes to support cpufreq on QCS404
Date:   Mon, 25 Nov 2019 14:59:02 +0100
Message-Id: <20191125135910.679310-1-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following clock changes are required to enable cpufreq support on
the QCS404.

Changes since v2:
-Addressed Stephen Boyd's comment regarding apcs-msm8916
should use new way of specifying clock parents.
-DT binding now has "pll" as first clock, in order to
not break DT backwards compatibility (in case no clock-names
are given).
-Moved EPROBE_DEFER error handling to its own patch.

Jorge Ramirez-Ortiz (6):
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  clk: qcom: hfpll: use clk_parent_data to specify the parent
  clk: qcom: apcs-msm8916: silently error out on EPROBE_DEFER

Niklas Cassel (1):
  clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent

 .../mailbox/qcom,apcs-kpss-global.txt         | 24 ++++++++++++++---
 drivers/clk/qcom/apcs-msm8916.c               | 26 ++++++++++++++-----
 drivers/clk/qcom/clk-alpha-pll.c              |  8 ++++++
 drivers/clk/qcom/clk-alpha-pll.h              |  1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  2 +-
 drivers/clk/qcom/hfpll.c                      | 21 +++++++++++++--
 6 files changed, 70 insertions(+), 12 deletions(-)

-- 
2.23.0

