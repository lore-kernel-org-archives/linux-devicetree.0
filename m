Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F72C33CB1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:54:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E479207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="we/6y6ed"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgATIyW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 03:54:22 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43373 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgATIyW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 03:54:22 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so28588155wre.10
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 00:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kioLvgS74f9sJjCTsbx/ZLFmZG4mkGnzw8r1w1WYA/4=;
        b=we/6y6edkk3YpKlsBXl/AgdVTKspovJ98gF9DwytZxXRdKu2lf0yHGZ9cqG+OHNl43
         1D3wAY7FLKrkB72RdPqnamX5YdLo51GRCa74KmSY6GD35joffcxpIlx05IcZqarzXOP6
         +x+WZdL8Gs45yw6pNJWCoKrxJUIpW0Icot9uVJGDAki8AJAjxn9VczF5OAkFpdczph4B
         RkCNnyR+3vU+CuNo9xNEbZOrEsQFIuCf9xPQu0wKKvvAO/Bx0ch6NjL4QHxAd+wfp2yG
         0v3gxZaqF1zpen8HTiUQZ68tg3+k1M5szuubctad3xbmDv0AW6NzZw39zcETHvk5c+cj
         kz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kioLvgS74f9sJjCTsbx/ZLFmZG4mkGnzw8r1w1WYA/4=;
        b=Sm5Glo/zlEUAnHrUmuvfS4RcEFR8tR6znj9O67Mwob34YePHVGg81kbZAOfHWSg875
         uNo2c8Fxi3UEdpz7YIZ4s2B8DNNJBhxpTbQGd3qjT6vJpYT8szBeWJ8JJ5NpwAqSqi+v
         Y+Ujuc2TCyOzqgHMOk0T6J1+FxNMuKlXaVsLhGUoap85Jzk7l4dBL4ZGTyqN01BBCOqV
         mHsexSgL4RF7yvdtCPnue7YZB/rlEUth1KfnG6W5If4DhKRwz9/iFCT2A1HtgwO/7P+0
         JxzRgYkOJD+7V7m+6f2hcgrqco+f0fXdnnSsS63dKAF34mtjNmrG/gXEX6yJ/qpnGYaa
         sVpg==
X-Gm-Message-State: APjAAAWryocfv434Sc1YOfsQ9+VXgQZlGrmCTOm/1jNwc3fBzfNyriNL
        hV7MKy5JPe6tAbIiFyeX+o/ydQ==
X-Google-Smtp-Source: APXvYqxCEa3WXWluxoJWVXwFldWEGwXwSD1xXL7D/5WNmT4sWEkYFaFe3u9dMJfoNyljA8GfrAY9CA==
X-Received: by 2002:a5d:5304:: with SMTP id e4mr17084301wrv.426.1579510460638;
        Mon, 20 Jan 2020 00:54:20 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id b21sm11998wmd.37.2020.01.20.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:54:20 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:54:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v11 03/13] mfd: rohm PMICs - use platform_device_id to
 match MFD sub-devices
Message-ID: <20200120085435.GA15507@dell>
References: <cover.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
 <13994480cab6d5d6376c8f5228572e55ca06e479.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13994480cab6d5d6376c8f5228572e55ca06e479.1579501711.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 20 Jan 2020, Matti Vaittinen wrote:

> Thanks to Stephen Boyd I today learned we can use platform_device_id
> to do device and module matching for MFD sub-devices!
> 
> Do device matching using the platform_device_id instead of using
> explicit module_aliases to load modules and custom parent-data field
> to do module loading and sub-device matching.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> No changes since v10
> 
>  drivers/clk/clk-bd718x7.c             | 12 ++++++++-
>  drivers/mfd/rohm-bd70528.c            |  3 +--
>  drivers/mfd/rohm-bd718x7.c            | 39 ++++++++++++++++++++++-----
>  drivers/regulator/bd718x7-regulator.c | 17 +++++++++---
>  include/linux/mfd/rohm-generic.h      |  3 +--
>  5 files changed, 58 insertions(+), 16 deletions(-)

Still needs Clk and Regulator Acks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
