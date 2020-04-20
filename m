Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE50C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:03:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1878D2145D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 10:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LYSctVDk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgDTKDB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 06:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTKDB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 06:03:01 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0774DC061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:03:01 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id n2so5072836ybg.4
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=26qdYNs0ZF2q7UXN0Qkf8uFcKE4I8h/DrN7RiFR7f0Q=;
        b=LYSctVDkWp0nIyrGia+1VDbE4/E083SUM+o8hXwlsw4oiS5p6YWwSR5msfMMWoXp45
         VIGGOWMv2+elHSPoc1E2DsKjM/zG/LNT2AwEima6szpsJf9M+fPTj+FL06XW8OP0HU7q
         usxEbGOdnSYTRO5B4b0Wl7cuAcYVth7eiHVux8kTiHhzDhBnQpDLvhxB0bv1O3X7fC2t
         +HXw6nZfgzNZ4rjNZHFX52NMSksaKo+HZ2WjGPb59fcGsFEVoYJulQg8RK3Mj37lKEAF
         0aYdLW32bxOCpNcXRHq/Djlsz3LZZ33lPrH6wmkGhpByoBFfs7bRI0BARrISRb2dpLxl
         XI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=26qdYNs0ZF2q7UXN0Qkf8uFcKE4I8h/DrN7RiFR7f0Q=;
        b=Mtpn6e/uBvR/qoQUNdJsp4AMiJV1UiRvvPj7rociuGr5qTiI2hyCc2Qqr5T/+NRclm
         OHhj2N3+cgs9ZxR4sZ6LOiIm+1fTINYbSiu8pLiXG99EAGIU0pKul9+Nzwl6JMrVSjFB
         V6rUNJh+cYj5k12X6MeSI4At4rGc43fTsZkG7hCLVi3ceHosX5EKyGQH+ENGQw52a40T
         hEjmH8OZSPTICqBFMvF1ln+m2/pPmBOaATV4Ca80PW0MYk1LtXK5g46b8pogasxt8rD0
         4vomF/TDON+wn4M5e95PoxwLwGYrdllrydinkXD4lLtn+PtCboErd1baeEmXbrXEwfVK
         NYZg==
X-Gm-Message-State: AGi0PuY2UJ+mI1w7rF3TdIi75bzavjoVjvDqz75H2zwgJ4brBm/v0XdO
        6czxIIuU2IIVOb34Vvv4UBo8HxqYHgzsmUhD1K4n3w==
X-Google-Smtp-Source: APiQypIdubJBOnT5/KYcmEjQk4EfRpLnI1xif2StvqfQ7T+NDg7Yq5em+mHVX2FSC3ewcJFl2xvG7ubbixLne/FiIFw=
X-Received: by 2002:a25:bd92:: with SMTP id f18mr7399106ybh.87.1587376980292;
 Mon, 20 Apr 2020 03:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <158735030084.17831.6159788305648251972.stgit@localhost>
 <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org> <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
 <CAA93ih3X46k7F0Mzv=-H0RRAVMemXmHFDc+trAKn2c1tLOQNHA@mail.gmail.com> <CAK7LNATYy_tpGT5+veqVwsa9x0e4sYZPmzba5vYvvLRtNYpamA@mail.gmail.com>
In-Reply-To: <CAK7LNATYy_tpGT5+veqVwsa9x0e4sYZPmzba5vYvvLRtNYpamA@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Mon, 20 Apr 2020 19:02:49 +0900
Message-ID: <CAA93ih2OfhjWJz=G6Q05vN5qTJRnEj-+MtvwpT9SmV=9R91cuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Akebi96 board support
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Rob Herring <rob.herring@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yamada-san,

2020=E5=B9=B44=E6=9C=8820=E6=97=A5(=E6=9C=88) 18:48 Masahiro Yamada <masahi=
roy@kernel.org>:
>
> Hiramatsu-san
>
> On Mon, Apr 20, 2020 at 6:31 PM Masami Hiramatsu
> > > Your patch submission is still strange.
> > >
> > > https://patchwork.kernel.org/patch/11498025/
> > >
> > > This patch is broken.
> > >
> > > Please make sure it can apply to the mainline code.
> >
> > Ah, since it is based on the linux-nex.
> > OK, I'll update it to the mainline kernel.
>
>
> Oh, I did not notice the invasive reformating.
>
> Another way to merge this cleanly is to ask this to Rob Herring.
> Either is OK to me.

Oh, let me update the series to fix the silly author line :(
And anyway, I've prepared the mainline kernel patch.
Since it is a minor merge conflict, I would like to send v2 for the
mainline kernel.
Rob, if you want a new version, please let me know. I can repost it :)

Thank you,

--=20
Masami Hiramatsu
