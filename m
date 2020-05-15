Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E30C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 05:35:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 208D520671
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 05:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvHWU6Ve"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgEOFfF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 01:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726139AbgEOFfF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 01:35:05 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB48EC061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 22:35:04 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id e44so1233404qta.9
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Qx5/VgfsCB/0k5IE7hJvg2xd2TLeiyTwpbJCbmIdWvI=;
        b=lvHWU6VeXu6KapJJkibDasYRuW+k6b/OfIy63ABvf5/06XyVIw7icDWGXVSOOkM7hL
         S6vwzrEjQQEtfi6SNZkmBp11uUzyJCuP7CWjecdBDIck4uWCgF9P8NCf4jItObYNDeP7
         g04ubuy4+WgB0GMQXY1aKTDPvv+xtoysuQbwRn9O9BYtEKx901rHzXNSgdfuYjxBRIGV
         5JG1us+oGljF3deg6Hx8SJi81zFbyc/RjO/ZKsL28wGWlZoYqlU85740UsvcADKZk/zz
         evtsHRbTQ9QBny9Svq/nHXX9ZqhL2HBKyrnBxBuQrTEcjoHjCpYZuiD4AkiUSMpc6zd+
         +hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Qx5/VgfsCB/0k5IE7hJvg2xd2TLeiyTwpbJCbmIdWvI=;
        b=jgiATiLinNXM5u0k6VG2yMRnn7ARHZbXSvqhzEiZhgthgsADAArx2ivq42CekcxWCB
         Q4IuegmYCAsu/ElkqgfhOsY17GGZZnnhVgeaz6YFvGeCeUxv0VAWvFlW5nLAFDIBQ/Lx
         IflmxHT7QGuhzhroD8S95/rutThf+T4pFOb8Fh0VBG5J9kiljPPvzVdb4XJUUgvZgnY7
         dXFfbR8K0v+PbEShGWoZXKandthWq4rNjMIY/HA/Vtcr3cnnNpcabgDYof+wDlhvIsaJ
         Xk10ddYjpIl8v4gOr5rSSg+FU0pCeUOYkuYGw7GPDdx/Zs0crjjqm09VfTnX69j+Eo74
         DDWA==
X-Gm-Message-State: AOAM532ywdUes9J15pWwMEtONX4/bXGAXzMFYKQyrAiJSk0Hyv6RNSRa
        1C55zcUsFGnLnZF7+FdaE6HfDNzHCiQc4NA=
X-Google-Smtp-Source: ABdhPJzkZ7NwIirUL48KLBVkTRpO1s4i8GVWXAgGGRuJllEo33MlBuGiIXJOZt5DKrCCh2wbIIR0gtSAnJblP6g=
X-Received: by 2002:ad4:4c4f:: with SMTP id cs15mr1776465qvb.117.1589520903895;
 Thu, 14 May 2020 22:35:03 -0700 (PDT)
Date:   Thu, 14 May 2020 22:34:56 -0700
Message-Id: <20200515053500.215929-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
Subject: [PATCH v1 0/4] Optimize fw_devlink parsing
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, Ji Luo <ji.luo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When fw_devlink is enabled on hardware with a large number of device
tree nodes, the initial device addition done in
of_platform_default_populate_init() can be very inefficient. This is
because most devices will fail to find all their suppliers when they are
added and will keep trying to parse their device tree nodes and link to
any newly added devices

This was an item on my TODO list that I'm finally getting around to. On
hardware I'm testing on, this saved 1.216 _seconds_!  Another SoC vendor
was also able to test a similar but hacky patch series and confirmed
that it saved them around 1 second.

Thanks,
Saravana
P.S: It took me longer to write the comments than the code!

Saravana Kannan (4):
  driver core: Move code to the right part of the file
  driver core: Look for waiting consumers only for a fwnode's primary
    device
  driver core: fw_devlink: Add support for batching fwnode parsing
  of: platform: Batch fwnode parsing when adding all top level devices

 drivers/base/base.h    |   1 +
 drivers/base/core.c    | 193 ++++++++++++++++++++++++++++++++---------
 drivers/base/dd.c      |   8 ++
 drivers/of/platform.c  |   2 +
 include/linux/fwnode.h |   2 +
 5 files changed, 164 insertions(+), 42 deletions(-)

-- 
2.26.2.761.g0e0b3e54be-goog

