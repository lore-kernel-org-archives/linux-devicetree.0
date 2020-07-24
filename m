Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86DFC433E5
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 23:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2F84206E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 23:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSE9Xo3H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGXXoU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 19:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgGXXoT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jul 2020 19:44:19 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB2CC0619D3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2020 16:44:19 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id i6so7416939qkn.22
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2020 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=cx5rtLU8xqliH8LTX82DtFOmXnkZhOGKEwyJ8VR9z80=;
        b=GSE9Xo3HSLQ8K4OR7/wOyR7U9WgENeEP5zZGO+4owVsDbz5Dejlv7E7ipVfkrvZ1kv
         G/RSI0eudaXFehUGRLeFUTKwjShcjT97LMBV69BTuVkoqCNnC4E1gBTVxoKOiLSQwMjf
         nLo9dMWKgMLKfu0pOdtDOaBr5VHrZDqeN3HBFkaOY4itEKqRmdF+Q8PpxuHvopv3wq67
         u5pYYoeZEokZrL9OKqFEi20ORBb7aLnDywbMRnQAsyjSPSvbxMsD0oiyuzeolkWbQYbu
         9Z5tIXW0wqmxgzPrUVVC6DI1ugXK5mtfJKmDaJU4tAci2ctoaKgtZSKT12boNHUtbCM3
         FySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=cx5rtLU8xqliH8LTX82DtFOmXnkZhOGKEwyJ8VR9z80=;
        b=g8x4JzS/EkrnyJ5NWR1M0PfyPMH7Y58eZx4nEr93sqXLs+PbKsWAedGEZt0xN61jAT
         hIasE3Q6oTBcI6Z8SXcaQlnZ+KbQWxNbr+2MPkT9ojnty6eyAZxeUVI4zqHvu+pkd4IR
         j2M/B8PI7T5hX/+bNA396mv3R7Sndd9yGnv7clmOKsYZMrgFxOvxOg6iGjuPXy1PVzE6
         M4LiAZ0balyKvplcIhsE7RGIsl6RWDsFRl+0PPSZ3pHLoLL2lJiM77IbDy+GKr5CgANV
         KT5owT7iSvLyNgFk+GQO/1JsU/eU2ZodbNYejsD9JgF274NjIlyNl2MF/obBs4n2UjpE
         srsw==
X-Gm-Message-State: AOAM532/Pps+sYkpBgy08/d2RNeFCBTzWtQYRMSTrW6whDuMbK89oWvs
        CAuBMXYQWUh0yW0x9W1YHCbIosGAMC9iE48=
X-Google-Smtp-Source: ABdhPJxol4qZmmuGdPWMn98HVFoQcIjnalYXFwE84XH5FOS0tGNY5axHz/B6a5xOisRHey4JcQ0xpUEB9HC2Ztk=
X-Received: by 2002:a0c:eb46:: with SMTP id c6mr2030423qvq.137.1595634258604;
 Fri, 24 Jul 2020 16:44:18 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:44:14 -0700
Message-Id: <20200724234415.1651639-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [PATCH v2 1/2] of: property: Add device link support for multiple DT bindings
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
v1->v2: No changes. Just sending again because v2 has changes in Patch 2/2.

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
2.28.0.rc0.142.g3c755180ce-goog

