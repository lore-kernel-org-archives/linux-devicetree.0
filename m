Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF53BC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD0E1206F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpIGXuWW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3KCT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 06:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgG3KCS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 06:02:18 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE7BC061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:18 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id m16so13608341pls.5
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2QHOBQ+Sp4WVdx5kDP6cQT1aif1NuTz4ehhBg76Yns=;
        b=rpIGXuWWVCpza2uX83lNvd9h+p8s1821V71cVPkAvbb/U12Vk6OmW5PG8dsvg8YdwH
         C8/bazyQ1odWp7hE01uIXVP/WcDCbepEU09GrNT51toU9mLPPikgsCKPhyqwDrs2WlwJ
         gcr+BFVEluBiYQV0mRKJLuG6jBuxBptpp+FKfay5wpx2J5BqBf6rUK0MTw0YhNKMBs+G
         T1P+1zHiGV/HbXoR0uL4JSfcIpMBVpFgj8Ycm+1EKKKuZnsPBGmKFy+cfT+RNMKip8U8
         x5tKOx87FA6/rorQfEG3Gn5IqtE7kDpiftTh1u+CDu8u1dPpK64sBW7hXivK3brszqVE
         CuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2QHOBQ+Sp4WVdx5kDP6cQT1aif1NuTz4ehhBg76Yns=;
        b=YnMe1+D5yu2Hq2otGeb0VicxCvTJUGPhmm1dVE6zIX+mVzfS8JeLuqRT2ojjNawJyx
         OH+EoOd8OHX7YOKPEauZkQUMRRb1ATBsIV8dmbE7fpnFWvPpihw5jqONYHAJOgALQyVo
         JW/M41Bpd1uL7c90Xocf0LDo8xGazZyNserIovczPpoQba22CC5pR9TNi7ggA2WUHubu
         g0jNNiFpxup0EG8nMI4Q8j1nX2tKQiSveMJRuytMRRdjvFUkGzJFn5KE9ElGxlFNqWiO
         miH/fl61uUstIgxQvIySoysbDzGOcbyG/pXQRkEMGgTfQHtZABpP36t3wTKdqk/KaE84
         kEog==
X-Gm-Message-State: AOAM5302JQj4RumpNFYoz0KVqQr9ekdnR9ZdGEgwtKHsCASiNE44j52M
        EuOu02qZewsbwS2EFRHfYcw4swQv
X-Google-Smtp-Source: ABdhPJyWIMef5yoBlir+5MtCbK4myBg0gv6rlN4l9L6TDtTsYxLbY5efopw8ZHogIalG+mCAHm357g==
X-Received: by 2002:a17:902:c40d:: with SMTP id k13mr13901771plk.220.1596103336599;
        Thu, 30 Jul 2020 03:02:16 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:02:16 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
Date:   Thu, 30 Jul 2020 10:02:06 +0000
Message-Id: <20200730100209.793-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
Some time Ethernet interface come up but no DHCP request
is forwaded to the Router, this happens quite offern on
my side. Adding Reset controller to ethernet node FIx the
inilization issue.

-Anand

Anand Moon (3):
  arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
  arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
  arm64: dts: amlogic: meson-g12: add missing ethernet reset ID

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

-- 
2.28.0

