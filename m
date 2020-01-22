Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74C6C35240
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 10:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9034524683
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 10:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Spclnwq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgAVKE4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 05:04:56 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:55169 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgAVKE4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 05:04:56 -0500
Received: by mail-wm1-f51.google.com with SMTP id b19so6145092wmj.4
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xr55sisUQJBKj6Q4LrYEYaq2XUN1tVNpifr1uUk54Rc=;
        b=2SpclnwqwF+ZtOGLn5/Pzqi457wTIzOMugjwrvqe2e6PJR797j6ImTx5WFNp7pJf+D
         0oCYEuyjwuXAOyrBfb48iDlGtYXJ9iOcGW5YYffBgwRYC3gqYgczwyagZCk8Du3/RZRe
         sVU4/NdlRN4MU59vussJBc4x1Wxp+5eXR12w1xgIxs+sZbBjapfCxeJOd659ECntnogA
         u8/25V+tAYwHIh2eXheHPeMrHlgoEqotUdWOHcpexUj1fjvxMfVZXxE0C6H+AXpm4AWf
         83HNZuCMrZVH9ziWGen75wPXIo5Zg+UUTeq6R7TbJBbiJ4BcYL5FzY3amnjSAs80R+iQ
         ONPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xr55sisUQJBKj6Q4LrYEYaq2XUN1tVNpifr1uUk54Rc=;
        b=PQiVk+UvyqTDQv99fgab+AWWbBEoKPXgmwNMUXzak4ptG7GBeFgfGBXj1y5y6XU0JQ
         LaYOb4iLOHEKE8CYDdBlHDLOhlD6EqNX/yaLVnmScIsReOMkQ9oNxexDVTpnWVFlCHTp
         D0x2AfkfJERVBiOEg/B94QH38zYcwtK9Y/cBuvJl8nsnIseH48mJLUBTsDeXD83APVlc
         sJthMslGopVrfXfWrn4JnPg7zHw2qBZBzyzFdgeibNW/sbLuSRxPbWUiGfb6z5kZOULH
         xJjh3UknatA87eRVzSEx0u9znKEfTVAXPspcH4N3rxhCsn/U0O8rCTOOKmkQ5ab4Js6G
         BIBA==
X-Gm-Message-State: APjAAAUgkIQIRpA6jzET39K8LUun5ymllB+BxXG+zA3PmtrHaHzA/jKQ
        3fXyFOLZrS+RxO8TdsQUwg3ttQ==
X-Google-Smtp-Source: APXvYqxz2tZXmYV+E9Ld+AOXUw6DT+T8VYNXacbGMy0FhKPCjM0ksmIp44lJOlHnO0vFIuRXZGibVg==
X-Received: by 2002:a1c:3b0a:: with SMTP id i10mr2197195wma.177.1579687494505;
        Wed, 22 Jan 2020 02:04:54 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l3sm52237648wrt.29.2020.01.22.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:04:53 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: gxbb: audio clock updates
Date:   Wed, 22 Jan 2020 11:04:48 +0100
Message-Id: <20200122100451.2443153-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patcheset provides updates related to the audio peripheral clocks
It adds the peripheral clock required by the internal audio dac
and reorganize the AIU clocks into a hierarchy to better reflect the
behavior of the SoC.

Jerome Brunet (3):
  dt-bindings: clk: meson: add the gxl internal dac gate
  clk: meson: gxbb: add the gxl internal dac gate
  clk: meson: gxbb: set audio output clock hierarchy

 drivers/clk/meson/gxbb.c              | 21 +++++++++++++--------
 drivers/clk/meson/gxbb.h              |  2 +-
 include/dt-bindings/clock/gxbb-clkc.h |  1 +
 3 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.24.1

