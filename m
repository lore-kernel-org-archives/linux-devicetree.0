Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCD7C433E5
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E764E20792
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RxxRFot4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgG1KDc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 06:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbgG1KDc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 06:03:32 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17353C061794
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t15so11209065pjq.5
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lamJR30/OZj5TtLicXm1XN+ym7SAmHsDsmqcmVGRyfU=;
        b=RxxRFot40FR/bzu3ktrKn9CPPG/GmEqiNfU8dBveK4OoBLrgle5gaqfDmWxfcHm/oB
         BO43bj8T4IQ1t2RVyeRoVKPLxUK+pVQ6GeVG4uXKMJRQ5A+pRvzIKCPnHM9DsNCOB7ZP
         5w+P4bKfL44ir9Qb6QdhQ7DIkez9zfRf8yNyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lamJR30/OZj5TtLicXm1XN+ym7SAmHsDsmqcmVGRyfU=;
        b=DhmrIhQU1NfBZB6mQvRDyCF+ppj1HZ1g2gAgTs+dksu9a/qF71PD0lQUn628qXHXOQ
         cVUo16k+tD4hRhQjGw9laGbb0dbd9bGcA0Hun4jZrOGx90rsgKGhqlH+XFsho+UNMU4K
         k5/EBx/1+3BYkBR5X8De0WWjm7zj6lvakg3kCemwaqL2O8u89coevQ8jqy0d6LgDDcFY
         4rcOXwIXvLWca14+sz7RCfAg+r0cZajyhyZ+2bn7ScutBQSygCCq2qfaCCTS8kjNlh9E
         4DP9AiiKrHV4HkEzJ3Uf8ts5lI863VBh90EhENLyTQMoqdJb/stwTk+oJF20TADHAtAt
         AGOw==
X-Gm-Message-State: AOAM533u6THdNccBQm1jpkoGOms9JhjJbeNiU5AUOKSXBAedTmEwII3z
        fBcjqT8dMcNJlrp6VgO0H9Hrfg==
X-Google-Smtp-Source: ABdhPJyspgAUCtVEFnqzqoStyWQgTfKDx8JEuEfdIxxoRbTIIAGvK6A92pC9SOAS3MaqsWeq8F2C7g==
X-Received: by 2002:a17:90a:ca17:: with SMTP id x23mr3720648pjt.194.1595930611548;
        Tue, 28 Jul 2020 03:03:31 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id u66sm17779018pfb.191.2020.07.28.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 03:03:30 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 0/9] ARM: mstar: DT filling out
Date:   Tue, 28 Jul 2020 19:03:12 +0900
Message-Id: <20200728100321.1691745-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds a few low hanging fruit that are purely DT changes to
keep the ball rolling while I work on series for more complicated things
like the interrupt controllers.

Summary of changes:

- Adds the IMI SRAM region and sets the right size for each family
- Adds the ARM PMU
- Adds a syscon for a lump of registers called "pmsleep"
- Uses the pmsleep syscon to enable reboot

Changes since v1:

- pmsleep node has been given it's own compatible string alongside
  the generic syscon based on Arnd's feedback.

- dt binding description has been added for the above.

- To avoid having to update MAINTAINERS repeatly I've moved the existing
  two binding descriptions in with the pmsleep one in arm/mstar.

Daniel Palmer (9):
  dt-bindings: arm: mstar: Add binding details for mstar,pmsleep
  dt-bindings: arm: mstar: Move existing MStar binding descriptions
  ARM: mstar: Add IMI SRAM region
  ARM: mstar: Adjust IMI size of infinity
  ARM: mstar: Adjust IMI size for mercury5
  ARM: mstar: Adjust IMI size for infinity3
  ARM: mstar: Add PMU
  ARM: mstar: Add "pmsleep" node to base dtsi
  ARM: mstar: Add reboot support

 .../{misc => arm/mstar}/mstar,l3bridge.yaml   |  2 +-
 .../bindings/arm/mstar/mstar,pmsleep.yaml     | 43 +++++++++++++++++++
 .../bindings/arm/{ => mstar}/mstar.yaml       |  2 +-
 MAINTAINERS                                   |  2 +-
 arch/arm/boot/dts/infinity.dtsi               |  4 ++
 arch/arm/boot/dts/infinity3.dtsi              |  4 ++
 arch/arm/boot/dts/mercury5.dtsi               |  4 ++
 arch/arm/boot/dts/mstar-v7.dtsi               | 26 ++++++++++-
 8 files changed, 83 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/{misc => arm/mstar}/mstar,l3bridge.yaml (93%)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml
 rename Documentation/devicetree/bindings/arm/{ => mstar}/mstar.yaml (93%)

-- 
2.27.0

