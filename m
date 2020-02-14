Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0B7C35242
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 19:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA3F624649
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 19:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nxT8uiE/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388793AbgBNTu4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 14:50:56 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35370 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388597AbgBNTuz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 14:50:55 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so12291240wrt.2
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
        b=nxT8uiE/z52YUercio9Z5U9t7IR3335+MJiJlP80FZE6VyMExWaZrdmMWfDGExAHJH
         UyKPXipXu0iaHR4UEWlfizHzMWSOaQxyrEdJJR783jkcXSGK9VsyV01m2xMT0Mw8wlbO
         AaGiC16TBHGyAKgukrHgBCtrmcFsmgrF8VJJq46pfS7/biBsMnKlXrp9aIxSIXpEtxtR
         PLM75PKRSTkJnEZE5X9BssKTdQqAQ9xFVsjDPMDtFdM5VT2ICVDPbK3G/1E4QLJcjL04
         PtD8CJCvmor2gmivTA7eV+66UuAsYVEzIRikVpVo0FnB49W3iDElogQ0zRQxZRC0XeSm
         dj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=RC5diiaR31GO1rhNQqP799z+UvDMaz6Wswnev5LOZWQ=;
        b=UsTyvjvEWztGnI2dqtoyZfkUUhw7NdD6gtQorF7klz5hpA725D2EtlQCbOkWu2Ncn8
         OGyIHeXA5ntK6fka/TgNogLE+k4AwMw9Oh25Ehoblpwl8cQW1KVfQJbYdXFHDghujWBu
         CoX+B2tQyOUT/I022LGysS1ifurpq7ezUCnLHEalsii16MQSI52bEnid6aHwASHB6D/o
         e94W5dadG9KXvVoS1xxcN6ClcTfeFsdrii/J4VEDKNsqhvpPnM8OPcx/f5uzIuXOPsLR
         88fFQLbSylzuK0axZ+72qeHktIHQw4BSP95eHZiPOOzUePZA9aPriDJO3LVJeP/EPKGA
         zBCg==
X-Gm-Message-State: APjAAAVakY8FTjWiPIzjcvNLsoBpvWgv2+wfzxYIHbzQHBR7zRXH2U1+
        BnjF96pLEEZ1mejfVnJiI5Ny3yxxD2Q=
X-Google-Smtp-Source: APXvYqxJ0lDeRgZFQoYhh/V5X69ykQbrkOdOXgABmMtigig5INOR94v2BGam/S6IxkftSmbnVRCbIg==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr5387293wrv.86.1581709854692;
        Fri, 14 Feb 2020 11:50:54 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 21sm8793510wmo.8.2020.02.14.11.50.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 11:50:54 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jian Hu <jian.hu@amlogic.com>, "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <20200109031756.176547-1-jian.hu@amlogic.com>
References: <20200109031756.176547-1-jian.hu@amlogic.com>
Date:   Fri, 14 Feb 2020 11:50:51 -0800
Message-ID: <7htv3t9cdg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Jian Hu <jian.hu@amlogic.com> writes:

> There are four I2C controllers in A1 series,
> Share the same comptible with AXG. Compared to AXG,
> Drive strength feature is newly added in A1.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>
> ---
> This patch depends on A1 clock patchset at [0][3]

Just FYI, due the dependency, I'm waiting on the clock series to merge
before queuing this.  When the clock series is ready, please repost this
since it no longer applies to current mainline.

Thanks,

Kevin
