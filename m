Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C4EC3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 617C6208E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587376099;
	bh=p4M0FKlElEke9g2/lH3FWV1ZEwJtNoPoq5WjmFbDZp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=uEI7MLoL+Ht0YYA+m/YgGbEHMCz7N7x0UFAX4EIsGdNwiJKfGmu/mAsBdeyiRDfEV
	 uRHo/SVp7VJAgEyjVoVoLHm3hycy+Skz+l9vEwXOb6HXN16YT7hEaOJNuNNOVU1RUb
	 k3qEuf0NT8kIdlYf41uUObQ96hYCsF7tSlVI/PXY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgDTJsS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 05:48:18 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51649 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgDTJsS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 05:48:18 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 03K9lov1001235
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 18:47:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03K9lov1001235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587376071;
        bh=p4M0FKlElEke9g2/lH3FWV1ZEwJtNoPoq5WjmFbDZp0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kkgwIYTKTXidZGERiymvt2K89ISg2wyy6MhC8haT/dUr0sW7pfnDO/1HZ+JbCg5fw
         v1WLFZpnxX+Rknzv2dH9lz8uRD+QHS372B1ZUP5O2ZHbBzmZf8YslWLd7hnbQBkK4o
         7QiS2cfy06ooBP67lfc5sWou5wkuYMuYdWphBWn8AKzOWOg/LE+7wlG1sqW1+zH6zG
         7k0atIi8lmy+ysjlohu52n/fyTr003qw4cKmLwMylxR4BlZohCvRwlOTm54ujsjfYN
         Y3kXDp8K/JkkyFp/LLYp5ZjQp2XLLIfC6IjEa1RzUx3BYUUw5Q6ETwYoNf1nedexWL
         fCbYQPNa3wQ5w==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id f59so2948835uaf.9
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 02:47:50 -0700 (PDT)
X-Gm-Message-State: AGi0PubiM+AWmPsiI3vtl5zZmOkuzcQENrcP44RyCpkoJ3DocnKaxKwJ
        bwVQJPtgJheF4/Z6SqFSyd7Ad9TlGk3Ojbyf/iY=
X-Google-Smtp-Source: APiQypKEhal/a/9eJAs0/8FDulI2MY+mw7utQLOuwpGhH3WGV7NecxhG1VQRXw93N1IRfx9v8652Pi/DqPdM9+vqa8A=
X-Received: by 2002:ab0:cd:: with SMTP id 71mr5571242uaj.109.1587376069703;
 Mon, 20 Apr 2020 02:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <158735030084.17831.6159788305648251972.stgit@localhost>
 <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org> <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
 <CAA93ih3X46k7F0Mzv=-H0RRAVMemXmHFDc+trAKn2c1tLOQNHA@mail.gmail.com>
In-Reply-To: <CAA93ih3X46k7F0Mzv=-H0RRAVMemXmHFDc+trAKn2c1tLOQNHA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 18:47:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYy_tpGT5+veqVwsa9x0e4sYZPmzba5vYvvLRtNYpamA@mail.gmail.com>
Message-ID: <CAK7LNATYy_tpGT5+veqVwsa9x0e4sYZPmzba5vYvvLRtNYpamA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Akebi96 board support
To:     Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hiramatsu-san

On Mon, Apr 20, 2020 at 6:31 PM Masami Hiramatsu
> > Your patch submission is still strange.
> >
> > https://patchwork.kernel.org/patch/11498025/
> >
> > This patch is broken.
> >
> > Please make sure it can apply to the mainline code.
>
> Ah, since it is based on the linux-nex.
> OK, I'll update it to the mainline kernel.


Oh, I did not notice the invasive reformating.

Another way to merge this cleanly is to ask this to Rob Herring.
Either is OK to me.




--
Best Regards
Masahiro Yamada
