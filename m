Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA8C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 23:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B943721925
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 23:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSfbykNR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfKLXKJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 18:10:09 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40708 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfKLXKI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 18:10:08 -0500
Received: by mail-pg1-f195.google.com with SMTP id 15so1836pgt.7
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LydOC1DwmxI2sNIO6iFBTA3xFx+jTLk/yQNmWdXlHJk=;
        b=CSfbykNRr/kZprvyug9yN7jxfsahG3sKtvlj0FTZEfLMtXVmQFja13sfE86jS/Kjcq
         yy6uGqNTSIt1d9ic01WJzZ1EKf1DR69aNFAqf+UcTJagDpBsq7aXpHgRm4LvdMZNhZI7
         R0YdwWFImnPlGvyw+BDXNZQy/I2yHb8JrW308=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LydOC1DwmxI2sNIO6iFBTA3xFx+jTLk/yQNmWdXlHJk=;
        b=aAuCqRSgSW6nFh0TpGX0HjrKm/o8MHdQ+S6zn1hirp26a1GGpZI2ft8OU6qNlIUcpB
         XRQNt//P++9QaNBBtOQp0+ufZ63fWxVM2/xaNBm3dC7raQdUhgdbKxT/15PLirNrcOhD
         u3e3amCQBujHckRF6rRokUIyelwcYFaF3OxTeHnt/xSnxe/UaQ/yW11GpnhdbKQQWP9q
         OewN8PwdorQ+FZhgayWQZR3Z+itFkQC7d2asY2ZbioEvYzPrlfGXXEWLsdWaxTOdfB+g
         dqzqN//Im5mqFnbRAHK2sweDpqnFt0koxAyon/1WXH8rdutMs/mLMkQM7TcrMzDc8Jvg
         azbQ==
X-Gm-Message-State: APjAAAWzwUY2LAMLQMmWhTgyVZIuCsg5JtohfHdUHldYK/6PkT93ntWi
        +QTSJOXnGXkoZiVlocnXe37RbA==
X-Google-Smtp-Source: APXvYqzeBaXTviyZOoSp/VSdEEsCfd0BZl2CS3Ton/gHVN6yPbHSDTJABF8hZrxdiPxl9KWIZSptIQ==
X-Received: by 2002:a63:d308:: with SMTP id b8mr52368pgg.246.1573600207944;
        Tue, 12 Nov 2019 15:10:07 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id w27sm67694pgc.20.2019.11.12.15.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 15:10:06 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 0/4] Bluetooth: hci_bcm: Additional changes for BCM4354 support
Date:   Tue, 12 Nov 2019 15:09:40 -0800
Message-Id: <20191112230944.48716-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


While adding support for the BCM4354, I discovered a few more things
that weren't working as they should have.

First, we disallow serdev from setting the baudrate on BCM4354. Serdev
sets the oper_speed first before calling hu->setup() in
hci_uart_setup(). On the BCM4354, this results in bcm_setup() failing
when the hci reset times out.

Next, we add support for setting the PCM parameters, which consists of
a pair of vendor specific opcodes to set the pcm parameters. The
documentation for these params are available in the brcm_patchram_plus
package (i.e. https://github.com/balena-os/brcm_patchram_plus). This is
necessary for PCM to work properly.

All changes were tested with rk3288-veyron-minnie.dts.


Changes in v4:
- Fix incorrect function name in hci_bcm

Changes in v3:
- Change disallow baudrate setting to return -EBUSY if called before
  ready. bcm_proto is no longer modified and is back to being const.
- Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
- Changed brcm,sco-routing to brcm,bt-sco-routing

Changes in v2:
- Use match data to disallow baudrate setting
- Parse pcm parameters by name instead of as a byte string
- Fix prefix for dt-bindings commit

Abhishek Pandit-Subedi (4):
  Bluetooth: hci_bcm: Disallow set_baudrate for BCM4354
  Bluetooth: btbcm: Support pcm configuration
  Bluetooth: hci_bcm: Support pcm params in dts
  dt-bindings: net: broadcom-bluetooth: Add pcm config

 .../bindings/net/broadcom-bluetooth.txt       | 11 +++
 drivers/bluetooth/btbcm.c                     | 18 +++++
 drivers/bluetooth/btbcm.h                     |  8 +++
 drivers/bluetooth/hci_bcm.c                   | 69 ++++++++++++++++++-
 4 files changed, 105 insertions(+), 1 deletion(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

