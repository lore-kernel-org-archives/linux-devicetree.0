Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B7CC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5EDC2087D
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pm/U5M0p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgFBQN0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 12:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgFBQNX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 12:13:23 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF3AC05BD1E
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 09:13:22 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e1so4002201wrt.5
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 09:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGrW/c/JXuiBk8/1uTLfosohyqGpmE68ngouOkkOVGA=;
        b=pm/U5M0pUoU2QZjRE5ZUg8u9Le+vvFJOBE2CI/GZlPuz/pVxVtaPhaim03/Xa6a6Ol
         VkhChYR6KYfZVlApi84hbgeG2f+BKyiT2SYKuuCHOeGjarbgk+YDWrJ9gsFRh1mTQYtZ
         AuyyvrFrpvl3SHP6tRlsT+fBRddfiSuyH8pgZrKCDtOrKl3MjuxqcNK3mRM/ld4OC+Zf
         0g1WqcsH6kAK1vLrAiQKv/upYim57IsNvw7evUOmccguGHpmZCTS4prLmqFjf77a3pod
         76bWfI+FBACglrz62GSgIEx+wrcVUjRW9VVV2xnivP0SOIkXTLKprDlhDj5GavP98VUK
         SLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JGrW/c/JXuiBk8/1uTLfosohyqGpmE68ngouOkkOVGA=;
        b=N/3DhiTeid2irXSSSb7M0smS8DRMgqy45umPF08wPPcJg+bP+AT8/UuskY1e9c4rYN
         7nYfxhFI1mmIpfXtQb3m6SHXdTJorG6ajCnzUSbKsFUE+JjWPP3nlZUoL9FthjV2fmgl
         DY1zAXCfekL+6fSf0O/rHgWrKha1JVJ/Cvph6xKP+UkMQ7Mr4pyuqGo3ofGvEkEzfZFN
         mDb3os44oZCmtDJYxhHYLfTyntRxWPS8KLU+1LB2mJ9nA/MnZJgLMQArJCQ6G0xURZVH
         kNj17GoxJJUJbwyPwQOKTvsCF4x6fnx3Um+ajDrg91xtX2MRj39OeNKmr3hbjdkn+tkM
         W+AQ==
X-Gm-Message-State: AOAM532ImJsuOY9LRjjF/SCfunprdHsf1kIDgpYoetrMxyt8vAbTSH9W
        zT2V3QVhlg7NhSjpYxQh4JY=
X-Google-Smtp-Source: ABdhPJxQbm67ylfcRZwHdGK3hvPtk+y7Lzk9LzOh6QAB4Prv4mgYS51Mh8G7rvhrur95PzdYI5CiLw==
X-Received: by 2002:a5d:690b:: with SMTP id t11mr29377244wru.213.1591114400809;
        Tue, 02 Jun 2020 09:13:20 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id p10sm5159726wra.78.2020.06.02.09.13.20
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 02 Jun 2020 09:13:20 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] ARM: dts: NSP: Add support for Cisco Meraki NSP devices
Date:   Tue,  2 Jun 2020 17:11:16 +0100
Message-Id: <cover.1591114003.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch set adds support for the Meraki MX64(W) and MX65(W) security 
devices. There are four devices in total, all using the same basic hardware.

The MX64 series has five ethernet ports connected to the BCM SRAB. The MX65
series has two ports conected to the SRAB, and two QCA8337 switches connected 
by SGMII to SRAB ports 4 and 5, each providing five additional ports.

The W variants of these devices have two BCM43520s on the PCIe bus. On the
non-wireless variants PCIe is inactive, hence separate dts files.

1/3 contains common bindings for both Meraki devices.
2/3 contains MX64 specific bindings.
3/3 contains MX65 specific bindings.

Note that Chris Packham's "[PATCH 2/2] ARM: dts: NSP: avoid unnecessary probe
deferrals" is also necessary.

Thanks,
Matthew

Matthew Hagan (3):
  ARM: dts: NSP: Add common bindings for Meraki MX64/65
  ARM: dts: NSP: Add support for Cisco Meraki MX64(W)
  ARM: dts: NSP: Add support for Cisco Meraki MX65(W)

 arch/arm/boot/dts/bcm958625-mx64.dts         |  15 +
 arch/arm/boot/dts/bcm958625-mx64w.dts        |  23 ++
 arch/arm/boot/dts/bcm958625-mx64x.dtsi       | 136 ++++++++
 arch/arm/boot/dts/bcm958625-mx65.dts         |  15 +
 arch/arm/boot/dts/bcm958625-mx65w.dts        |  23 ++
 arch/arm/boot/dts/bcm958625-mx65x.dtsi       | 321 +++++++++++++++++++
 arch/arm/boot/dts/bcm958625-mx6x-common.dtsi | 172 ++++++++++
 7 files changed, 705 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64x.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65x.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-mx6x-common.dtsi

-- 
2.25.4

