Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D7EC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 20:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0338F2146E
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 20:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SiecKE/U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfLPUAv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 15:00:51 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36736 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfLPUAv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 15:00:51 -0500
Received: by mail-pl1-f196.google.com with SMTP id d15so4969966pll.3
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=r8qzmMdF0D1xC5nnVedyWP2XlI7Ve+rZ+9sNoVRjFRw=;
        b=SiecKE/UinzqpLyQBs+yEgO3QpPJoOPtp160dyqWGW7bkIkYt2+fQaO7ZWmjsdE5KQ
         5rZL1oiQCatsGNcXX+Rgd7f3Xl7eoyOq+y+UWsuiZfhjz/8fapz4Uq3HS8xGRKnI+zlm
         sCrkRDidlxktRaEchXVFGeR8s0WIyMww7MLEMcq13ETN2EGNppzgilaxR0lpU65XcszA
         GX0J4Rw0z7NkfJ4rsnyZtbKB3IfoYHLWV2o6wD0wf4SH8kP3+GCyCvoACKdRXjO5kR5y
         OI0A6t7dx6ihTp03L0gcOgCAHXmeYuQAWED68jLrSpsu318xbd4wz5zy/JL3baS7x2kj
         n7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=r8qzmMdF0D1xC5nnVedyWP2XlI7Ve+rZ+9sNoVRjFRw=;
        b=IfYDJwI2P3RPBQrdLDzMeW6bjh3BTLgdr6EApCAyUTmTBQhVaVcdAOKx5J1g5RiEBz
         2Bmek5dsEYVWNWn5n4PwnJl0aoBdcLMt+5+6eWatmK/bqeca7VNhFi1YljELAsfsN2Ny
         i3Xx3gF/QTOUd8Fpbl/AjWeP7erUOjefzFht+O8Auc1hmFYXl0xWEjojMmSxhgz2G9kA
         xB9i87+xbAW9dLM85VKScfKvNeVLTuliceCqAtju4fqx2HlIYe6sIsS8BoJSfHHT7njl
         KPSM5D3Vhyua5/S8X3+u5knVfrxk7+Ww//L/Lkgdvqc56LBaoQbLlPipAJ2izUOQCVpw
         Otag==
X-Gm-Message-State: APjAAAWlrs3cOJGQ0d5Tj/43iJ48/nf8q4iJ8jr7Z893IEeqkBwMr+uY
        aJIN1U3XZ+QIpLI6GUePhyz3ew==
X-Google-Smtp-Source: APXvYqwT14DfCQl2bxHGgAYukZ3rXhtauf9/AST8UjoLC9sNuSdmayerLCZ+paOEtyNXBmIlumodKw==
X-Received: by 2002:a17:902:b48d:: with SMTP id y13mr18664296plr.215.1576526450635;
        Mon, 16 Dec 2019 12:00:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 73sm23416974pgc.13.2019.12.16.12.00.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 12:00:50 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: meson: add libretech-pc support
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
Date:   Mon, 16 Dec 2019 12:00:49 -0800
Message-ID: <7h5zig82ha.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds support the new libretech PC platform, aka tartiflette.
> There is two variants of this platform, one with the S905D and another
> with the S912.
>
> Changes since v1 [0]:
>  * update adc keys
>  * add phy irq pinctrl configuration
>  * update leds description

Queued for v5.6,

Kevin
