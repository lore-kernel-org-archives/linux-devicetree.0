Return-Path: <SRS0=StSA=7T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E81C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8AAD207D8
	for <linux-devicetree@archiver.kernel.org>; Sat,  6 Jun 2020 00:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WXYPfU+i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgFFAf6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 20:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgFFAf5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 20:35:57 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B194DC08C5C2
        for <devicetree@vger.kernel.org>; Fri,  5 Jun 2020 17:35:56 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id l26so10093596qtr.14
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2020 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=eyZV87qhT8z+fcURL4hitHQnk0t0GkFKS/VqMAdkgqw=;
        b=WXYPfU+ixMBneVGXrA0oLJlYKz8PEbm8PCIMMTP6dwZMJZxm1O7zjq3BbCfu6NlqLC
         +TPuyvEqgvC9j0l8Pn5b658Eilu69ImBGHV34lPvD26ZohzDtEkrY62ImLklCUjcBaDA
         83aHhJxhm8gCXmPl289T/S1bA14tI1/IN5EcmOT5TeATLo6NNXkdaONs/bVj55s1O6Tf
         2N4Htz5tsRHBzBI/iOGAOJnavySrzRka8wX14Bu6IEwmmbePnX9FrhlyPhvWAA/uAGZw
         bP0tmHilekmfF1ZJmeAxArw/4E8m7vObhOitnlXm2aOyQDSromZVBZAx/gHsnq4UmkJq
         iVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=eyZV87qhT8z+fcURL4hitHQnk0t0GkFKS/VqMAdkgqw=;
        b=BKaMMKqETirWX/PYpJtzwvRUhzSuj0aTqh22yytyCNO+4vIZ6cQHaZHjGBw3WXIPrK
         S8doxfet2DD8dAuKJfyGka0lcHTdnEeWNHqLVMJdZdx+bxlaicixvJhhiqO9Eq5KYfWT
         ITD0sgITcrP6JXbmTp8OQmu7bsys7KDmVPqCxPtA3uHR6HuzbVVZw+6NtcUlGEYU+FET
         5InkKtAtX01i8GwpdGI+D66AYQvO254tc1hbW7cBuwk6Ysf2Rme6EziYAX0QpAHsKLxl
         5qJ2ZE4RxpdCLDXigELoM68OPbtcAdrqBi4svFHe9dKL5a56TGN15VXJuIBydVx3KP7v
         iMXA==
X-Gm-Message-State: AOAM532rm3N7aD9JWYF5MTpd3YYTIpc01OLeXioOSLnLAsF/zPFdLLj2
        kPnKlpJwFYMCb5c1K3pMoCRLl4Oc1AAU8qk=
X-Google-Smtp-Source: ABdhPJwKNqLsko/t6NsDu6tdE8gWsgm6szCWMHdghVz6g2I480JWOCiRCDe3AesWpmQUT5L1VHe+Wxw7yYsoIp0=
X-Received: by 2002:a0c:ed31:: with SMTP id u17mr11700535qvq.117.1591403755888;
 Fri, 05 Jun 2020 17:35:55 -0700 (PDT)
Date:   Fri,  5 Jun 2020 17:35:50 -0700
Message-Id: <20200606003552.247693-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH v1 0/2] fw_devlink: Improve cycle detection in DT
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Patch 2/2 explain the series. Just using a cover letter to thread the
series and add CC's.

-Saravana

Saravana Kannan (2):
  driver core: Add device_is_dependent() to linux/device.h
  of: property: Improve cycle detection when one of the devices is never
    added

 drivers/base/core.c    |  2 +-
 drivers/of/property.c  | 44 ++++++++++++++++++++++++++++++++++++------
 include/linux/device.h |  1 +
 3 files changed, 40 insertions(+), 7 deletions(-)

-- 
2.27.0.278.ge193c7cf3a9-goog

