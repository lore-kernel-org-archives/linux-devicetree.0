Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E29C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33785206D5
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PLTuiULk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLIWMi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 17:12:38 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35935 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLIWMi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 17:12:38 -0500
Received: by mail-pl1-f193.google.com with SMTP id k20so6376530pls.3
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ItZ6nMPESHqLIASUC8LoX6fE4/wm+TwTGtRQ1RnKUZ0=;
        b=PLTuiULkvl88lhZJ7eXEZyEeyBFYh9ogHEt4KRJu32M2cSkg+0HS26NQbqT2+JfAs8
         dFf9qlMcSwGgR4627eFALudbNGexXTuCa6SEd7v3Hx7SK9dSKEmEDuk0v3Y9NsZMgpq/
         mxKlvx6opX6J7hpzmDQ29YK/mcz6eYhMYpvY7riVO3pCebZFVxPLkDvLO1gjPrP4dbl0
         qw0SWvQc7uOLp3QQ6G2B5Umx3KsUyg6T/YMGTRGxF0aoJzaXX7Q/e5NoJnusYIyu4tta
         Y4nffcrao80vVYOpikWwtkLJbMFNjwwLDRDUfSTT/wF3gKdXO1iPaFge9FbUtvSWhNtK
         rqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ItZ6nMPESHqLIASUC8LoX6fE4/wm+TwTGtRQ1RnKUZ0=;
        b=pihAz9vLjkzzyBes06a3+eaOuEpQgB4KAB3TbbiA+fiFEsy2PzH+sksDJri8+bpL9Z
         pjUarL5E0KMVRTHEbj0dMpizO9X4QFRDbfl2L+OOY5VcBiafE4X9/UW5oiERjKtHYQXV
         kuA9gpaPxHh/uPjFBrhA6Pzf4vLPpDNwier1o5HgLsrCKxLJFll5VwVGO2djIV5MAtR4
         GuHgy+2FQhvHUwHQEkovAzkoBd1ZbzMSS1QoOC1nvpitw79CxERw7E3yC6Z3Cl2v9K6N
         4xoPBc/dLMYlnuOn3Fx1gNOBouDZhuIe2s4Npdhokv2Wl73hrGMdKxNp7r7x5+LoV+uz
         BotQ==
X-Gm-Message-State: APjAAAV7gfaEVhl2UPwHNkCoACMW4Pw/4JVYUan4MVhOlP1uxklFI57Z
        CQCshmwXv0tpX4vz71nMJ6D+wuo7O8mQ1w==
X-Google-Smtp-Source: APXvYqx22xb5jLxK6hTsSuOBQ53SZCEaDbusHD9ujqDQUXDe6tywX359eNJglK+iOHzOxi2uui8Ynw==
X-Received: by 2002:a17:902:a614:: with SMTP id u20mr31864485plq.107.1575929557672;
        Mon, 09 Dec 2019 14:12:37 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q13sm345574pjc.4.2019.12.09.14.12.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 14:12:37 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
In-Reply-To: <20191101143126.2549-1-linux.amoon@gmail.com>
References: <20191101143126.2549-1-linux.amoon@gmail.com>
Date:   Mon, 09 Dec 2019 14:12:36 -0800
Message-ID: <7hfthtrvvv.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> Some how this patch got lost, so resend this again.
>
> [0] https://patchwork.kernel.org/patch/11136545/
>
> This patch enable DVFS on GXBB Odroid C2.
>
> DVFS has been tested by running the arm64 cpuburn
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> PM-QA testing
> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
>
> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM

Have you tested with the Harkernel u-boot?

Last I remember, enabling CPUfreq will cause system hangs with the
Hardkernel u-boot because of improperly enabled frequencies, so I'm not
terribly inclined to merge this patch.

> Patch based on my next-20191031 for 5.5.x kernel.
> Hope this is not late entry.

Re: "too late".  FYI... when you post things as RFC, it means you're
looking for comments (Request For Comment) but that it's not intended
for merging.

I didn't see any comments on this, but I also didn't see a non-RFC
follow-up, so I didn't queue it for v5.5.

Kevin
