Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9EC10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 10:47:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83C3E20768
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 10:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M7UcYpJJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbgCRKrE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 06:47:04 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34739 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgCRKrD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 06:47:03 -0400
Received: by mail-il1-f195.google.com with SMTP id c8so23215905ilm.1
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChJRimBxnTbA03roY4ImNXu/QOZAFQmM9aZ0DvgZyss=;
        b=M7UcYpJJ1RDQlXdGC55v616bnVhhxcSbI7p7cjF7lC73j2icPSbW9xDjUWSUgCOzsN
         xDiQjQqDuDpy1p/aeJrhbYGtq4qTrY0iqN2YhQtPY5zcN9YxgSMXMDfIXe5e5rQE0tZC
         V6yM7Rw4W/Z76hXRtTrZWTRyvUcViAz0uBPfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChJRimBxnTbA03roY4ImNXu/QOZAFQmM9aZ0DvgZyss=;
        b=XkGMcagqugmNwugoR1s4EHGdh0D9Y2mfZJBXjh9/4ol5KjV5H7qf1PT/vJhw7OGhPp
         N+G8+BYwHO3Un5kiDIveysybojqxa+CODCnpnQROmx7vTYXmEPnhC9bw+52SZTu2W6Q7
         s7jF1j663nC8GAn6QcoeqpRDqEc7U4qj4tajt3iSyj/zAJRiHZLSeLONtt6voWRWzg51
         UCwg4Y62Hvai7lFA0jLLVs7tTzNOyWoUWXt1CVX54cn8oeO/fHRDm3zQ6GtjxCpnZlrs
         R1vqTIV6s1/xwu+gMmoaUaSokyXmgLnUpNS7mxlEbezu2DWkTMDFcqdLwzy+BJpl9L/I
         dNFQ==
X-Gm-Message-State: ANhLgQ1NRSrgRsLOeJTTVdW8eaQIzuqE8fOwqcM6dpI3G++myuSYLqkF
        ppRIGlooFQnOckOaOQRyPMWfhYlm+iEFyltQCgWO0Q==
X-Google-Smtp-Source: ADFU+vuJdvRD/Zp10f0MW07j0n+KougFGQxImVVwXDl2vuBshphJe25zJcL6+uMJZORniwHGcDAe6F57tp5u8+CVJYI=
X-Received: by 2002:a92:9f1b:: with SMTP id u27mr3434011ili.173.1584528422401;
 Wed, 18 Mar 2020 03:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200315134416.16527-1-sam@ravnborg.org> <20200315134416.16527-9-sam@ravnborg.org>
In-Reply-To: <20200315134416.16527-9-sam@ravnborg.org>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 18 Mar 2020 16:16:51 +0530
Message-ID: <CAMty3ZD2kuD0nwWXDAD6R58Z2GFy1Ap7HfnEtYqwARQqs0nMfQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/36] dt-bindings: display: convert
 feiyang,fy07024di26a30d to DT Schema
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Brian Masney <masneyb@onstation.org>,
        Chris Zhong <zyw@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Guido Gunther <agx@sigxcpu.org>, Heiko Schocher <hs@denx.de>,
        Nikolaus Schaller <hns@goldelico.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lin Huang <hl@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-spi@vger.kernel.org, Marco Franchi <marco.franchi@nxp.com>,
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

Hi Sam Ravmborg,

I send the series for panels which I worked already [1], would like to
send the next version for those. will that work for you?

[1] https://patchwork.kernel.org/cover/11315063/

Jagan.
