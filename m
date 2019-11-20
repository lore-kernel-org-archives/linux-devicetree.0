Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7F7C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 07:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 048E122445
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 07:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VPxugwvx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKTHNQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 02:13:16 -0500
Received: from mail-pg1-f202.google.com ([209.85.215.202]:36809 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfKTHNQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 02:13:16 -0500
Received: by mail-pg1-f202.google.com with SMTP id v10so414879pgg.3
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=C84JXx6eiD28S+GBkrYpaPubLQ8qnJVJ5/x3i43xZB0=;
        b=VPxugwvxwAHiOnzTkKNTxlUPbepfKwxGiJ8QCSBPfzo5d+TGN6buFYMRa2lfRykdL4
         mvCy9rsCszUHgIg+GHOqwpmkazIG+H6RRKDHk9f5jUuABO2Ib+334SJJ3xNUmvZqJNna
         WyKbTdxTqaqh/D72QRnt9s4HsKxv16nKK/ddK1M/QlGKNGpP7zsutZ4WwL7Ko2xfLDuJ
         XPCq7Jpc7IkHOtE6ca3Bns4AoQxx57OKN+rxpW00we3pHhi0K00ggRWwFN0CDSdq1RB4
         tON0m8LqG3WlAId6KcIxbwiXZSpRrbAgD8Ln6FTI5va6IwHL4v5K6R56vfm2pSdFdapH
         GN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=C84JXx6eiD28S+GBkrYpaPubLQ8qnJVJ5/x3i43xZB0=;
        b=jrge90pxR9q0idrnBzTdqEbNWhUM8jBKhR49jACYs3arDkqFqzI8o3fRudhIJfL+8h
         BfGpOL6VxL5n62oqMNw6hTodPLjXszI03VE3f/V3B8qifWNfSSb3UVBvsdUPugBVJXqj
         LJp7vfxjeC98LbQlf7+cBb7rmDDjMV2JI+19skTEvyERSd4N2lUYjlZ2odwhj1lY2lkf
         snxJFYYQUcobMtQdqP+vrtYzYYtsJ4PU19B1TJQzobHURMVzvXW7xuLK1xf2HLH2Sxwt
         Swjj3ioBvbX5OLGggEAN3XuVb0U+XV1sqtw0qjAlpROQcwaLA7w2ruLMs+x8v4HdwVqP
         aWSw==
X-Gm-Message-State: APjAAAVNBLtKVYJb8TZBDC2V8+wtUEgfAINzf0J65nqUdsK/V2ZexIi/
        vZihuhZHls9+CDC4EBsk8tehywo+irk0c68=
X-Google-Smtp-Source: APXvYqy58zvvnUjasx36C47MJ/SoV1H/b/9m3SnQwbO5JHS2q7QDVCp+4vHgJPTHpzJuKaz6Gb0p1WPXtXurK4Y=
X-Received: by 2002:a63:491d:: with SMTP id w29mr1533673pga.294.1574233993280;
 Tue, 19 Nov 2019 23:13:13 -0800 (PST)
Date:   Tue, 19 Nov 2019 23:13:01 -0800
Message-Id: <20191120071302.227777-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] of: property: Add device link support for interrupt-parent,
 dmas and -gpio(s)
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for creating device links out of more DT properties.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 0fa04692e3cc..dedbf82da838 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1188,7 +1188,11 @@ DEFINE_SIMPLE_PROP(interconnects, "interconnects", "#interconnect-cells")
 DEFINE_SIMPLE_PROP(iommus, "iommus", "#iommu-cells")
 DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
 DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
+DEFINE_SIMPLE_PROP(interrupt_parent, "interrupt-parent", NULL)
+DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
+DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
+DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
 
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
@@ -1196,7 +1200,11 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_iommus, },
 	{ .parse_prop = parse_mboxes, },
 	{ .parse_prop = parse_io_channels, },
+	{ .parse_prop = parse_interrupt_parent, },
+	{ .parse_prop = parse_dmas, },
 	{ .parse_prop = parse_regulators, },
+	{ .parse_prop = parse_gpio, },
+	{ .parse_prop = parse_gpios, },
 	{}
 };
 
-- 
2.24.0.432.g9d3f5f5b63-goog

