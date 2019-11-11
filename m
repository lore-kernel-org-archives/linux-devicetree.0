Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B772C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 09:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F075120856
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 09:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvvvUPhG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfKKJ5J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 04:57:09 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43406 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKKJ5J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 04:57:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id n1so13839111wra.10
        for <devicetree@vger.kernel.org>; Mon, 11 Nov 2019 01:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n0EusroEABZj51rNdWVDgFdTyzYqS7cXwg0c/qLVta4=;
        b=TvvvUPhGY1EPTN504vPNgAqaJvh86Flh2zLDcJbmsC4YJ0lpvgShReDzApVT+c9rv2
         9CLNiRuFbTvDYGwUFHGmnbx5ObW1m0TrHsUObqs6+j9GUGs9EeAcNaNLwdAVEhEuAJ2A
         DAGTLamqveYy9YG5lX1XRj0e/LDYTMfP8f3fB8cQOH6pzTad++X5Isp+3MSuli9FOuTD
         cY56TmU6pEt6s3K6BAhsmD8rJANznYtTb6M+svD3REXmy8ADu2/aTiTBeUFIDYUq8Nht
         tdwpjZelzbWRryvgZpSe1jUj3poga0SEboTRctWN3dbRNvJ3xVCsUuUi7rrteSqInULK
         eOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n0EusroEABZj51rNdWVDgFdTyzYqS7cXwg0c/qLVta4=;
        b=HrS8s4EqtncENEsC6CXmYWW5JdKqUlQxmXimesGyPoP5tPVGI6X9PzbcJB4U1qHBHp
         5+meEzn5eColeoBc4HrVoQfA/J4E1nuNY/POpbXDQPV5mkgij5OngPLJ/E2y38MUcTG+
         Skdh/KKPRpYrzeBopRdkkC7L9roTv8mRNfaSx/YSzXOTeDDPxYFpYirOmTadI54n5Vta
         V6pFHy3L6QyMdbcpGvkcix5F0MGLgHIoKfLzW/mRzhTDlr852R20h9mtQRacE9XHYSkq
         /EveDgRowhnYFoY/IUpSz5qlHzpUBWISFHQ3CECCBrE9341H4v3TG4x3h+y/Fv91uZAZ
         5nWw==
X-Gm-Message-State: APjAAAVQBtZnKKs3OLy33xe//G+aTI9SesqKD15ZtR8EWkrr9KU9iM6u
        ue7qOJJ47wJ/wNzzAUe6q8uB8g==
X-Google-Smtp-Source: APXvYqxCdlqnVihddbyGQfzALeeE+tBPu/fwf9oiC2+F04KmOL5DVS1xOYgShIEjb3RuICv9EfNLag==
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr722187wrw.268.1573466226850;
        Mon, 11 Nov 2019 01:57:06 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id d20sm34958443wra.4.2019.11.11.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:57:06 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:56:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] dt-bindings: leds: lm3630a: Fix the example compilation
Message-ID: <20191111095658.GC3218@dell>
References: <20191031134833.241303-1-maxime@cerno.tech>
 <CAL_Jsq+0X3jqO2B4o9Md1Vo5jO9cSvioeLNLrge9aoSsm-4aLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+0X3jqO2B4o9Md1Vo5jO9cSvioeLNLrge9aoSsm-4aLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 05 Nov 2019, Rob Herring wrote:

> On Thu, Oct 31, 2019 at 8:48 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Commit ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to
> > describe HWEN pin") introduced in the example a GPIO flag that isn't
> > declared anywhere, resulting in a compilation breakage when running the
> > validation tools. Add the proper define.
> >
> > Cc: Andreas Kemnade <andreas@kemnade.info>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml   | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Lee already applied a fix. Though it's not in linux-next yet.

It is now.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
