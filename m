Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B383CC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 10:27:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 942E020657
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 10:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbgGOK1C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 06:27:02 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45296 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731099AbgGOK1B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 06:27:01 -0400
Received: by mail-ot1-f65.google.com with SMTP id h1so1043465otq.12;
        Wed, 15 Jul 2020 03:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ciz8EkCooMhWVctMjx/enqnJ4xHAdIZyCLKimNEIWpI=;
        b=a73Zi2gIBcJTLfSpLzuerVRm2oFaluYrs9sNObx0Xjt3HB0rEGTbbhWU0Zk3F/DPFL
         nNnV2kFJofY5Up+nND6mZUprAMQyakCNn2dd0+PqAshUpNcfu5tH5g8+IoqehehNLE6b
         TYV3jrZ9sYMP778eiu4qOeZnC0pX8zom7KZXFJrhXlmZRCvh8X3O5pRknG+oG0/ST+ri
         6gfjkzjwQTeiTZ7I87XoDAdSwOHlB9HriEWZC3MRAXnEQ0rFZe3yLAO8+NZhMkYV+c00
         wHmfD3+kDMC26Qnr20neDmeVpHHwqH3aPIIVi9zHMu5GVxobeUc39jPAlclymrVI8VZQ
         f/tQ==
X-Gm-Message-State: AOAM5318aQQRx76/TAE+VtzudqGRbLgmYyClOzcZ95EcgiCO+JNyxOzj
        YqncuaRbN1JAbdxnDJL1wZNw9G+ePUQRRD+onzKvs4xx
X-Google-Smtp-Source: ABdhPJzDVjcJOqq/OGpX+gREO1lxSpbu/5xXM3HIDSKMrJSDI1LeLrnkzgrrA+c/eG2g6EF5g4F715fy6hnKWubX3NU=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr7700840otb.107.1594808820643;
 Wed, 15 Jul 2020 03:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org> <20200714142856.58365-4-jacopo+renesas@jmondi.org>
In-Reply-To: <20200714142856.58365-4-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 12:26:49 +0200
Message-ID: <CAMuHMdV64srQaDcAPwjA_QR6v_FOykgQpxgdT-srRk1r7NQiGQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: MAINTAINERS: ov5647: Add myself as maintainer
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dongchun.zhu@mediatek.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        roman.kovalivskyi@globallogic.com,
        Luis de Oliveira <Luis.Oliveira@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

CC Luis' last used address

On Tue, Jul 14, 2020 at 4:25 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>
> Since the current maintainer email address bounces back, replace
> the entry and make myself maintainer of the driver since I have the
> sensor and platforms to test it.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1742fa1a88cd..e2128afd83b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12607,7 +12607,7 @@ T:      git git://linuxtv.org/media_tree.git
>  F:     drivers/media/i2c/ov5640.c
>
>  OMNIVISION OV5647 SENSOR DRIVER
> -M:     Luis Oliveira <lolivei@synopsys.com>
> +M:     Jacopo Mondi <jacopo@jmondi.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
