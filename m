Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1CCC35669
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 01:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E37C520722
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 01:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e7OPKG2K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgBVBko (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 20:40:44 -0500
Received: from mail-pl1-f201.google.com ([209.85.214.201]:36398 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgBVBkn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 20:40:43 -0500
Received: by mail-pl1-f201.google.com with SMTP id bg1so2165334plb.3
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 17:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=0Alq4aXp7YzXN+AKMP8eBqRG3yPiXOJvC1/VEWq2Syo=;
        b=e7OPKG2KhyChpWNNR4nLuUXy4ylVfjqLMB0INuqTgORVMt4c48EOCa1hX7f0vVumGV
         Fl12/3GISHBbAZ97RhHkmzUnwcBemFYtUitr0VJcMtjeqpFxtUVOKyNmvgs7bmfVKCbC
         9KOa3O/uxq9/bSScNcxqwFUIBpU2Dk0Nevxnjbwq9NYDFPNPFYF82PBcwjVPtHAObGCy
         sX4eERpRAQDnlpBKSFC417QE5MtuCxGl+zr+heynrIeikegYLZAfZTNmhbZ6hDclGTgx
         8TJ0QSLqeS/71knXjOGDITkEFZxZSlCB7KHiB1MAYy/cR/WtHU8JCG1hUSQ9PupLWjLG
         63IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=0Alq4aXp7YzXN+AKMP8eBqRG3yPiXOJvC1/VEWq2Syo=;
        b=de6/JHBcZv/7l43pmAMx4bhTQGvQOupaSXmcd2JWSXATpjfwGtbw/3K2bpK5+kITYR
         YSnjPyTec26Pzgsxv/o8Cpxe3dsaQFn+KIIt05VyaiFmW20IGz0vZfIrHZIQ6Ymz3ngw
         Fb/y9aCsNAH40w6Dd4Km9ZCRf/ORNzAWn0vUc+EnReOhMNEPCKRVtBlwxgjBbkds3Ykw
         kHVjz/OzzvLz1NX8lsv1yFsiVy6DpzbpXFq/+GpCT93waSScqjRgwIrGfzffh/jjDw/2
         H6ok1mV390zbyZDp+lIsGuBJIpfFsVJaj+/HYu9aTnwdnUJluOiYglz5xB8t0NS4Tiqb
         8zYg==
X-Gm-Message-State: APjAAAXlZYV0+wpHVMGW9M6OeclH1J5myyAhgOuKFXR2GhwuzU3+C01L
        XSBYvtcm+5WfIU8eevW7nWqYEP63ayvYDMo=
X-Google-Smtp-Source: APXvYqxW9MycS0KQIN3NTm0UDrGeNfKtCCiDECg2Y+zwfxgcfOoFsWcvFC2gpjKZaciSFlbJG9dbBDG/OdhB4VY=
X-Received: by 2002:a63:2a13:: with SMTP id q19mr22138542pgq.82.1582335642711;
 Fri, 21 Feb 2020 17:40:42 -0800 (PST)
Date:   Fri, 21 Feb 2020 17:40:33 -0800
Message-Id: <20200222014038.180923-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v1 0/5] Add fw_devlink kernel commandline option
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-efi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

1/5 isn't really related to adding fw_devlink, but I'm just rolling it
into this series.

The rest of the series is about adding fw_devlink kernel commandline
that can be set to off|permissive|on|rpm which are in increasing order
of enforcement by device links.

2/5 is the most "interesting" part.

The hope is that once this series merges, we'll consider enabling
fw_devlink=permissive by default and at a later point in time ideally
"on".

Thanks,
Saravana

Saravana Kannan (5):
  driver core: Reevaluate dev->links.need_for_probe as suppliers are
    added
  driver core: Add fw_devlink kernel commandline option
  efi/arm: Start using fw_devlink_get_flags()
  of: property: Start using fw_devlink_get_flags()
  of: property: Delete of_devlink kernel commandline option

 .../admin-guide/kernel-parameters.txt         | 24 +++++++++----
 drivers/base/core.c                           | 35 +++++++++++++++++--
 drivers/firmware/efi/arm-init.c               |  2 +-
 drivers/of/property.c                         |  8 +----
 include/linux/fwnode.h                        |  2 ++
 5 files changed, 54 insertions(+), 17 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

