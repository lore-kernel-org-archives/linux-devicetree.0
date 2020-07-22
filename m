Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C8CC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 20:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0E1220771
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 20:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OjYZqbxq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732359AbgGVUNS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 16:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgGVUNS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 16:13:18 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A16C0619DC
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 13:13:17 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id i203so3693543yba.9
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 13:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5HE+DPgFuSdGFfoLJSZ+xENvKObvtqAcA3kZq7fNcSk=;
        b=OjYZqbxqqBd15E3vL7dAmvvtsmLPBki0p1CT9K7bDASpyejzkVBiK7HRq8oD2v4oGQ
         G+aw3I9urc2O1sD6ivegwsExUWwp3O7fInDA25NSr1fOIsWjpHbeUEgwS7dBD/7pT9S6
         hHjDfK/0rAAoKohFco5oD3OhX9I0g9VfSZNIE1A6JxA/1WPmMOAWIVIMgzMxT6gZGWqQ
         iMb8Lotqp9ryIJRBLCFX/uB9jIFVRC/x4wfbB3CbkqeX5THzRjftMQYMQi6i/PhcFbVp
         plrXG8gdJNweyFRyOkDcLfA8mR8qa9lZWRlef0JlUvt7BF3TB5uxM3tYXcpDkpNQIw9a
         B0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5HE+DPgFuSdGFfoLJSZ+xENvKObvtqAcA3kZq7fNcSk=;
        b=ceQD+f4NbZswVSWKsSNUGfXbotDNNZCSmLT87EbHgtDV1UqRBgC1pbLc6iyOVSsIEV
         5AcgCbcez/P8VnR9Tlim/i5iz+B6z+iTUCQWJYAidVr+fi6DWoiUbbDcJ4HRv+wLsybd
         KQL2T4JI7qC6F0rVHZgrCvvx/+Tdb625NTZ0Rx1slx0d2eCmqeBNWY9j/eh+aR6WJZyz
         W8rVu9s9dLwXbzxoWohhVxk+T2HHC/RLH43jv2VXS90HPu7kWgg+XsICCx3YjLt03JxS
         otfPze5D2ydbGna1xWZbSRlSVMOECzYut5XhtxAU94CePXTkb9WkMGCsdb50tyOin9aD
         jHIw==
X-Gm-Message-State: AOAM532gCktJ3KPrei6x7c50vxylasIpttcgyyOh5zWsnm9LDBQraaU9
        beFOmlVtqf4fzWCshsrnuzXrtwr2Y7oxIoQ=
X-Google-Smtp-Source: ABdhPJx1QX858Y2g9BmuFqZYhdR0ptjGdRV66PAj4MEYmMocIfDkUmI7olyg6e/zj9LXWnAd992SOl8kDkT6qYI=
X-Received: by 2002:a25:4dc4:: with SMTP id a187mr1571100ybb.429.1595448797087;
 Wed, 22 Jul 2020 13:13:17 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:13:12 -0700
Message-Id: <20200722201313.754671-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v1 1/2] of: property: Add device link support for multiple DT bindings
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add support for creating device links out of the following DT bindings:
- interrupts-extended
- nvmem-cells
- phys
- wakeup-parent

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6a5760f0d6cd..b06edeb1f88b 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1269,6 +1269,11 @@ DEFINE_SIMPLE_PROP(dmas, "dmas", "#dma-cells")
 DEFINE_SIMPLE_PROP(power_domains, "power-domains", "#power-domain-cells")
 DEFINE_SIMPLE_PROP(hwlocks, "hwlocks", "#hwlock-cells")
 DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
+DEFINE_SIMPLE_PROP(interrupts_extended, "interrupts-extended",
+					"#interrupt-cells")
+DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", NULL)
+DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
+DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
@@ -1294,6 +1299,10 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_power_domains, },
 	{ .parse_prop = parse_hwlocks, },
 	{ .parse_prop = parse_extcon, },
+	{ .parse_prop = parse_interrupts_extended, },
+	{ .parse_prop = parse_nvmem_cells, },
+	{ .parse_prop = parse_phys, },
+	{ .parse_prop = parse_wakeup_parent, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.28.0.rc0.105.gf9edc3c819-goog

