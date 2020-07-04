Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03728C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D36FD20885
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 14:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrrCw80n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgGDOfz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 10:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgGDOfx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 10:35:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A54C061794;
        Sat,  4 Jul 2020 07:35:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id t25so35613120lji.12;
        Sat, 04 Jul 2020 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX77pyYaI7t3osrGVixdaT1lC+LXvMPuit/5ILLdKK0=;
        b=mrrCw80nucNN86OBNz9hzWdT0d5Nva04qDeRs4B9u66jpyu/TVP8po9eiRKUtgjiJl
         SBCUtSd0oyC4bQKuIczGOjn9yelj34Sm3vdTSFvbDawjF69I3LmcQPIRZO/CMbBzxGho
         kkbTfC5a7P3bpKQMLLotYYtYF84faiovcFPvhWr7NKxiZ7SW8+x+eithmNofw/vcEnaZ
         VhIf/1nxQVef5WOpklyf0zPr5q2FTdjX6oRFMtjw0oWN4/XmuCUAXLvF2Ce8hZO9bpC5
         5odMnP1g5URmcRlWMuDmBVUd7ZuRjjMC9HTyPfHbsK9JGrK6kVsu9tB8yXghZcXSJTHq
         b5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rX77pyYaI7t3osrGVixdaT1lC+LXvMPuit/5ILLdKK0=;
        b=KpVansuInIebWRgV9s+abV44gdhbI9PdtyOzySTR0biF/ppdJSYvvUpbcmOrr/CXFz
         MQW8aCZLpdM4tUhs9MQjp7zOG2CmU1SxIHIZXChbr8OEcw4riNVj2MjemZfUdHkPDrdk
         FTWN3CyPnqFs9sdkasTh9BY5mZTShK2Mzeg6o/hiyuWzXiJ+86AA435PqW7n3qkFt+oT
         JcKeAl7o5yupT1d6ldmAvVdk8nzpzHNyOXPr+9+/36qWCCvyo2/C7YSxgMpaabpOyZgg
         kde5Mg4d/icrJqvPLMTgu+xjTvmZK/M/6S4qOYK46Nfml+LEFaBTO+1H259cFmcO0dVH
         n9ng==
X-Gm-Message-State: AOAM532cLNZZ3L7w2HpNGRhOz6AEshaxw345wVCiEu64vbp/tnlyM3F+
        UE117q3WljYB3ZcTc1Y4m+U=
X-Google-Smtp-Source: ABdhPJwKJGdn4otFvTUzOLOqyA3r/4en6H8xyAu7TIq7U0TR4mfCjZjq9t9D05dapbDK374ClSPXMw==
X-Received: by 2002:a05:651c:3cf:: with SMTP id f15mr21042061ljp.365.1593873349874;
        Sat, 04 Jul 2020 07:35:49 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id 144sm6407556lfm.87.2020.07.04.07.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 07:35:49 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH v1 0/1] dt-bindings: fix simple-framebuffer warning
Date:   Sat,  4 Jul 2020 16:35:43 +0200
Message-Id: <20200704143544.789345-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Trivial fix for a long standing warning.
At least not fixed in drm-msc-next for now.
Just in case it was not fixed by someone else (Rob?) already.

	Sam

Sam Ravnborg (1):
      dt-bindings: fix simple-framebuffer example

 .../bindings/display/simple-framebuffer.yaml       | 45 +++++++++++-----------
 1 file changed, 23 insertions(+), 22 deletions(-)


