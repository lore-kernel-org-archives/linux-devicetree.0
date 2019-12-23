Return-Path: <SRS0=v2WM=2N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABA5C2D0D5
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 05:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1F02206B7
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Dec 2019 05:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+iJV5pb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfLWFt3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Dec 2019 00:49:29 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53513 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfLWFt3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Dec 2019 00:49:29 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so6961048pjc.3
        for <devicetree@vger.kernel.org>; Sun, 22 Dec 2019 21:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1XUacwVg6UtA8MchmvXuh03DJHAG9CnuImbIcloSG5k=;
        b=P+iJV5pbry18PLZyr669o+IPKh7QicKAILliFehkugV8ZOKOxqSVcVXCmVSgYN9xrj
         xPe/xyLltPJI0X9rQ5GMwIfto/S4RT67Q3m7djdZY1OI6uYLvGqoHUhK+AGCiiojEPLm
         zvsrB/SWV0NUhLbE2cPom+DB22t5tcs8k0dhTICX6mSFxKzyzMegfjldRBFkbD/PA23q
         /7U/8X+5JVjimI1Q24WalhGe91L1whzdSfg6ro0rNYPBfCCiKVfg6vC3RmjDE9Zhon/S
         TiNnGD7+dIqmKWYJuX7UXloGM21mecV56nSdh2yFlLZPDfGvWj+zzjQSW6+QbV0LY3dd
         afFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1XUacwVg6UtA8MchmvXuh03DJHAG9CnuImbIcloSG5k=;
        b=gfaiIMi6wALUfyVzF8unh6hDpkXZn1gogqx8L5mgYuiEoZvY3g//XlPe6sp07ySKb1
         vCNj4pX63YYK6iBOUPdUk1GKNU2cspT7F85/D8xdEF7ugCnAMN/+DMKnJIFvOqPtKjLg
         EFfvSWsfASZywEJiunJMu1UMmaaIL62Bbo3jVw1bQVqLcKteKYvL7D/jsx/vmlwfMWgT
         8/TwLE8JLU0gw2aE9H5XF5stUZb/C3MEjBzJRdkEljETfm/UZJ9OAixoGPHaAJpBp+D8
         3w6sB4oZXgTIEjo5N/Jvg+2onxinjUotgMa39dRNC1/xy+N4YQSOTGMtMOus2niNjsYo
         ZsXQ==
X-Gm-Message-State: APjAAAUCA6RmH/EQbqFJmkKWmndBL6/1hTcm1l/5dGIAihvgwbTGLuF1
        lF+4kAZRLQXqaUBKIQMNqNDfqA==
X-Google-Smtp-Source: APXvYqw+lXD6B//G6RmvqL6dzbQ+OHOTBYMX7tSL/CHI+FnUJbP04tPOj2vJTeE6aVXU6tCj3fxQmQ==
X-Received: by 2002:a17:90a:b392:: with SMTP id e18mr25820505pjr.118.1577080168070;
        Sun, 22 Dec 2019 21:49:28 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l14sm19731779pgt.42.2019.12.22.21.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 21:49:27 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org
Subject: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Date:   Sun, 22 Dec 2019 21:48:53 -0800
Message-Id: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
will reset due to an NoC error. So this adds an optional clock to the ath10k
binding and makes sure it's enabled while the WiFi firmware needs it.

Bjorn Andersson (2):
  ath10k: Add optional qdss clk
  arm64: dts: qcom: sm8150: Specify qdss clock for wifi

 .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 4 ++--
 drivers/net/wireless/ath/ath10k/snoc.c                        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.24.0

