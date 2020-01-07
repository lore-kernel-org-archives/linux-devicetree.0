Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF3BC33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 010942187F
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1vH5ppf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgAGMgh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 07:36:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38328 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgAGMgg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 07:36:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so19198743wmc.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 04:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZigGWyR5dA/rlmY5eQN1DFgU3TyM5dNJj4wuZim4lMg=;
        b=v1vH5ppfwwaQyU0557PdvzkzfgSmt8Qdg6In7lDLwtorTe1YQxwgrSRGTR5HVqP9vs
         vlx8AHphmwSmzv1+rEga+lsE7Vd2hsCizbJj2B4tf8xsJZ7uJuQtemgVOHWPPV0gKk6x
         +vAOeFTOnUCSdvEd17cltbU2Ik5HqO293wNSuEyTaYl8hUuUpRUwWgfR0ci9RMjUTcyd
         oknu0+e6xNYP+Ispe8wDu+NASM46j93S1pyqp7bXmvjBGxs89hAedp2RdiSxBa60Mzm0
         pb+gbmV+0HdEsjBsFQ3LYy7EZeOEYECZ/Y1UWbJ7+ur+0r+VfYvk69jdDmlHRRmP6N7E
         WVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZigGWyR5dA/rlmY5eQN1DFgU3TyM5dNJj4wuZim4lMg=;
        b=BjYQrEuMHOIOHYh+8NKuvaS7jovNOuQZs1eS7WHQyhbbaNnl2BmNHbsw1xm1BXfIGv
         Cob+zq3lkzGY8Hd+p5qyYp9JKCAjvPKaj9M462q4Fjm6OrdK1lVBURrGj5mUSh0MszGi
         Y9iC9xf9aSISJivOyvNkS02LU9VbkwUIfm7S5lYDnzeeuzCM65m4mGqTqVUYFeyCcamX
         SR162Bs8W7QLE0OI30oKMiSHeU/Wmq7SJFevvfxJzDPcS8Q7MZwb9FPcUmim2FyXuPUU
         uDISH12tSR+viw7NnWoQrtEB3H4PAaoAata9XnzyqYKiZPubw+vYDRaik6/MmYSO23EN
         GQZg==
X-Gm-Message-State: APjAAAV42BoKeDLxf9xJ14c/5aflpmyGeXOnffJDBtYqjeYdxqnnce2t
        sut/uCy0aQPMa/kTjrFanR8D9w==
X-Google-Smtp-Source: APXvYqx8hyPUO/+s6KqblUDY9P6qWopaZFPmK+OaNZfoX/P2gCtwCPDOS87mnKX8JiJIT/d3LpZ01g==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr40496323wmg.110.1578400594309;
        Tue, 07 Jan 2020 04:36:34 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id e18sm76983844wrw.70.2020.01.07.04.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:36:33 -0800 (PST)
Date:   Tue, 7 Jan 2020 12:36:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 04/12] mfd: bd718x7: Add compatible for BD71850
Message-ID: <20200107123647.GH14821@dell>
References: <cover.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
 <bd5009357c16d73d9bad52be68db74a2cfa6328f.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd5009357c16d73d9bad52be68db74a2cfa6328f.1577694311.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 30 Dec 2019, Matti Vaittinen wrote:

> ROHM BD71850 PMIC is almost identical to BD71847. Main difference is some
> initial voltage values for regulators. The BD71850 can be handled by
> BD71847 driver but adding own compatible makes it clearer for one who
> creates the DT for board containing this PMIC and allows SW to be
> differentiating PMICs if needed.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> Changes from v7 - no changes
> 
>  drivers/mfd/rohm-bd718x7.c | 4 ++++
>  1 file changed, 4 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
