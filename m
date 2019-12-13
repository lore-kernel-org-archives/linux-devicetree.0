Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAFDC79DD4
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D13B62474A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cUYdO6uu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfLMRO7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 12:14:59 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:43529 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbfLMRO7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 12:14:59 -0500
Received: by mail-pj1-f67.google.com with SMTP id g4so1452996pjs.10
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=xGfkgHFOiwzu4bSfkgFVF67O8wpT6Z/ekwvnkfqDuzY=;
        b=cUYdO6uuG/TiXeqwUvZcAm2hBzDMImTYy4ODdcn/fMcmh9JgLu1CLGGVX+KIvvSvO0
         o8aWIqxEx/ptb+/MPjY/Yq579KsJr1o9RPqaiCllSSleXUTWrLmcI5RrEd+/Vrfu6Flu
         CWYAgQa0ZlDt6LHKcaWNRNJjJC1lmY2DyL0S80riSCKaUdLoml+I2lmjv4MSWugYx9o5
         s6JunedYMjjRe7k0maLrsIspTN1iGgwZbO2xjk7eeLOQ9oZ/D3yt0WyYvo0YErpvSsqV
         QnY53A7SjfDhKpy53r4//AfCp08E65blD6Nm/gIFCLH23SXnz4k/U4az1r298eO7WUUq
         FlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xGfkgHFOiwzu4bSfkgFVF67O8wpT6Z/ekwvnkfqDuzY=;
        b=Kbo2nsMc6+8xihyVccsEnyiCSCMN5mnqEmCCmLurVrhABwS4PgpjwGV7vhpBjjb3oH
         2MAhKNeSWqNJPZMytl0Jcjgap/LViD7zaeobNwptU7njBfQYUwXuLCtH1x5ueHrc60lT
         PiD+lGjtMY4Zj2bgfIuLsV4IjvcgMyb7ULrKx49tZdpLApkRDow2vjTYBsFtCbJim91v
         yGvcAijoex4oGlMr8Yr6WoH7l2OzIBAozILzFQgBcETyK3D9MvXXnV/3HWaeaEa3bdSe
         TQMs0lWYCoOwzXMHE5psph/1imsXLuqJHTysPbRIhnIOHcybVmx4vJErXOdJ5otJ//lz
         GZXA==
X-Gm-Message-State: APjAAAUxlDY05YDFPU52iNiXaj2G3x/sf5Plhja2iQxbVyTfZJ8UBRDM
        sre0UTI07OPwWHoCU5k9E/NDoYV/5AFBDA==
X-Google-Smtp-Source: APXvYqxNp9JqbsXiF34gHi5lFrYjYb8YF87UwVb6GpItvh6TUJ6QG94Jp9JFz8MrAz7ABEyxzH6tHA==
X-Received: by 2002:a17:902:758c:: with SMTP id j12mr431734pll.14.1576257298141;
        Fri, 13 Dec 2019 09:14:58 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id n188sm11426933pga.84.2019.12.13.09.14.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 09:14:57 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Guillaume La Roque <glaroque@baylibre.com>, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     netdev@vger.kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] bluetooth: hci_bcm: enable IRQ capability from devicetree
In-Reply-To: <20191213150622.14162-3-glaroque@baylibre.com>
References: <20191213150622.14162-1-glaroque@baylibre.com> <20191213150622.14162-3-glaroque@baylibre.com>
Date:   Fri, 13 Dec 2019 09:14:57 -0800
Message-ID: <7ho8wc87vy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> Actually IRQ can be found from GPIO but all platforms don't support
> gpiod_to_irq, it's the case on amlogic chip.
> so to have possibility to use interrupt mode we need to add interrupts
> property in devicetree and support it in driver.

I would reword this slightly (leaving out the amlogic specifics):

"""
Add support for getting IRQ directly from DT instead of relying on
converting a GPIO to IRQ. This is needed for platforms with GPIO
controllers that that do not support gpiod_to_irq().
"""

Other than that, this looks good to me and now it's clear that it only
affects the DT path.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin
