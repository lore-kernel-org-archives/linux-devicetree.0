Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36F2C83000
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 17:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD69D208E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 17:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btf9HJsI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgD1RxF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 13:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbgD1RxF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 13:53:05 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9B0C03C1AC
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 10:53:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d17so25742323wrg.11
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7ZheI6bSLrba/+brpRVrq5vYClF+WQ9iVO178jEk78=;
        b=btf9HJsIOuNOn/IaKbfEXolv40jSRzhjuA7EQllCso1sWwBvadsB7piU0hkDwFkkRG
         LaY0rDWvMUKkER6yps4hDEpVnL0fVqydIPLDTQo63yH6uPIfFJNB8jGZBOdwRYZGKCYL
         BSTV9m9vj4HDIWkBSOeFIYrD3pfTLjVSy0IjdrJvAlmOlyJE4bWWR0NSzr0dptFQ90zI
         Uz55v2Aego1u6y92cVjuPpMztMf2e6mr0bHdHBFG22uDECmKCdAtU/l7wqJSuXnGifdz
         9vJFSjsRbToibdoDhCJXMnWg4cJknVMhLuOw2zE/PKHpaBnwqYeyJtTbE2iGgsKdy1rc
         +WEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7ZheI6bSLrba/+brpRVrq5vYClF+WQ9iVO178jEk78=;
        b=dN5kwb0jjRrdQb2z1ML41On+s+RuCgRy/J+7k9w6xrhzRq8XwOXikXTUrhqy3ZCyPq
         qAfMBnDrKvPzvfL42826uSMsIfDb+Q3V4W17rh1NZ6Fj5JW5qtbqw31MtOX0N20xRiRb
         7V2+G11Q6+4h6FiWaClo7/i6iYn/Db8Xak4cbPQX7Z+RdeW4WSKWF/teZCwMzH+y8gPp
         i03Nyq05pQjVSEpzC4kXUfM59+XRpooO6d0rg6KSMz86xpSuqzyNIEJBNxDNoDT1nfsq
         jHpoYeBbQAkv4cOSAReKjXOTkZUTnKt0qJRXfYj6czZUkHW6/7iCTCZvRpocFmq38dis
         KCrA==
X-Gm-Message-State: AGi0PuZNwj8Jl4PM01K/kDOFzOS3P8tNcQnVIeAMAPbH6PwMgvez4Jar
        caIpd4F5aVWwAHkEXdWnVYXQPA==
X-Google-Smtp-Source: APiQypJBzvsMCtmM5SRHuXXkW8Kz57HKLHp0Lw/JQvJ56JGgP4HXd6+ek1foHwIi/20tTjW8a25S/g==
X-Received: by 2002:adf:f784:: with SMTP id q4mr34356002wrp.102.1588096383541;
        Tue, 28 Apr 2020 10:53:03 -0700 (PDT)
Received: from xps7590.local ([37.120.81.28])
        by smtp.gmail.com with ESMTPSA id k9sm27936467wrd.17.2020.04.28.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 10:53:02 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 v5 0/3] media: ov8856: Add devicetree support
Date:   Tue, 28 Apr 2020 19:52:52 +0200
Message-Id: <20200428175255.1608569-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.


Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 140 +++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 192 ++++++++++++++++--
 3 files changed, 320 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

