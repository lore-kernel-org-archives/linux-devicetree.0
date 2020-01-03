Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF46AC00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2B6622B48
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578090562;
	bh=ld9El4+0s1shXpn1ZSiv2ByRJH741Yyt0tOmYAuiwCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ji5mRo/UhYyoNhYSXAPR3howoD9j/4QxX99h9kCQHMv8AbYwbzcUYyupVDWOO4h5z
	 Nu0RDpUFMTnSe9jbDWmSdEQ9XXh/hRKSn8591d5oVyBUM/xZIeR1ZrzmtuNgEcw5N5
	 yASE8tfzrZZFOodopBYIOa/c3rcgSobzpfFk5P9Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgACW3W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 17:29:22 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:37864 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgACW3W (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 17:29:22 -0500
Received: by mail-il1-f196.google.com with SMTP id t8so37872061iln.4
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 14:29:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=gGxgEmek66XClr+I4ZOssMbObOa7QPZhKH2BM6JU+5M=;
        b=Tyia1eHnlRHvrH2nYKogLAPUICGbr9IyGtiaOtmJqdbbZE1hK2qzQyhGVCNrN1Wys1
         TX8KOyO493gYucu032cIvqtjd/R9Jxv9648dLl6qFhWhhgrfVHnth+XGFlBGkKGbU4Fy
         2WXwgsD3v932H+grfjDlqiVT0IAUh7OU2BHdubwwk9AY3zyNQ29kFeMGlEuL3mBbCgFD
         gMq9YnR524Dp6uKhmTBlr8mI9spaxz0i89VyoXMsUIusz3UXFvryBHpXG744CgVwQ2uI
         X9HdWtbEmmw6Za8uNDb+q0QWjKrJ5dIJKrTtKwyl2+mfJugG618wMwdlxpsQhZy5R0HU
         doTA==
X-Gm-Message-State: APjAAAWft9xXwfVdYr6FbOcJy3yvybVit6dJry8BkpEzdPvOVa1MQons
        Lkq5jvkduc/BeiEhznTP+tMXIhs=
X-Google-Smtp-Source: APXvYqyLjonc3ofAxUy7gu/05uR0/6zxSGcOZQ1Y1zfiReuZHqUdamuGiO6Peqkm3WAPJFQ0R3/X+A==
X-Received: by 2002:a92:465c:: with SMTP id t89mr79839800ila.263.1578090561156;
        Fri, 03 Jan 2020 14:29:21 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id g4sm21516432iln.81.2020.01.03.14.29.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:29:20 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:29:19 -0700
Date:   Fri, 3 Jan 2020 15:29:19 -0700
From:   Rob Herring <robh@kernel.org>
To:     Codrin.Ciubotariu@microchip.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kamel.bouhara@bootlin.com, wsa@the-dreams.de,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        Ludovic.Desroches@microchip.com, robh@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: at91: document optional bus
 recovery  properties
Message-ID: <20200103222919.GA32421@bogus>
References: <20200103094821.13185-1-codrin.ciubotariu@microchip.com>
 <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103094821.13185-2-codrin.ciubotariu@microchip.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 3 Jan 2020 09:49:06 +0000, <Codrin.Ciubotariu@microchip.com> wrote:
> 
> From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> 
> The at91 I2C controller can support bus recovery by re-assigning SCL
> and SDA to gpios. Add the optional pinctrl and gpio properties to do
> so.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
> 
> Changes in v2:
>  - none
> 
>  Documentation/devicetree/bindings/i2c/i2c-at91.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
