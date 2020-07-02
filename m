Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87692C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6296E208B8
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U6AY+0Ik"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgGBGX4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 02:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgGBGXz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 02:23:55 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3EBC08C5DC
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 23:23:55 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id z7so28840205ybz.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Capr5djsyEnhWv3S70+sKnIxhHZKvTK2BCpibA16Fik=;
        b=U6AY+0IkBOoVPB2dSzvaxlfM89ciV2yrEH7+K/7aph/MHWU0rQICZPTeIH4We4nZEM
         lQh+TmddQt/DLQW9PTHOMHjOutneoY9KxRCFcVKFZfj1QfBpGOb49wPJ3YRTUjaVJ751
         v40vf43BI2pl5zr84D0dutjVhDJTAdL/xnmpi4q0siBr09JPhiy8Hpfe0A7wI4qkwR6d
         H50JZc3Ml9AbyVUpYBWk22gKfQntqu6JMD8/vDS7DOO9RrTsbUfXzmP0Fr9ilKR4igq1
         xiLcXoZvgB3t2gtiqW1v7IsWPfbcLyLCv7oOzSL6rGnrVoJtQXsSEI1wNfTgUo3ouaIo
         C/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Capr5djsyEnhWv3S70+sKnIxhHZKvTK2BCpibA16Fik=;
        b=n2fEz1Iapq0+flhKJJ1a2q9912pi8t5nByUaToDF80noyr1JkMv/ZL1AvHIqvGDKXG
         OQjF4XNZzqVeywR7/i7sDo+yhOwuL2dbdcspkpd4KIBp/kkVUWSu8gvI4ts2gz/8VZyX
         3gcdkzmsqwN5mTkZJKerPbkP8pXTYG6d/iltZwMEXIoO2k3HH/V6ndITZXK9BoskOM/w
         Q3mfmqWNv+XFiNURjJFjlOSRu6u8RGX/SJFLN1kgpV6AreeH8KafozY/vnDU0m8D1D/n
         +SN+jVWSHCtA8QFQAEZmCQKSYoTuYnakJcBiddPY7PlwAn2UTkBhkqxkHfmxHIeoByCv
         AjeA==
X-Gm-Message-State: AOAM530ZJIGT/PEHeOJRvpnfAhYAq0WBDG3ppd+Pv4/Uz0fVSpzn0Ioe
        NtccolBGzLinuAZKtCOOAADpjUFKdJvc
X-Google-Smtp-Source: ABdhPJy7W3Ner6I27HbAR57C4mAp+BrPPho3YMhBs5gzoadgRkL+9hBU76n9YuqygWflTzhiTwqEwLmhnULw
X-Received: by 2002:a25:77cb:: with SMTP id s194mr36730723ybc.216.1593671034543;
 Wed, 01 Jul 2020 23:23:54 -0700 (PDT)
Date:   Thu,  2 Jul 2020 16:23:18 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.2.I0a814b246cfe47f8dd1e25553ee881cbcfd0d8eb@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 2/4] dt-bindings: regulator: mt6397: Document valid modes
From:   Anand K Mistry <amistry@google.com>
To:     linux-mediatek@lists.infradead.org
Cc:     hsin-hsiung.wang@mediatek.com, drinkcat@chromium.org,
        Anand K Mistry <amistry@google.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Document valid mode values for BUCK regulators.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2: None

 .../devicetree/bindings/regulator/mt6397-regulator.txt         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
index 01141fb00875..c080086d3e62 100644
--- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
@@ -16,6 +16,9 @@ LDO:
   ldo_vemc3v3, ldo_vgp1, ldo_vgp2, ldo_vgp3, ldo_vgp4, ldo_vgp5, ldo_vgp6,
   ldo_vibr
 
+BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
+
 Example:
 	pmic {
 		compatible = "mediatek,mt6397";
-- 
2.27.0.212.ge8ba1cc988-goog

