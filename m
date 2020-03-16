Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5084C18E5B
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 20:41:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CCAF20663
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 20:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m0zS/nz+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbgCPUlQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 16:41:16 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37372 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732537AbgCPUlP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 16:41:15 -0400
Received: by mail-vs1-f68.google.com with SMTP id o3so2233659vsd.4
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pfmXc3xr7dDVUscjphZ9PfgG1CkRdszrgoIMj+cYGiM=;
        b=m0zS/nz+dh5DzW7OJtY1OyEysBJG0asBfU/zhzlY3bVTir7wJr8IvHqzL2txO7u8OP
         TwCkv0SgavWRtAimFcwroX34kVJs0fx7PJqKmCrABErjMKZa0rezx/rliFEMdBF3BhM0
         LpUHV4yhDEXst5xYr3keONwo+bCtPHQ/IdU0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pfmXc3xr7dDVUscjphZ9PfgG1CkRdszrgoIMj+cYGiM=;
        b=IP9yGyOttr4JohcEnjtrkZ2rFL2tGjelbW8MfpIYZWxaKzFJlr24h58rDyOAKRrD+E
         lvYSHl4ibjthOMg/zNWk5hOwDko8L3CH/zsJ7hALHGq8ESc9nMEHcFL05PdazeOkcSDt
         X9BPD/lFzXBN4WE841+o5O8K6p/lP6tO7DUgWkapnVYIJ60eE3zcly1dWnasrdYJX8Sl
         eKthQvdOH1DvAZFVuLzA2b0SMZ9jV1Nk8teglZ7YNepCruQyzy8K2Q88/HsNIDNrkz7m
         zPvsjB2C7uGDdIkbn1KzY9F7/je0J9vS96n4P0hNzJsjIFEb0sHNpkAorMyA+Mt/iiGN
         CqCQ==
X-Gm-Message-State: ANhLgQ2BJMGEy7k99ikKcO4foYI+1z60Q7YQMl2ZYhhwwCAhkFVK6xnX
        r0zHAtbgmqV400+bnqXN0g5DfuzLhes=
X-Google-Smtp-Source: ADFU+vtTSdn2NwDnjck/fGrACFwbiRoOBBQDdp7PNYlsNe3jgU7sMNTeraK2ktivfjafRJMRtGXg/g==
X-Received: by 2002:a67:fe17:: with SMTP id l23mr1284460vsr.119.1584391273508;
        Mon, 16 Mar 2020 13:41:13 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id w143sm358234vkd.5.2020.03.16.13.41.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:41:13 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id 7so12272038vsr.10
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 13:41:11 -0700 (PDT)
X-Received: by 2002:a05:6102:7c7:: with SMTP id y7mr1256780vsg.198.1584391271488;
 Mon, 16 Mar 2020 13:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org> <20200315134416.16527-12-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-12-sam@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 Mar 2020 13:41:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U--vZ7bZ-RMGVbqxwpo9C8pBDtbmU2moUcu73kBHqm-A@mail.gmail.com>
Message-ID: <CAD=FV=U--vZ7bZ-RMGVbqxwpo9C8pBDtbmU2moUcu73kBHqm-A@mail.gmail.com>
Subject: Re: [PATCH v1 11/36] dt-bindings: display: convert
 innolux,p120zdg-bf1 to DT Schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

Hi,

On Sun, Mar 15, 2020 at 6:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p120zdg-bf1.txt     | 22 ----------
>  .../display/panel/innolux,p120zdg-bf1.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 22 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
