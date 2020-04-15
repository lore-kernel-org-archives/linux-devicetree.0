Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27651C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:22:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDFF5206D9
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 06:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvxVgWlb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393550AbgDOGWV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 02:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732711AbgDOGWS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 02:22:18 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034DBC061A0E
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q16so4753220pje.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7ztLwR0nrzj14bfkYxl4aJo2UR6d2mLG0ia7JK8sEE=;
        b=CvxVgWlbWjZSIJo5Xm1E2EQr1dEP5seT3eF+i8JK2W/3XQ/jyY2U3u6WQCqFgodlET
         O0bcdK/L3W8CEXqMemVVI6jAYYGBl+tjh5tAiUw7HNVvOOecm9876AFBDxIFY3lCGyIr
         bm+zH0C25JB90ZIM/5besoq7HEVcxXaVu5UHEgwAglxGnozMaw+KqAfpw5WznYRzRXYX
         7PjHgkkWfU4ErZbNZQJo/KzxfU7+JtN6ZLHtR5aBelXwVO0PYLsEAvWs4ff36O6SuaB5
         +ElhUSMiZwDH/gqu0To6GS6hZYvn/xrFVgCPUL2Ts9xgGJ+QFJE5WjqUU96MFtNWsFUY
         mbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r7ztLwR0nrzj14bfkYxl4aJo2UR6d2mLG0ia7JK8sEE=;
        b=DN0FO4xMklJ309d6TYocYnggM7PLiF3yrlLme6YF7omTbr3X6+EkFOzWVLuO2QzK5f
         GyC27bYo29vLUIdh+y8ZLxTOqam6Ag5TB/Ulk3tAMhQObZERyw+SQPKh6yOfL7Qn+YKp
         w/WxIQpTV5+IaIPshfT1n1a/jPpcVV3NRGr88j2zYLy0XaBWjviig/lb2M0NGO5FpFt1
         p+no+Owy2a/GvRJ7aQruVAQUDQyz6p7H5hlJD3lBB8wV2OLdMRwUaBscMWe5H4e70bWZ
         7dJFtwl8Yyz3yIkDGjYQLUeU21XFFyC8SDsDb1UIZPy3z47/PbMMNMcoENrlhI438R7e
         z9gg==
X-Gm-Message-State: AGi0PuaBUQYWIqn9kbl1KdtCj2j0/ywv2M+WExqjyhDQyueT8jNH8xtY
        9fOOaF4fqZJZ2jwhi+rj/YJs6Q==
X-Google-Smtp-Source: APiQypKWBS5ovDriytB8DRjNlCjsW7YgYHmuwGauDfW3GBOM5hji6Wr1BmawS8I+rA7IQhD0HZadoA==
X-Received: by 2002:a17:90a:ac18:: with SMTP id o24mr4468175pjq.62.1586931737426;
        Tue, 14 Apr 2020 23:22:17 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id nu13sm14032899pjb.22.2020.04.14.23.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 23:22:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Qualcomm SM8250 PRMHPD support
Date:   Tue, 14 Apr 2020 23:21:52 -0700
Message-Id: <20200415062154.741179-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add rpmhpd resources for SM8250 and add the relevant node to DT

Bjorn Andersson (2):
  soc: qcom: rpmhpd: Add SM8250 power domains
  arm64: dts: qcom: sm8250: Add rpmhpd node

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 51 +++++++++++++++++++
 drivers/soc/qcom/rpmhpd.c                     | 19 +++++++
 include/dt-bindings/power/qcom-rpmpd.h        | 12 +++++
 4 files changed, 83 insertions(+)

-- 
2.24.0

