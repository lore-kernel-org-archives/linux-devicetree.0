Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE22C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 18:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 639EB24676
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 18:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ob3u1ZS5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfLSSWq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 13:22:46 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32874 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfLSSWq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 13:22:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id c13so2937128pls.0
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KXwFzfFzkYhY2Rnva/wezf54bh0dmerJAZ0lGR8bFSM=;
        b=Ob3u1ZS5Y2lM+xNn3smagXJWwa+13n2h9N1s/MqmA/ZeLp8npgsWnqOQglR44wkR8t
         HwDBZruhxNK+aDv7mQMK68l5P/N4C3O2JckUUbSHKkEGsbWvu/qUFOcQqSTODZhCRUse
         9ZFwm+rdTllSQV5tl4j2ccySo67lLA6HifXiCaRp6gpWjStS4Q1/fijvecPvOoij2Dex
         /nlE6Yr5Z6tQIWzXKs/NOpbaV/umuWhjvUfJbruMq16PVbMR5XloFfGuajjYq39ELwgO
         kP56uIFCttgb3blX2KKbPrbwhtXs+SqvS9ZIUvRI9tsPaZky9umRogofXWZc2EA75coY
         +XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KXwFzfFzkYhY2Rnva/wezf54bh0dmerJAZ0lGR8bFSM=;
        b=uGFJU1opFAEeypAZMEKmjJSgBHeLSfd44Jde9zkHK+iWGa7uQ/govW3jkXqgeuVAJn
         pk5B993lvGKazjogDb+ziUe9avyRltwjFa3KR7ZhCPUAq6qD1FjwfFgW2nNP+YU1rZkt
         0HMKkc7Epr1pqHnPR0V0GuosvDPVsYkBD5F0f7rBXvArGJmB9juV0ym/mDO9DU/M7U4o
         CjWq40lczIzBbicz1qdSEirA8DkFbvzEhkgqf8psCbBm3MLTHamFeED8F3RrsUPzwNW2
         zsOMGTkkCK0j2acDZP+vxE8RB3K9oQOBUg3P48apHimg7L6cMF5zOCQhrSHNYJIq5YfI
         qYoQ==
X-Gm-Message-State: APjAAAW9raIgWGf6viEBw2X8QomqcAVJIpo5whRFlPOK7+RFcyvupJEo
        NvEcIpsd8SusuakQHNHpb9Hu
X-Google-Smtp-Source: APXvYqwHxxL4wmdr1ywy2f+7iVqrfz0NIx6K6ZuFNh1p+BD48pNF3UuYWRUx2XBjCUe57WmKnFOgdA==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr11269191pjz.74.1576779765730;
        Thu, 19 Dec 2019 10:22:45 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6010:65a5:a416:e9bd:178a:9286])
        by smtp.gmail.com with ESMTPSA id i3sm9085735pfg.94.2019.12.19.10.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 10:22:45 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/6] Improvements to IMX290 CMOS driver
Date:   Thu, 19 Dec 2019 23:52:16 +0530
Message-Id: <20191219182222.18961-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This patchset adds improvements to the existing media driver for IMX290
CMOS sensor from Sony. The major changes are adding 2 lane support, test
pattern generation, RAW12 mode support, configurable link frequency &
pixel rate.

The link frequency & pixel rate combinations depend on various factors like
lane count, resolution and image format as per the datasheet.

Thanks,
Mani

Changes in v2:

* Incorporated review comments from Sakari
  https://lkml.org/lkml/2019/11/29/428
* Added a patch to move settle time delay out of for loop in
  imx290_set_register_array()

Manivannan Sadhasivam (6):
  media: i2c: imx290: Add support for 2 data lanes
  media: i2c: imx290: Add support for test pattern generation
  media: i2c: imx290: Add RAW12 mode support
  media: i2c: imx290: Add support to enumerate all frame sizes
  media: i2c: imx290: Add configurable link frequency and pixel rate
  media: i2c: imx290: Move the settle time delay out of loop

 drivers/media/i2c/imx290.c | 337 +++++++++++++++++++++++++++++++------
 1 file changed, 283 insertions(+), 54 deletions(-)

-- 
2.17.1

