Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED3AC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46E4522B47
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="rcLiuoZq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2PH5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 11:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2PH5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 11:07:57 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEAAC0619D2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:07:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id o1so11928184plk.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvGgX98SKjMQoRKZbI9936P9W5fZLljXNQDqIlMDpsY=;
        b=rcLiuoZqxJ6ISe9Emfs1RUJFobO4/R+4DnZzN1Ktn1g1L5KzsWiqjnvjGUUVZBeBeR
         n8sy3rlgfSBA7V7pyzH8RXWwEDxlqsEMdfE02ABJR/G7encbCkpolgT/sAxttxnQw9f0
         EKYgiwnWx2d54ochCwGuownPC34Gf9Um2pATE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvGgX98SKjMQoRKZbI9936P9W5fZLljXNQDqIlMDpsY=;
        b=mxB/ZPCG5Li3xoqDODbQ49LTiWRJp3Apo+3SjCwjEEdS6tX95ZjVD8EcNbFDPA2/kO
         H07scprQC3i1FzVSRyuzVr+ob3y+6kHVLjhDxAe2HsdAhdCPf4Lswc2XxyEqETGCdqnq
         4kaUO6QeY/uuMiWaKxb4lf6u5TAivj7kYDG0X6BHoQUOBPoB2E1bhLOUAXoXzu2w6buP
         /XvZd0U/zyeFKNAfpoiG9q4suoOIoFqo0X22E1YKnxaCeFRoL5vK5S1KrEK1IRIY5Vx7
         7Q+9fbU8/VSrm0h5U1N9gil6HEOZNJUSemlkBPMSrdWNiPbD6C5WQY2z+Ze7ozF+eJCi
         /Q9g==
X-Gm-Message-State: AOAM530uvI79b8kQNMgNmUyeuC3tOPwRtoDpwhZUjEcK3bM3GUdZhp6F
        YWTU56BG/pOyarkuF+qF4LEzUw==
X-Google-Smtp-Source: ABdhPJzSeksyXN2A1Ak2k+FQwIE0da2EnOih733fal/WJcLqupC20z8nSS4eICxDAH2EP3M+uMqFjQ==
X-Received: by 2002:a17:902:fe10:: with SMTP id g16mr6301433plj.227.1596035276186;
        Wed, 29 Jul 2020 08:07:56 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id q11sm2688058pgr.69.2020.07.29.08.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:07:55 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/3] ARM: mstar: Fix compatible string for pmsleep
Date:   Thu, 30 Jul 2020 00:07:45 +0900
Message-Id: <20200729150748.1945589-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This fixes up the compatible string for the pmsleep register
region based on Arnd and Rob's feedback:

- Add "mstar,msc313-pmsleep" to mfd/syscon.yaml
- Remove the unneeded binding description for "mstar,pmsleep"
- Use the new string in the MStar v7 base dtsi

Daniel Palmer (3):
  dt-bindings: mfd: syscon: add compatible string for
    mstar,msc313-pmsleep
  dt-bindings: arm: mstar: remove the binding description for
    mstar,pmsleep
  ARM: mstar: Correct the compatible string for pmsleep

 .../bindings/arm/mstar/mstar,pmsleep.yaml     | 43 -------------------
 .../devicetree/bindings/mfd/syscon.yaml       |  1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  2 +-
 3 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,pmsleep.yaml

-- 
2.27.0

