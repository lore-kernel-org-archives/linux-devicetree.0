Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D709C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F200820833
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 14:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6TSowKP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLBOpo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 09:45:44 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38291 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOpo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 09:45:44 -0500
Received: by mail-pj1-f68.google.com with SMTP id l4so5635962pjt.5
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=Sugnk5s8AM+gRpcFDOitaaXBLUXkujaMG6GBGam+SoQ=;
        b=q6TSowKP2vKrtRNSM2Jt0mPn0lxbCKXz0Dnvt2SjMs+VXj0yVRMq6HFCQhI8kP6q/P
         UetcGxqoPp9PZvB34q+tg2G8qPAsbkQec1x67/TPOMxq0scFxjiFr56PybVisu2c9WsQ
         F+sxqHFPHfiKewcua/WZ3+CVfN3eQDBzjyYmGo5SLkGUuFfwbtXxY4H1IcoBVIx2WKUW
         ITj+EWLU+h+h0HG0BOp9yX7rlW90TyKrbl1pw2+S2UXS13F1NtEDWpH83LZuTRiSvp+2
         QAaRmKk9YqLP43Y0XhJaaMMKK1Tl0rpPGCxGJ3SmRQCnMUlFaTeE+wNYI95TM5nkAjTf
         2aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Sugnk5s8AM+gRpcFDOitaaXBLUXkujaMG6GBGam+SoQ=;
        b=BFvsjC7KKnqjy9Tj924NYn101NCdPbJbuyhQZuBhSpv8rWAos3c4qaHpfO3fpS/5Rf
         2QG0YaoKawJqocfJCon1ZXulv8tKGqbH45PNXQ+9r+PYdw8mai4BuHDnDanSj4OU0IIT
         5DT3KefbN91Mky7nfQAH+URcCyfjwaXNw1A3ednUIp2JTT9ygGWJTvkIkUnPDFytv0iN
         LiLomIqe+5OKBMGrERrIt83mvon7duyryRjKR1t+zW7ct1HgpwUYBerhpYEj2t9DRaIi
         lAvJS+vBc+lt1eE2vyYIWFQtDx2FoWLLnylhTEjsnk7efV7ytld9lfhl9VA/plIjaTni
         sx+A==
X-Gm-Message-State: APjAAAVWO25iHSFOaFRSXfeYycsaJiQpxwRmuDrYD58sDsqTDi7vliOv
        sGuwaqWru836OZyR/gAANnD5qw==
X-Google-Smtp-Source: APXvYqwqlbxWausIe1KLnupB033HIL8ZxRkO7vmXk4oTSFTr6BGZTbgDtbJ21fR6SsR36oB8ALk4pg==
X-Received: by 2002:a17:902:9891:: with SMTP id s17mr27390538plp.101.1575297943776;
        Mon, 02 Dec 2019 06:45:43 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id f10sm34347813pfd.28.2019.12.02.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:45:43 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, xuwei5@hisilicon.com, p.zabel@pengutronix.de,
        opensource@jilayne.com, swinslow@gmail.com, jun.nie@linaro.org,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Subject: [PATCH 0/3] Extend Hisilicon reset type
Date:   Mon,  2 Dec 2019 22:45:21 +0800
Message-Id: <20191202144524.5391-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Extend Hisilicon reset type to support combination of set/clear,
assert/deassert and poll/non-poll.


Jun Nie (3):
  dt-bindings: clock: Update Hisilicon reset doc
  reset: hisilicon: Extend reset operation type
  ARM: dts: Update reset for hi3519 and hi3798cv200

 .../devicetree/bindings/clock/hisi-crg.txt    | 12 ++--
 arch/arm/boot/dts/hi3519.dtsi                 |  2 +-
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 47 ++++++++-------
 drivers/clk/hisilicon/reset.c                 | 58 +++++++++++++++++--
 include/dt-bindings/reset/hisilicon-resets.h  | 28 +++++++++
 5 files changed, 116 insertions(+), 31 deletions(-)
 create mode 100644 include/dt-bindings/reset/hisilicon-resets.h

-- 
2.17.1

