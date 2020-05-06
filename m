Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C81C28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29DDD20753
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 22:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qZJ9bFNZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbgEFWRD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 18:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728621AbgEFWRD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 18:17:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D30C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 15:17:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y24so4503303wma.4
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUjq9zdR5mVgxj06Giq3bGzbwjzAICwYSNtIRxAIees=;
        b=qZJ9bFNZENtTEJvJsww0cAJqKfD6LPZ9Pqy9QF00pitCHzsnXJlr4GLfaltBosK4px
         7MG+RiXLeEJrUYyVuI9KgT2bMtrQtwavR8pig6XmMPeBKp2RyhKd5jNIuqrvq6qMcetK
         tma/mWCCFc5JcAPkSjN5nifhDVP/180+VI47HJ08bMDuuiYlQxCt5MOFI66nMw3KvVt8
         KTHLIgnkL6pY+q83q7XRSHjsQF0hoeUrA9ZvRcOAhpnYRkIboRPblc67GXGzc4zA/cT2
         xs4eqbwptlTeSuLdM/evUKODdDlFgNRDhPn5jBf2dn/8Fpvd+1E88H3zTjdN8jwkfMCI
         9XDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUjq9zdR5mVgxj06Giq3bGzbwjzAICwYSNtIRxAIees=;
        b=AtYu1lh/rC4DiZWmM61ChyQwNVevZ60PBu/s6bXSBCaYjbTYms+F8IEkwJ6MZUoARH
         jfPiaczCfMOphZQoCg1WySQOmW4Vo+RFuJuks1BA1AkHxQW+tTYz1WZXME82aqKc6P8y
         yMwYvkUm7ZroBuE+FfXvpPElFLvqpWxbP8NLCzuLLffwfovBgvFaorIAk0v+RWniAYrB
         /CHjrTdn030s7ixntEIiSRHt7+A4AbhisyEBQ3ST9XGxY3V/ujjz5yRV+j33PIDEHcYt
         iBB+P7L8ouZt2r0bjYHTaZpm5YRvorQusJJ3IeSk07D/le4N8K5GoJYWDDMJg7/Kk50R
         eziA==
X-Gm-Message-State: AGi0PuZrSSf3upFaEQPV+OWKpx2ZBmCrmUqg1YgLtkFevNQJ9OCXkm0s
        xSueR5t0woJs5HNDgiQg/gI/IWw0emo=
X-Google-Smtp-Source: APiQypJmOUnBlpx6YnReKzXhkRiueDIdnW+W9TReTq6gD7ElnmQoRG9JpBTNLmgIK/n4KV4kNvc3TQ==
X-Received: by 2002:a1c:f014:: with SMTP id a20mr6559407wmb.86.1588803421504;
        Wed, 06 May 2020 15:17:01 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 15:17:00 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] arm64: dts: meson: add internal audio DAC support
Date:   Thu,  7 May 2020 00:16:49 +0200
Message-Id: <20200506221656.477379-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support for the internal audio DAC found on the gxl,
g12 and sm1 SoC family.

It was mainly tested on the gxl libretech-cc and g12a u200.

/!\
This series (patches 1 in particular) depends on this reset binding [0].
Philipp has provided an immutable with it here [1]

[0]: https://lore.kernel.org/r/20200122092526.2436421-1-jbrunet@baylibre.com
[1]: git://git.pengutronix.de/pza/linux.git reset/meson-gxl-dac

Jerome Brunet (7):
  arm64: dts: meson: gxl: add acodec support
  arm64: dts: meson: p230-q200: add internal DAC support
  arm64: dts: meson: libretech-cc: add internal DAC support
  arm64: dts: meson: libretech-ac: add internal DAC support
  arm64: dts: meson: libretech-pc: add internal DAC support
  arm64: dts: meson: g12: add internal DAC
  arm64: dts: meson: g12: add internal DAC glue

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 +++++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi    |  9 ++++++
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 31 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 32 +++++++++++++++++++
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  | 30 +++++++++++++++++
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 30 +++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 11 +++++++
 7 files changed, 154 insertions(+)

-- 
2.25.4

