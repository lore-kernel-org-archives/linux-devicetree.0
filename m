Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02807C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 19:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB108217BA
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 19:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvzraM8C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfK2TF4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 14:05:56 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:45857 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfK2TFz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 14:05:55 -0500
Received: by mail-pj1-f66.google.com with SMTP id r11so5793830pjp.12
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Tput1dndwwpf2AerG7ygIFUf2lPuIOL1u2Rfqh3NfVk=;
        b=BvzraM8CKAkmCxfYac7IabmSaA3XEhDd8HpdyMp+V6oEIXnvMQ0HYoaW8qLnxl1Bu5
         tdCjjxeqp+1ojRgWyB0OoM6qU9D3D0jDR5RlY+o2UwpnG6igqT/FSRv/uIULFVtUuJh2
         WiNVnZbAIkyKXHxwBgcJl+Fj1e8+EOuOTj/BkpzkuFND2LlNyHcbjVO64ij5AALRU+g/
         Lt87Iaq2d5y1Xc0iUzbnFBU+13p//CszEE0d7yQaHTNAOFN7PAwEpfnLtOcR6ZpP1ZnE
         7lw7T3rVc1h4Wr6Icxk0y38/JpYdb2+oFC2z+C/Fa2bP7ew8XXKD4FJH4jWle+BK1vX3
         eSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tput1dndwwpf2AerG7ygIFUf2lPuIOL1u2Rfqh3NfVk=;
        b=bh4GZDg4vPPGyuzDsmzG2HYFyQGkNzFrfpwAZnifVo0AjRRka4OCkpSHHy5MePoE21
         IbNVSfzyeNCl+LZ0DxmthbGu06TtRcglQqjw8Q2YZFDe3zLeub9baqWquL7En2DgfjNv
         csi2uRGAkaNAPQPRTMyAch5vQ53asYHcGpGYD6qIz0j/j50LgHTapgUfIbmTfo+5AUUF
         hNB2KLTgzFoxBWsBc3jX7A+NmIPwK0ye2ijwXaWnXLnphZ9TVdu/+nl8/X3vkXnS+bGd
         oQGJKSeVeJvfNRkFV3/T70czwtH0uKGiDcyJE5iDRuY64A6SLGsSNsAY6Q7y/8LQiST3
         rvmA==
X-Gm-Message-State: APjAAAUVL8jEjYaPT0NYg7ys07LYrAkIOvQ1iK2BmnDgPX5YJ8N3NpoT
        Im40qSCr4mW8v/RTKJ7vmsnJ
X-Google-Smtp-Source: APXvYqzeLaLk5/vOg6eNz6870rE+kdGHOlazQZ3zrqxCvca4ydWQaL+eH7v+1YZ7kIhaW1TedvQLdg==
X-Received: by 2002:a17:902:fe06:: with SMTP id g6mr15355459plj.52.1575054353473;
        Fri, 29 Nov 2019 11:05:53 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:638d:cc55:d006:f721:cde2:1059])
        by smtp.gmail.com with ESMTPSA id h9sm25159974pgk.84.2019.11.29.11.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:05:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/5] Improvements to IMX290 CMOS driver
Date:   Sat, 30 Nov 2019 00:35:36 +0530
Message-Id: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This patchset adds improvements to the existing IMX290 CMOS driver from
Sony. The major changes are adding 2 lane support, test pattern generation,
RAW12 mode support and configurable link frequency & pixel rate.

The link frequency & pixel rate combinations depend on various factors like
lane count, resolution and image format as per the datasheet.

Thanks,
Mani

Manivannan Sadhasivam (5):
  media: i2c: imx290: Add support for 2 data lanes
  media: i2c: imx290: Add support for test pattern generation
  media: i2c: imx290: Add RAW12 mode support
  media: i2c: imx290: Add support to enumerate all frame sizes
  media: i2c: imx290: Add configurable link frequency and pixel rate

 drivers/media/i2c/imx290.c | 328 +++++++++++++++++++++++++++++++------
 1 file changed, 277 insertions(+), 51 deletions(-)

-- 
2.17.1

