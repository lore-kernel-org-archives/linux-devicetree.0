Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C4AC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A794206DB
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEeR6W2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgFEDts (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 23:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgFEDts (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 23:49:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1BAC08C5C0
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 20:49:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id u186so10541474ybf.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 20:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zUE/Cjgd6DbqupxIZO5zw+HWjN1NKeI0i0EBJrWyE6E=;
        b=iEeR6W2zBV70R/bSFM5f67tGDL5bjIdJVzxdVKjDRIcswzlpTMD2r1+VhZH215sTeW
         ARcypWqIcdFd7pBT5fHJpqMwUukfjyIpUpNkoZExv3yWU8/vXgAemGS1w/ZB+9i0EC2w
         NDclYfYgUW4QFI6vBRl6kmjj2DBBF49gdLpf0/vCA+Fa70gh9btjmLGqyGlBpmny7Md3
         9SoUMsOya1hV2THbF0/91/RKedBrppN+A0ePooopPRyO4P/nmu6bSAYv7MTLtjxWI60k
         6kIpxuT2Bmod7HwnLbo1l5dFYMy1TtOBONFm7hOi9JYmK5JBgGiCga7cnDUrBPC+Q8Hm
         86aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zUE/Cjgd6DbqupxIZO5zw+HWjN1NKeI0i0EBJrWyE6E=;
        b=aPwikAm2jr2qfnnlOUGeYDL2UthTv3iXrqDYPxOoiB3ihf9N0RdN63BEV4HQxt/M+m
         I+QQ3TLqbFIaIis/q/BdWtlZ7+L2jpnc7KuEBQHhKjYt2VF9dInRnIhdrwa7b1iqnwDk
         NkVanClrLnasPSwrRyoxS+2HAlTveqsq38IIBg1IWQ66XUZI4zoOrYCpM/cThrD5ZK21
         9XvVq/5KW7UxwdVd28wJCcLzDAbAjM1gZ02PJorFaz65FP+IcPXl8U3BJY5lCG5K4seU
         4iSVJMy7v+WNns3n35Ohu49CBisbOzK6ws+vsCGFc4MnWXh9opio8VzOmzDRUe5Felg+
         P6mg==
X-Gm-Message-State: AOAM532CphfoztI3ZQ1TIk/pyI+fl96zuQ3gcqOTQhWpJY5Xt/y5eK9s
        h5hQ3uaiQ1Ri8LN5Nn4hWklFMUClgkQO
X-Google-Smtp-Source: ABdhPJzO/LSnH/eEpFBjZnM01ecU94C3EIsJHao8zGgAC2ui2MTGomIhL7w7dptKMtO9fpRBcKf7amP1I5Uo
X-Received: by 2002:a25:ba03:: with SMTP id t3mr12723512ybg.425.1591328987534;
 Thu, 04 Jun 2020 20:49:47 -0700 (PDT)
Date:   Fri,  5 Jun 2020 11:49:30 +0800
In-Reply-To: <20200605034931.107713-1-tzungbi@google.com>
Message-Id: <20200605034931.107713-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200605034931.107713-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 1/2] ASoC: max98357a: add compatible string for MAX98360A
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
Adds compatible string "maxim,max98360a" for driver reuse.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index a8bd793a7867..4f431133d0bb 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -125,6 +125,7 @@ static int max98357a_platform_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id max98357a_device_id[] = {
 	{ .compatible = "maxim,max98357a" },
+	{ .compatible = "maxim,max98360a" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, max98357a_device_id);
-- 
2.27.0.278.ge193c7cf3a9-goog

