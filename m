Return-Path: <SRS0=naVA=7H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A14C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 09:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D203A20787
	for <linux-devicetree@archiver.kernel.org>; Mon, 25 May 2020 09:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UschULA+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389300AbgEYJXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 May 2020 05:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389227AbgEYJXa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 May 2020 05:23:30 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801D8C08C5C0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 02:23:29 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z206so6501350lfc.6
        for <devicetree@vger.kernel.org>; Mon, 25 May 2020 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvFw6sgcsYKjmBSmepPkzby27EDEU18HnByQRkc2Nbc=;
        b=UschULA+beUzLP+ObGINELeOVfCxrcZtlLvux9GyT6xMDrm1O3C81pZZJgPg2emSTB
         zjvLbVB1iVWTRi9Njuy4zO0zjMC20JN4xDDiAwGR5o8d5+ZnY3qLxipWtKTGMPLCF2RU
         g0YX1QOfRSLq+tDmO07RRzfBlScQ3x+FjS1rKPKHW/k3//WISxiDt4OJ07FU+62J7JIt
         23qiBeVvA5uiv84cgIvwZM/uzQcosDR3l8q7/pHyqGg4AuFLgKUOeJHwtjVvRzObAsLG
         TPXU7dzrtFJao5fxXK23z/lyrbgz3LClpciL2WGjF6OsICuRZ4x+qGDW8/JQTCA79YE7
         hUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvFw6sgcsYKjmBSmepPkzby27EDEU18HnByQRkc2Nbc=;
        b=UiNDV+Gb88mLTgaGaAXndawkLhYOt/jEUTjcca9+fRTlLN3wH8fHNWlXx3OTBd99TM
         JUCR6et4y81n/oVUJNiQtc9oh2P2742DFeQ5ObLU5A080ZmDTQL4gi++pBJP2TamGmhh
         LBZLOo6h/18C9yIGW2ok5UYG/6IxzrMNAAdfEDjierCh67oBvCrFHAhrN2XiOxg5KTU/
         hMn8lFFNd6vhwFWx7hnaVx9z+xsEBUl/7mPM66+UJO6fo36dfN4FHHBISme/pZZ68NUN
         9Zh8xncLvvwnTk4VhB9zNMxSyOgLGoBTg6njP0xy+lK9Dmc6AgsgrTWvKXEQ5qeyBnzI
         lBsw==
X-Gm-Message-State: AOAM53130oOkP6HfGCkbxtBGZBjaWAhTST21oduN4PToeSU+lp9JwQHM
        lzTjFL2cCbUO5cLErxPtc5T5NhvNSZ4b9zeysHSoOQ==
X-Google-Smtp-Source: ABdhPJzrSexekYMH/bV2liF0mWAt+tXhwKiki6esVDYqswNmkZ22r9Owk1xzLI+8jGIab6gqbPzZ8sDKq82iCW94i6I=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr13918757lfn.21.1590398607984;
 Mon, 25 May 2020 02:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200508165821.GA14555@x1> <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
 <20200518141843.GA916914@x1> <20200520220203.GA363398@x1>
In-Reply-To: <20200520220203.GA363398@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 11:23:17 +0200
Message-ID: <CACRpkdYV4Pd2rL=Kha6HxL8J5+vFy_M0hV7+qMghS4AVxd9D2w@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 21, 2020 at 12:02 AM Drew Fustini <drew@beagleboard.org> wrote:

> I've posted a v2 which I hope improves the intent of the line names. [0]
>
> I'm happy to integrate any feedback and create a v3 - especially if it
> is prefered for me to list the specific peripherial signals instead of
> an abstract term like "[ethernet]" or "[emmc]".  This is for lines that
> can not be used because they are not routed to the expansion headers.
>
> [0] https://lore.kernel.org/linux-omap/20200520214757.GA362547@x1/T/#u

This looks good to me. FWIW
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
