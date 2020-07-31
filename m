Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5513C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A842072A
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahMfSYnn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731896AbgGaIUw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 04:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgGaIUv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 04:20:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F622C061574
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m16so16713762pls.5
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0M5k1hgIS/4BRGKQ48rck/0wDyqMqHmZifFqKqCzKyM=;
        b=ahMfSYnn7PJx8wZSkiNs0sWm5JvgBZ6cvhTfGt61ysKqt8Y+rTNJUPwMzqJoE6TL2J
         WXHFzGf48AFP6fZVJ1eOtsX4/TQrg4UGkyvE8cIa8nuaiZfAm/GV6AKxpYAkYtZE+dF8
         em6G+3f3Xz/QeSbosd6iddNXYXzc+BWyPcgZph7G/+O4w8FvsbrIrXYPey9rFQxgAUVL
         IPgWPtEgoKTQ/GvNybP8Do98lzLmbF8JYthebcRJcU4PFCQgKXPhyMssvq0LMOoEThCj
         IF8MT3Rz7aVpCikXAbHUuMAWZ1lOtmq+pSeLYgbVK7MSAz0tlJyFQS6LaxbcS3tzAW23
         oa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0M5k1hgIS/4BRGKQ48rck/0wDyqMqHmZifFqKqCzKyM=;
        b=QXncybBNVOqZNVFHWY+3eqCmfmAEwt7Xflf4IzGIY2drtcPsckuEglddI2UVha54Pr
         lZpfKTwwBxM1nX/x+sUWC5SPeUUc0rrEpbLe5kVqPa5PRKy6nnVmfxUhtlqSkQWCi29E
         6BTmI/sEy8SLqQo7BNSJo8fjlW8FU62ndLrJmAP7mt5e/ZARuYOqa0eA0QjWQ98lBad5
         KZeRwsDy7m0Vt8ApiJ23FAQdjt25cRjfCJYS/+9LwUtyETQnAy+CIRA4kOXCB0YEWxkl
         kwhg0xLIlhGHhMm4k+JCjMFf3oHMQY8TcjmO10UpG8vCaAZphQ8Fix7a6NnjX1KMw1yi
         CZ/A==
X-Gm-Message-State: AOAM530XkeAW27Mo4tDxc7Kgibf9qteJBV16qiTuy453WpYFb/HnXKXO
        RUHtZCU/CCCnORnqRNJJL+hf3PSR
X-Google-Smtp-Source: ABdhPJw1ENiAY0J4GydlD7exYa4eFVMlQBHwtW1xJL2bzrDvdHI3xnPrNI3CN/jyYE99k3lxqjbDQA==
X-Received: by 2002:a17:902:7246:: with SMTP id c6mr2734700pll.17.1596183650726;
        Fri, 31 Jul 2020 01:20:50 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 01:20:50 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 0/3] Add missing ethernet reset ID for Amlogic SoC
Date:   Fri, 31 Jul 2020 08:20:40 +0000
Message-Id: <20200731082043.1682-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add reset id for Ethernet to reset Ethernet IP.

Re-based on linux-next-20200730.
Could not test as their is build failed on linux-next-20200730. 

My observation:
- Sometime the device on upgrade of the kernel
  don't show up in the network.
- My observation that Ethernet interface come up successfully
  but no packet get forwarded.
- This happens some times on my network.

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
:
