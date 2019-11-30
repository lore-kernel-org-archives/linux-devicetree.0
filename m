Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B74C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 17:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA5672075C
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 17:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rU803rKa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfK3RLb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 12:11:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46129 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfK3RLb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 12:11:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so35264690wrl.13
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UQL+AVMYlXHuUQ/VgmF2hZDjdLHQZNOvD2MO7e4tukA=;
        b=rU803rKaqI4eJSixM3JP0QLOI3hYlebb+dCaUz+d9ZGGl6FR1nNELe+sA4WRNCPAWO
         Q2G+9ZLwIxMZqgHCTe//BHqKljOfR921M4ccImOjiiopIZOgWT/3iVLHEF5WT4hOoAjn
         roMGCizkPGUdk5lfTNrSVd1fGGLnTmek+/iba74+Jo/2+1wKH3pbvln8nxSe3Pqh7/PW
         UofqCXP7FF8BqQ1kO13CHSy92+gvbTlPoVPDt+yH79fx2NHZPCflBKQmUBxTvXgPxjME
         8rqzBRgzv1nkyvUf8BC8G430o8woLvRA1r8c4zrAd1rDkAs72y3ybWzlkzSXKMeoB9vN
         PWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UQL+AVMYlXHuUQ/VgmF2hZDjdLHQZNOvD2MO7e4tukA=;
        b=r9Iuvy7Ptu8sHhpNdr8yXSnow6Pl5TYXQATUhlV/yJTD7VcH75cQLaYA/kKgkkzEy/
         6jT1VyiUvJfFdMjfnzUhH2YemyLj6mvxXdFmjm4ZhIHaakg72tkt7sDK6Pfl9T40Lx0H
         +xXuBOjmjq8rDaWsUW3XUFa2vIJhoYPFHrE/f3v2HEslq05i7rlEDaUpNfaWp5jNRG9j
         BszXF8B5TEy9KKnJYzSvrEdJ6OFeUiT1R3QLWruWHjdEodlOQSl2XLHttTspeezLSMEG
         cWWtH0tZ5jOP5rgCYYM0rIytK9aW9jEV6PCIN9qovmwYjbpTLjmSgpv9ofoIHVLTE36W
         +KfQ==
X-Gm-Message-State: APjAAAVQtBHN8ZCglRZju1DRCdB0aCJ0YPLssAOnTzQ2UcZaqmbGonbg
        oL7v4HTl4/0FGdCC/Mj3cEE=
X-Google-Smtp-Source: APXvYqw6jbkQFYeaVC7kFrelTbJ4a+slCVnwEENHqo1UFXL7HMSIb1GuXHqNAVYfY3OuhDTbqc4akA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr23092195wro.234.1575133887755;
        Sat, 30 Nov 2019 09:11:27 -0800 (PST)
Received: from localhost ([37.238.188.27])
        by smtp.gmail.com with ESMTPSA id a26sm16844378wmm.14.2019.11.30.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 09:11:27 -0800 (PST)
Date:   Sat, 30 Nov 2019 20:11:24 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
Message-ID: <20191130171124.3a2ifmkpfymxztlr@manjaro.localdomain>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-2-mohammad.rasim96@gmail.com>
 <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFBinCCg5GdHprEKfXU1LBtgQi2G7P30=bmLh8Acrn82vYGfeg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/30 02:45PM, Martin Blumenstingl wrote:
> Hi Mohammad,
>
> On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> <mohammad.rasim96@gmail.com> wrote:
> >
> > Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
> > (Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
> the space after ATSC should be after the ")"
>
Thanks, will fix that
> > HD media players.
> >
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> with above typo fixed:
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
