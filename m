Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F025C18E5B
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 16:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB18420637
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 16:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lwWFiOB6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgCOQ0B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 12:26:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37225 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgCOQ0B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 15 Mar 2020 12:26:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id j11so11910770lfg.4
        for <devicetree@vger.kernel.org>; Sun, 15 Mar 2020 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nro+9PxoVZONSnffKW2dU8U2CHIxPJ7gtNcInQeK1go=;
        b=lwWFiOB6SJj8mGq6jaZpWUhLXzKgZyntVMMsXYYbG/IWeiuPJEVVNIQQUuqLV+XOag
         jIcEsYhJ9dngBmxhiolW1wTbWrYHbxixuUyidbrDZhlOCC1jB661xijrMccbrifYTgDN
         GOe5fpX4obl0lMchuaxiNn1khH4/6V65MUHvL/azuwnQfi3rJLToV1PEAwpTBospAiVV
         7KeDc1cHlB8ly3k69xJkfkivVgKShZ3dNLa5P9SZa+oBg3PVmG6u+1N3uITdh03hIbM1
         YfkHNTH+cvm0g6qP8Q38WTYZ703Z3eS4zCPklWgb3DtFzrpqmgmi0L2UpOgmz8q7Vm3+
         gZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nro+9PxoVZONSnffKW2dU8U2CHIxPJ7gtNcInQeK1go=;
        b=CmTW+GBB9KqMmownijAqykSbRXQWPWVAtWTQFfMgtOFfKj5g2cIm9EiUucwld6xgcv
         F3XhFICCzA4TA9j1dKi8p3UllndrnLFcvM0+bozSnpp6gSwtNn0BKegfgc2reNHLhpT2
         sYZCgsqONfFNYWF7EB1j6NGtHp1r2JmITlFAFe+2Ik8GgipjJc8rgaTdqjy26LpNlW+w
         +NOCZu9VwV/+q72aPGJzUmggsc5hljjME9W/hO4GchJkKjwQkLabcWOegdOF11i42chn
         LlyfrpG6Fo0xRgMdhEY8TCFvNguhqoyXSHN5EUldywSht2v2T32jBIhEOS/AUPpEIB1t
         1mAA==
X-Gm-Message-State: ANhLgQ2SuezAqGLHC/JuHvzUFG0mwpSQc/cJcwSyByvU8jUQEir5A56k
        Vehg9cZqXWjTdMibOT6z3pMV3/uCpCRqsxUsLFLrwA==
X-Google-Smtp-Source: ADFU+vtZ1Lm6HpAuq9q9b7CE2xd2dh3LAwacDeOvpC1P04gdg7RXPAQFfC8FLc6e0ZBzD7T3GR5IOsj+IUxBNg+hlnA=
X-Received: by 2002:a19:a415:: with SMTP id q21mr14190800lfc.21.1584289558343;
 Sun, 15 Mar 2020 09:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org> <20200315134416.16527-5-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-5-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 15 Mar 2020 17:25:47 +0100
Message-ID: <CACRpkda6Vve_oNZ+o0A-dUy35ktgqshTE8DyEqmBD=DWry7n_w@mail.gmail.com>
Subject: Re: [PATCH v1 04/36] dt-bindings: display: convert
 arm,versatile-tft-panel to DT Schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Marco Franchi <marco.franchi@nxp.com>,
        Marek Belisko <marek@goldelico.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Peter Rosin <peda@axentia.se>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Robert Chiras <robert.chiras@nxp.com>,
        Sandeep Panda <spanda@codeaurora.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Werner Johansson <werner.johansson@sonymobile.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 15, 2020 at 2:44 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Thanks! :D

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
