Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C412C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 187BE206F0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HoZE0eWA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfLCKP2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 05:15:28 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33213 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLCKP1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 05:15:27 -0500
Received: by mail-pf1-f196.google.com with SMTP id y206so1638130pfb.0
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 02:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tRxVgE9HFG04agLIYkIxCuLcJXysbe1494NjR7f93c=;
        b=HoZE0eWAeqSX8yhZ60usZmY7HegNU7Eqm2zKr6UNbGa6jJJ8djzgc8nA81LFzKICE1
         o8P8YM2zbFkdgnQCgwsGaREaihuGxajcKV2hb6odfKtXRUqEeIVirQBGkmIIL0nIdxxl
         h6lxB/KZHg6EjlFBLYdMgA8Bx2roM6720uk6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tRxVgE9HFG04agLIYkIxCuLcJXysbe1494NjR7f93c=;
        b=ogvjoq798OkbzYndMkFb99bfEJlNEije9PlP9rDkPCN/3AmySWdOuxTnqj4B7Fxmou
         CuVRoPwLdzznp12pnhcMr7XwfIW7uAFPlc2AtxEfEUzDWwuocEpGMjiCwfuVgnTzHW4d
         ow3VjxN6VmmRB4h4eOnG8O0j42jawSc7kRvOEVio/zlWlYLnMXPw78MuYcQtPCaiDs9/
         eeLCsy3yHbJpW5tqvV7XUQgSehudHNDgM5EKEB8s9dlZHAqFtOWZI2Ht6U6VBkbXuLzc
         IOuhfdoR2hofV28A4w6Nj6cj/LAR4vuTv8Rk/yZztbYAGvSLSgvGJyZGet3YYNl104JO
         alLg==
X-Gm-Message-State: APjAAAWUhv344aUfuKTXp0UzYWRqZ4xKoTGDlZnNBz1qkvXj5zaL2Ikx
        k1nqBWvaNb2Yd2fhL2bqjgDDog==
X-Google-Smtp-Source: APXvYqwIvn1rfxHeprF7KgmnJ16qeOEmel+VhkoLgbCYekUX2UE7TrBlBzPYR3CfkEETTAbDZd46VQ==
X-Received: by 2002:a65:64d4:: with SMTP id t20mr4579380pgv.152.1575368127112;
        Tue, 03 Dec 2019 02:15:27 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id o7sm3248639pfg.138.2019.12.03.02.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 02:15:26 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org
Subject: [PATCH v4 0/2] usb: override hub device bInterval with device
Date:   Tue,  3 Dec 2019 18:15:21 +0800
Message-Id: <20191203101521.198914-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset enables hard wired hub device to use different bInterval
from its descriptor when the hub has a combined device node.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Changes in v4
- use of_property_read_u32() instead of of_property_read_u8()

Ikjoon Jang (2):
  dt-bindings: usb: add "hub,interval" property
  usb: overridable hub bInterval by device node

 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 drivers/usb/core/config.c                            | 9 +++++++++
 2 files changed, 13 insertions(+)

-- 
2.24.0.393.g34dc348eaf-goog

