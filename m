Return-Path: <SRS0=DJdz=7G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02C3C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 02:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC5AB20738
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 May 2020 02:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="utvNopKS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388279AbgEXCiS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 22:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388262AbgEXCiS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 22:38:18 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE28DC05BD43
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 19:38:17 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id z80so14785214qka.0
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 19:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tB9LzyJXJnxo4xmJ3I2jFmQdd+PVH/6joMXkYDY/Q1g=;
        b=utvNopKS/dd38rKDa6bUbUGoDV3x4nFJyf00yg9p+wI4Wh6FjvexNzZ5LEuJYDEnxd
         NJ2hbF2Hn/0JsGedXWNiZ5fBZEb67t3yCD7k9iQvQ1DSdLuTiPzHeaHMriBlX/wMXmAl
         lJnRpjJoHPAGWcg38bGahWiBVwdcbzKepFQnVmEd+pIjErWQdWkzcD89WfaN6LMOSsAi
         bgbHC2wRMQI9cTsvDUph59rnaJp3ysFmI/HetJn5vsXhN7ephdYDgfSwWnhYIccHJa7n
         70bQGL/hku/DOYQyeBA0zacBR1jywRL+s8pm1fPHLRCcNuCLXR5/IHqdcoUHsXNXW7Og
         PUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tB9LzyJXJnxo4xmJ3I2jFmQdd+PVH/6joMXkYDY/Q1g=;
        b=qPZY0D7Y7gvLOyDB23YZe3QtJZWNJzz0L76MzT1RM1SJJ+2vXalzMyhOlZcEocs3lf
         Yu4/u3ABotDVDEGJW/7zBE1EBIKlI7qIhp2mwn6gqCyHlrINs2SN30VDaN6+e+Yl4r+l
         p3ogtzW+lCQ9AHuEVLH0ckWSjwhNkqbjUHshI9FJ6Bi1XFwS9KLtlkKLawdbDm+pFfd4
         jWT2EB71puUrMCs/AuXOyfzMYMjLhKLQP1YWdpnD6IDKJC8n2bJCYd3E9p3ttLiErv5i
         TMRoSkYmrSrdOB9dw+p7dOnpJWqhPPv+O0677hKgm6Qd1ImvMw4l8NIJkIMeX0TG+7jN
         HsCQ==
X-Gm-Message-State: AOAM530GDUAUFBfA0g7f368ke5VxEr/QtGF91BZdES96cCW4TCTxHzkL
        pV8E70G1rP3U+KyvVYx9lQ3bSw==
X-Google-Smtp-Source: ABdhPJwgakWaxEbJdoPoU/YLmpdWql9O7ybgSbPFRaikjhVgK3kj7GSXtl1S3Il13cuqZb4mynMseg==
X-Received: by 2002:a37:ac0c:: with SMTP id e12mr14157324qkm.281.1590287897033;
        Sat, 23 May 2020 19:38:17 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id e3sm11187666qtj.25.2020.05.23.19.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 19:38:16 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865 dts
Date:   Sat, 23 May 2020 22:38:06 -0400
Message-Id: <20200524023815.21789-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.

Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
few changes. Notably, the HDK865 dts has regulator config changed a bit based
on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).

Jonathan Marek (6):
  arm64: dts: qcom: sm8150: add apps_smmu node
  arm64: dts: qcom: sm8250: add apps_smmu node
  arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
  arm64: dts: qcom: sm8250: Add USB and PHY device nodes
  arm64: dts: qcom: add sm8150 hdk dts
  arm64: dts: qcom: add sm8250 hdk dts

 arch/arm64/boot/dts/qcom/Makefile       |   2 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
 5 files changed, 1384 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts

-- 
2.26.1

