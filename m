Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23DEC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 05:18:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A68A52089F
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 05:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M0RlwCSI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfKUFSZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 00:18:25 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33321 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUFSY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 00:18:24 -0500
Received: by mail-pg1-f194.google.com with SMTP id h27so999534pgn.0
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 21:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VuwOGBrzR2whkS1/3LbZzPNcBDZzFvmrpSRRU9WHj0=;
        b=M0RlwCSItamoH3wOg/4t5jejha00zSNwwzReV5FFUUBTq2l8OMa29KV9iiGZtrEgG1
         MmD42y2WBJdJzSBtw+T26rqAMdE0txaL7fs71Z8ysgyHKugmMl9roW/qJkPVthrnMk1T
         OAHVSxlOA2IXXrMKBcvq0FAv5jxOLt1dPCtnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4VuwOGBrzR2whkS1/3LbZzPNcBDZzFvmrpSRRU9WHj0=;
        b=G0SZSF6YzOnKMDWTyRHimWrtmKH1PpNaYWD0KhPZmZisSotB8ooqkMD0S8RYjb4gVq
         xIxjhsW1k0bD3ROVPY5Y5DNvGCdxB2YS23QX2kdoxQsP9Y1ev3zEwk0cml/JtJHVkMdL
         UQoYNg+zdj8xNWCbL3A9tX78dyhTZmE/rHcRVgLAbGRX2c4yNrAzoLcZq+geh/WOUiCy
         neTW6sG2hJZ1gQvObR3c3OwM0ePa6XOKTkof6/SUya1sGMl+w7kzU4jF7VpSVDR8pB7n
         zSy9itDFhl/B4HVijRTKpbEpwuPHdKs2pAocjHQ5H7c7ql0OkSRKZCwCSDuVJtaKXSGo
         Xp3A==
X-Gm-Message-State: APjAAAU3FnB+OUeJ1TN5OGN2fzsTU7HnRUO5SJixCu479o/WK64V1D4+
        r6h2UNB7F/q9YhKi5WzHoyU7Wg==
X-Google-Smtp-Source: APXvYqxJQZ03rhIDy/VBUuNNbTWdjVsS64jTA43uDHNNX74A//zsxJMX41Gb8Yr5a1P/nZfU4Xm+xw==
X-Received: by 2002:aa7:9abb:: with SMTP id x27mr8216447pfi.150.1574313504163;
        Wed, 20 Nov 2019 21:18:24 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id g30sm1017347pgm.23.2019.11.20.21.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 21:18:23 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v2 2/2] usb: overridable hub bInterval by device node
Date:   Thu, 21 Nov 2019 13:18:19 +0800
Message-Id: <20191121051819.111593-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch enables hub device to override its own endpoint descriptor's
bInterval when the hub has a device node with "hub,interval" property.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 drivers/usb/core/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5f40117e68e7..d2d9c6d6e00a 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -6,6 +6,7 @@
 #include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/of.h>
 #include <linux/usb/quirks.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -257,6 +258,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
 	memcpy(&endpoint->desc, d, n);
 	INIT_LIST_HEAD(&endpoint->urb_list);
 
+	/* device node property overrides bInterval */
+	if (usb_of_has_combined_node(to_usb_device(ddev)))
+		of_property_read_u8(ddev->of_node, "hub, interval",
+				    &d->bInterval);
+
 	/*
 	 * Fix up bInterval values outside the legal range.
 	 * Use 10 or 8 ms if no proper value can be guessed.
-- 
2.24.0.432.g9d3f5f5b63-goog

