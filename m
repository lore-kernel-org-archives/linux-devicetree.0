Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBAAC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 06:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5337120717
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 06:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="Q7/FsZxq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfLPGrX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 01:47:23 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34375 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfLPGrW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 01:47:22 -0500
Received: by mail-pg1-f194.google.com with SMTP id r11so3118571pgf.1
        for <devicetree@vger.kernel.org>; Sun, 15 Dec 2019 22:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YPHzDwynlmOFdAU5St+7P/aISgKvPX7+uyfwjb3J5vQ=;
        b=Q7/FsZxqSwMa+BzKGhf/87FEkHKFRHq6bnEriH4r/8faI2wq55Pf+hh6Dn/1A1L1hE
         QpDC8Tw2cEi1FMh9isaL5Wm2ZOPxXOZWcDiADyPoncHeRi4uNuQVZ3vevcMF6Zmy/s06
         xmkVNHiSNCCl1q561PMnqZFynvhDCjvRPKlbXzMKMW6IL5ryRPiH7VvsfdkMe7Zfg23b
         ZInoD7zU0DqJdxovEj9bVs8SpG+oMV7T58xRpRHQNmDSFiQ6/cgLseuSCkkXC5Tjb9Rc
         15Kg06QdQIh1L0juCm+0Wblblnt87P6qJKU6kJsjsSXtxS5uEzMSMllQ/53QAInBoJnm
         HzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YPHzDwynlmOFdAU5St+7P/aISgKvPX7+uyfwjb3J5vQ=;
        b=Te8DNbwX9RBYrW7gy66L0mqOrRysUrlppNiu5d0RPGRgRvm1YCJZlpnSDOfS9kHNmT
         xpP2HPxYjpmefxP6EpOtCQZEc+ITiRCjbaNlFWrj9B8p4U/6q7JyWrbY8BFwcwP40ble
         m7iZC52+PJXQ3sEsTpVHb0JNG4V18SP+PhImhd0Jn4ylS4XrgxJWOEnrFA1pwrgHt/Dn
         /+/EQiPS18Sn7Xk6FCFvNJkQBsvYE/UsmWQedrIb5IKaAeh+W1wHAXBXZANhP3PrlNwv
         2G6cQ8RuLQxHfSsyu4fj7e3No2nkX02dA5+bCgHsZE9lY/kylH8jT/OObXMWOU2hhdZI
         tU5A==
X-Gm-Message-State: APjAAAVInsBi7gO7M39y7KPjBofkOs9fRbnNXpGJbqWSI3k7LEqna2co
        7wm0KWB8PJJN43wVUQUnRJ0wQA==
X-Google-Smtp-Source: APXvYqzcXDlL9EfEPDbT8ec8JfIiOjcIeAoXu12dG22SBfYFW7LzFWn8hWSWuniHIINm1Ku+0eA7YQ==
X-Received: by 2002:a63:753:: with SMTP id 80mr15150274pgh.95.1576478842024;
        Sun, 15 Dec 2019 22:47:22 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id g7sm20758515pfq.33.2019.12.15.22.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 22:47:21 -0800 (PST)
From:   Jian-Hong Pan <jian-hong@endlessm.com>
To:     nsaenzjulienne@suse.de
Cc:     andrew.murray@arm.com, bcm-kernel-feedback-list@broadcom.com,
        devicetree@vger.kernel.org, eric@anholt.net, f.fainelli@gmail.com,
        james.quinlan@broadcom.com, jeremy.linton@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        mark.rutland@arm.com, maz@kernel.org, mbrugger@suse.com,
        phil@raspberrypi.org, robh+dt@kernel.org, wahrenst@gmx.net,
        linux@endlessm.com
Subject: Re: [PATCH v4 2/8] ARM: dts: bcm2711: Enable PCIe controller
Date:   Mon, 16 Dec 2019 14:46:38 +0800
Message-Id: <20191216064638.5067-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191203114743.1294-3-nsaenzjulienne@suse.de>
References: <20191203114743.1294-3-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Thanks for your effort! System can have USB with this patch series, if the device tree is modified properly.
Here is the question: Will not the device tree "scb/ranges" in this patch conflict with commit be8af7a9e3cc ("ARM: dts: bcm2711-rpi-4: Enable GENET support")?

Jian-Hong Pan
