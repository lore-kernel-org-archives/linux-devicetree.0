Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE64C34023
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5296246C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VeFLq+4G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfLMPG3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 10:06:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54399 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbfLMPG2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 10:06:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id b19so2531752wmj.4
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zVYjiV40raA+irtPup6zp1Dmv8nl1xIXsEkpKqD3rgw=;
        b=VeFLq+4GpUuwpIm90GS0n+hEPfFGzcbuhoIB0PM5nLufjs0UAfX9PJL3hA51N4VKOl
         KfIk7UqTTPWyv/FbJiHdlziFU9wiXJEe8kRbbtdo7a1/dXo+JadmcXvd3qgaJa6NnHH4
         V721mn7ZWI4UxXXLVhSQcflSljmixpbeVRaxciGrQCo8vQL3Ekl4W6G6bttZXcfPqpGw
         nl8fiqqoeW08/a1RsvvMYeI7LUdExZsICrcXJkfTXH9m/MqEuiMPZT+2s2mn8qN10QAy
         IKy1LrFLquP54fjqKaUjY8orntPErL+P19XiJy1DT2AErcjaLDkeopvqAjzGFDin2dbd
         A39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zVYjiV40raA+irtPup6zp1Dmv8nl1xIXsEkpKqD3rgw=;
        b=AYHON41N1xUJkLQM0BLZgmalzn+SQY7JOBxJnq0GXyssQnEwZzfwze6Gd/ATGHAxUh
         Y68B2r08SCVjiiEJOzrIDe1kXp3X/q7p7S05iBmn85HqyCGnc9wnH7cp3Dz+EdkoVhVP
         LTcVPInm7358QhmPShx1brPhQ2wPkAkNl9NStWUiHgW+GlAkEFLzv3ezXkjVam0F0nlA
         kePBxwYWqyphJ4/sLF6M+dHMdzRpq1E5TNlcNOhSf1ERFnazfOyoKe9cCnBqxbQYVgYv
         Dad42sXZYUozpmKBewtWvQpDEBJ5wt5X3D5uiYZ9sz9zcgL/HFM0tu7D4BWEbZBuEcVF
         f8jQ==
X-Gm-Message-State: APjAAAUCstmBQKm8s+TSOS+/xxDCt4cclirrdsL/I4BB3fhzGUtIUNR6
        jMl6yZqDrtatThO+lnIMP+sI7A==
X-Google-Smtp-Source: APXvYqyhRx1/4GO9KdmDjWOPa8J6ecg/1XIViS8vFaLpiXkn64jYSGb3Q2OJaKQuE5yidzpFCAom9Q==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr14127321wmc.21.1576249585996;
        Fri, 13 Dec 2019 07:06:25 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id x16sm10449403wmk.35.2019.12.13.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:06:25 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
Cc:     netdev@vger.kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH v5 2/2] bluetooth: hci_bcm: enable IRQ capability from devicetree
Date:   Fri, 13 Dec 2019 16:06:22 +0100
Message-Id: <20191213150622.14162-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213150622.14162-1-glaroque@baylibre.com>
References: <20191213150622.14162-1-glaroque@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Actually IRQ can be found from GPIO but all platforms don't support
gpiod_to_irq, it's the case on amlogic chip.
so to have possibility to use interrupt mode we need to add interrupts
property in devicetree and support it in driver.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/bluetooth/hci_bcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index f8f5c593a05c..99dee878b092 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/property.h>
 #include <linux/platform_data/x86/apple.h>
 #include <linux/platform_device.h>
@@ -1144,6 +1145,8 @@ static int bcm_of_probe(struct bcm_device *bdev)
 	device_property_read_u32(bdev->dev, "max-speed", &bdev->oper_speed);
 	device_property_read_u8_array(bdev->dev, "brcm,bt-pcm-int-params",
 				      bdev->pcm_int_params, 5);
+	bdev->irq = of_irq_get_byname(bdev->dev->of_node, "host-wakeup");
+
 	return 0;
 }
 
-- 
2.17.1

