Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DA5C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 04:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94CFD20704
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 04:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QzZFd4Wt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKVEYY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 23:24:24 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35969 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfKVEYY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 23:24:24 -0500
Received: by mail-pg1-f195.google.com with SMTP id k13so2742054pgh.3
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 20:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msCu0QpwL+TYH2H0S7A59z3R+0BjpgNq8syAjSNxH5A=;
        b=QzZFd4Wt0cjTgBvP+UjZIpNq8OdeXFjyWBUGkwQNhDzUO/E5lE8HQ3n2patQ2M+r9m
         zXesz8Y+XLXINZllCrFNb573zAuEP14nU5vMhA35zfEDPfg0zZ0Mj2l4Dx8SvnN8BxrK
         /62XxHPvUc/VlvonA0ZXgPMTuiQ5qOqgujCZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msCu0QpwL+TYH2H0S7A59z3R+0BjpgNq8syAjSNxH5A=;
        b=qdpKU5WKgJAqiKnCOEVvxaS/dYoycEl+IkgoJNkXuc2SJlgCXtgLihU1614gqnLMsa
         +ba5AWFrwgABsjHYq9Q9cbvrDA0zJbe9uC/SBhUaEgZaxcBGcmBhaA0Ybhqmc41y/o96
         kD4tZYaBQ79deDqLRp2ni8Xn2/rVodCieh7p8Lct/OB1dJaEwpNqg9N7KySV2BMEUGE8
         i3VXXw7iFQdnVQYQOK8PgYPYYRjiN5OOXdyL7kcQNuYkNjMZZNpOPajsaIL35MTLbVyi
         fN66oSK8R3od2fa7GrEDj7KBf/cGKhCKrhwrGCQixu6kwmqbh8gs3m9+jb8EIezFRfq/
         EYEQ==
X-Gm-Message-State: APjAAAXhVv/Aq2qZdDbJEu3b8QkeuEe7xNXaUf4VFbZGvFHbkjR6Kd+o
        qDjWrtnrXW5iD2lOhmn/XRToZg==
X-Google-Smtp-Source: APXvYqxFlBSAySyw6HLdZ4UGY2AFeTgBXYlW07/IOFHfDkALCilbw+dFP9Dlb7LglnlGPhiKvMMAAg==
X-Received: by 2002:a63:5801:: with SMTP id m1mr13457168pgb.139.1574396663849;
        Thu, 21 Nov 2019 20:24:23 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id r28sm5435801pfl.37.2019.11.21.20.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 20:24:23 -0800 (PST)
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
Subject: [PATCH v3 0/2] usb: override hub device bInterval with device
Date:   Fri, 22 Nov 2019 12:24:17 +0800
Message-Id: <20191122042417.205481-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
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

Ikjoon Jang (2):
  dt-bindings: usb: add "hub,interval" property
  usb: overridable hub bInterval by device node

 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 drivers/usb/core/config.c                            | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.24.0.432.g9d3f5f5b63-goog

