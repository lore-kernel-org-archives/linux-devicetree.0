Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9D4C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2592D20738
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qr8NpwFv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgFEDtp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 23:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgFEDtp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 23:49:45 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFB5C08C5C0
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 20:49:45 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id o11so7185968qtm.7
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 20:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=p99Rcfl/aySHjDwEOcdqr/T7gyuhzsbPgf2F8y+KRrM=;
        b=Qr8NpwFvc3m9a8cy0y5TtAb4IB8DeLYGbb5haVvGLrrIhrFzjWhUZG+O7YWpolGP/m
         emRGlm6vQIu4bhiMnPzS3XI7I0NN8pfpy7tMgIvMNzEe+otgQ1ujviH2F3XFKena5k1A
         lk9L29WsMJ2j4+g1S/qhEb/j50xEr7r4AEAZYltFaaHEF5i0JDY2F/MYuGpmsEMWQgeW
         Fn0MrtUBzpF4+So2nVUjMu5s080UbTmKdtniHMszTuFDp3E67ISB2M2qmrbr9B3vpBm1
         OsIES6bjYs7zrhCFPdlObvlg1koBj7YXguwpGyd9ll4NE6BDiEnfuMiCJiMC+KTgBFsq
         EbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=p99Rcfl/aySHjDwEOcdqr/T7gyuhzsbPgf2F8y+KRrM=;
        b=RcvH9Pfh98jvnkDtw4N1IqkgXZ4yohEtB1JIHX/GdItvUeTGOnOBdMlD2XhS6mOI06
         1OuQIFyaU9N62LMqg9xOZkJGxteAa/PqYXMUO1Pkg/1mQj70pKdadez5++QHujA8lhTx
         3+PFgcPaqRZIKbs5pQuHbXdguhv+U0a4B5IGi6zvzkuz3Jnjn/j/RbCRBw6KnmGwMAli
         0hHb++XpmuJv0BMZt9sz2pkHOFggiOrw0B/1fBpvA0U6zRYRROhoHF9rYlFBSARSNH2Q
         cX2vclYLVh2a6gbA1tO2EIAhPpGvrbgHp/L0ustCDtm++7JPbrSLP4+81b4V7HjJjShb
         LjyQ==
X-Gm-Message-State: AOAM530153HWkaMrZalNv5PDFZ9zACOUbrx0ICUPf/vdHNEKO0QdZW5F
        wGg1/CulhGb+2YXW4uJi9qVKDC9zuBB9
X-Google-Smtp-Source: ABdhPJxzfWFy3s0SB1OW0cA/iS6Ny7DmGwdbwtZRhHwnw5nDvPgbtvrU9FgFjoR2KGH+jpeHJmPDGmB/ugty
X-Received: by 2002:ad4:4725:: with SMTP id l5mr5042459qvz.120.1591328984178;
 Thu, 04 Jun 2020 20:49:44 -0700 (PDT)
Date:   Fri,  5 Jun 2020 11:49:29 +0800
Message-Id: <20200605034931.107713-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 0/2] ASoC: max98357a: support MAX98360A in OF
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit 1a0f2433d738 ("ASoC: max98357a: Add ACPI HID MAX98360A") supports
MAX98360A in ACPI world.  This series supports MAX98360A in OF world.

Tzung-Bi Shih (2):
  ASoC: max98357a: add compatible string for MAX98360A
  ASoC: dt-bindings: add compatible string for MAX98360A

 .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
 sound/soc/codecs/max98357a.c                         |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.27.0.278.ge193c7cf3a9-goog

