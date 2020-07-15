Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B891C433E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:03:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58CA320658
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE7dK7a5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGOQCg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 12:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGOQCS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 12:02:18 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F75C061755
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 09:02:18 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t6so3296523pgq.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 09:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzwdaSJqXx3p3pleSnirAKc5FuZuMmD64i/5xQ4XNio=;
        b=jE7dK7a5lhTtjrQLAsCwCspzIedtM/RdEOZA7aQDY8KSIQAh5tOi9EzKzN2MVp7xmk
         U6KixMBnY4Eb80roYMY9aQ47Ovx7D6zwsohn3H9DppKCQT6Evysny3M/mSA2EkRvmlcF
         vaQV4qxXLCT5cbEA1HoU+Px/knDoi55/JU46TYRwVwwboIuP0y5mqduAk6ZOVOMxA2oV
         s3zR/AVB3lWrbQM0WmKfkzu6qBbMQd9TBRzVt/BcrEYcei9vmJQh3NruUj8M04KHAGht
         idJzYwWYmMfzJWjubiAsTG/f+rge59fTd00EbGWKNsTNxl97UPoFX8CW0BSldgzNwJ0g
         vecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzwdaSJqXx3p3pleSnirAKc5FuZuMmD64i/5xQ4XNio=;
        b=Rgo0sSFJ9xL7RRHodXG1BF/WHvmdgIyFjfExvitWB7uEMUVx2VGLMJ/KjASMIsTK77
         s66RZkshfVANf3zOVbTxi9hr8EQHKf8Q01ACyuEMcsoNnv+9ElnYLhZWOntq75qjgBbb
         T/GI6bPmbyW3jHEE2bdl1vn84UPjTo5FHcEEyUyk7wNFX/VEQgaiJHxifEtrUGkFE2kc
         8A/aMs5k+woF0CgminbE/aJWAPmbubaCGf1tN6wfzX8ZhLm5GEOQ7jwW1sXWpnBSLP+f
         WKR2nYRBQlDd5Hso56y7W0jINQeB0xAi1h7UyRvsr21zDAYXho0siqc1HgOj6eU26i96
         Q68A==
X-Gm-Message-State: AOAM532hOnenkM5bXXlkoGWQoEJGEObcDtEv2pa0UI9gnP5TJVfelD/v
        jvdJqSrdFjy+QHsZDng84jdnVsxT
X-Google-Smtp-Source: ABdhPJz4CQCJOkCHojwVDLWtNcmCdZv764QmOe880vUng49/spIODUdMB9fwR87vn3J3xg/sM54wbw==
X-Received: by 2002:a05:6a00:2292:: with SMTP id f18mr11595pfe.192.1594828937689;
        Wed, 15 Jul 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
        by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 09:02:16 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCHv1 0/3] Enable RTC on Odroid N2
Date:   Wed, 15 Jul 2020 16:02:06 +0000
Message-Id: <20200715160209.652-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Inoder for test suspend resume feature on Odroid N2
we need to enable RTC module on this device.

Following patches enable rtc on Odroid N2
but sill rtcwakeup is not working se bellow.
Any inputs are welcome.

# sudo hwclock -r && date
2020-07-15 15:53:27.706883+00:00
Wed Jul 15 15:53:27 UTC 2020

# echo 1 > /sys/power/pm_debug_messages
bash: /sys/power/pm_debug_messages: Permission denied
# time rtcwake -s 30 -m mem
rtcwake: /dev/rtc0 not enabled for wakeup events

real    0m0.003s
user    0m0.003s
sys     0m0.000s
#

-Anand

Anand Moon (3):
  arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
  arm64: dts: meson-g12b-odroid-n2: Disable virtual wake RTC
  arm64: defconfig: Enable RTC devices for Amlogic boards

 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts  | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                   |  1 +
 2 files changed, 19 insertions(+)

-- 
2.27.0

