Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAADAC11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 19:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72BBA24691
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 19:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDH9LWjt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgB0T3c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 14:29:32 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37571 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbgB0T3b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 14:29:31 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so215227pjb.2
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 11:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4mWZOWxqMqFGYlHgC20I5f45kMQOVBGxRXWZS5VDQhw=;
        b=eDH9LWjtmUJgPL0c9WBmAAAXhY6qd3GY+VcEe7pf7LaSunJ+DqiVoKI/Ee7Ko1GqXH
         wh9M8ju5a6QSzz1OzPeBDYISXzYKmK/9u9BC1S4WHjqHBsK2vAkPLbBE6FtubofEYisN
         /fBRCOkiivszv1So2YCfE18J9Y8fgJGHsObmsWP9RB487DcVW4kjzS4y+xFlys4qrlZZ
         EPJX4DzCjs2jxxr9gHbVY32jxyXGS/B1LRlfU4NC2shxoeuVb53EZkU21N58Sui1nnRN
         f80H6fdB0ubC4+qkKsOzzT/BP4if7h1vmsQuda7eohxdcVAcQJSlN4V60ZVoSQ0jxAzN
         GRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4mWZOWxqMqFGYlHgC20I5f45kMQOVBGxRXWZS5VDQhw=;
        b=AiuGzqwnKgvfcBaa4Oj4o7UI7GSROLE50BQpC5Sv10A8xJfXqsXoxpQAk+kiWj9ups
         Mx4nZMDmXgA8RmdlWPZnBl64a6wsH1mHiKOAuNBrQpAoR6DsglRUNitTXApq7F/0jB7z
         OmnToMwqZHFVoy9CfnmKrOR2nPCWnh3m+DVFQeXl8EQb9IR7HpVJ0Qc81M4W3HzoAx9y
         Dk/wSJZe4CnlZl77ucgcSkf1G3YBcI20sz4vvNj/6Xs3L0JuCvFh/AErS4sKT1/zcGRs
         T0k/X5VYm5APcJSD/IFDLdahU0yfWjl5VQU4/XsKe2e/JTuX+kvuGKbVl8DxV5sHbixI
         PPcg==
X-Gm-Message-State: APjAAAX++tOPjf6r/RRY3V/ZCVp2Yr1Dhrr2huLYemA6J3oayIJ11X2C
        FyY1wWJRBXExaql/YY8Lrww=
X-Google-Smtp-Source: APXvYqxB30WhiAHOsoGPX3m9tyF7Kcyg2lSUuN3QRYUdLa+GfTKuywjBgV50zz2I2xegy/CaGHbmMQ==
X-Received: by 2002:a17:902:7009:: with SMTP id y9mr329848plk.254.1582831770959;
        Thu, 27 Feb 2020 11:29:30 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t65sm8220450pfd.178.2020.02.27.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 11:29:30 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: bcm283x: Add missing properties to the PWR LED
Date:   Thu, 27 Feb 2020 11:29:29 -0800
Message-Id: <20200227192929.17214-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
References: <1582480985-6773-1-git-send-email-stefan.wahren@i2se.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 23 Feb 2020 19:03:05 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> This adds the missing properties to the PWR LED for the RPi 3 & 4 boards,
> which are already set for the other boards. Without them we will lose
> the LED state after suspend.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
