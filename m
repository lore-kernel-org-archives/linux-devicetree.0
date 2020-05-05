Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F34C47257
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:31:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B70F42075A
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 17:31:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ke1ddssf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgEERbi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 13:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729729AbgEERbi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 13:31:38 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5948C061A41
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 10:31:37 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 1so1768101vsl.9
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 10:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EQsoLSVjLAyR/M3Ocg/DHLH6pm0RmX/436FGjF6WTao=;
        b=Ke1ddssfTsxp0iPhblhR8uitz3u+NzVLxty3wGO22LNbm/oHweSwOoglBCDtTP/BIT
         nV1QFq59DQfSmb6KnLtJ20O65z/eG/stUQHHvO8IH4EjGKYIUy9p4mmslme/tNVh5Flm
         6cGsK5McFrzX89tb9oXS6LtVMITgWloKe3SwFt3NmJYkPMWNvHfXt2Ie7uhSd+23n+/8
         ATV6FtzN+kcQJYmd3TQIVidF4Kn9qkk/B5Pp0RJ4v+8tQh2QN5nO4biP92tJ6VPwRAnT
         Gj9H12bpBzqp+B/l/ZfQsusyeGTwkTsHyDvj43JP5reauKAVSHVR8hvyiuB885U4ug4L
         ZUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQsoLSVjLAyR/M3Ocg/DHLH6pm0RmX/436FGjF6WTao=;
        b=lStGUaNiV2/7DjjQQT3smA1Ji4djMg9zvUEJXzrA1Db9jVm1KLHMitUNIJgWT9nNI0
         IG8ukesQ9m6R2sqqnGAGxGudng7DfAm2mwl3V7AHZWnVMnKzZHsHt3ZC3JLZmflf/s4e
         XNHIQoQr+S2VEr2AuE4Yj3yWUMtHWn7q2vzkjAoxoaHYPgihpNvRaApoNybl8hLeP7Rs
         RimHQNzhcY1uTsZkkydMtTjP+TOvjZhiemBshBdGONd4MlhCgRoD2Z9hhG5lhOrRv+lo
         LqHyJWiZH+xW3LOqUXm51O7tz76TD2SyjETdWq+Z8tO5oqJH4QjiXKCeB7SE5bunTIDT
         qOPA==
X-Gm-Message-State: AGi0PuY9IDDYa2UC5DBmHoqA+4S6mKlRt1QKV+Ql7SOZfUMDnTeXe5Ex
        2l9WFnj/+8QXTzc5VrxOMlFAoKBpw4x31kAfWUXfJA==
X-Google-Smtp-Source: APiQypKY+Ec0L+QALIPDIkzOQ4WXjg5IcZuMySRts7hkgSJWNuiacaOPr1fNLfnrg/Vc3j1c0VN+v2jbTt5wryigOLM=
X-Received: by 2002:a67:302:: with SMTP id 2mr3875137vsd.165.1588699896206;
 Tue, 05 May 2020 10:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
 <20200428210229.703309-3-martin.blumenstingl@googlemail.com>
 <1jlfmdi9uw.fsf@starbuckisacylon.baylibre.com> <CAPDyKFoEh8qKYFONo1SHnvwhDwjUa5bMnnT1Kbu8=4rd=T-8Kg@mail.gmail.com>
 <1jh7x1i3hj.fsf@starbuckisacylon.baylibre.com> <CAPDyKFq_USCNNps3s4+C_1hriycrxtRMKJvnPFcP59CZmLXbGw@mail.gmail.com>
 <1j1rnygye6.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rnygye6.fsf@starbuckisacylon.baylibre.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 May 2020 19:30:59 +0200
Message-ID: <CAPDyKFogZgX05mPgue4UT57cTM-KVPfmoPJPf1BNJurGN+qp-g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yinxin_1989@aliyun.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lnykww@gmail.com, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 5 May 2020 at 18:05, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Tue 05 May 2020 at 10:17, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> > [...]
> >
> >> >> > +
> >> >> > +     return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> >> >> > +                                        onecell_data);
> >> >>
> >> >> I think registering a provider for a module that does not provide clocks
> >> >> to any other device is a bit overkill.
> >> >>
> >> >> I understand the matter is getting the per-user clk* pointer.
> >> >> Since this is the module registering the clock, you can use clk_hw->clk
> >> >> to get it.
> >> >>
> >> >> Once you have the clk* of the leaf clocks, you don't even need to keep
> >> >> track of the clk_hw* since you are using devm_
> >> >>
> >> >> Afterward, we should propably discuss with Stephen if something should
> >> >> be added in CCF to get a struct clk* from struct clk_hw*.
> >> >>
> >> >
> >> > [...]
> >> >
> >> > Hmm.
> >> >
> >> > I am not sure the above is a good idea, at all. Unless, I am
> >> > misunderstanding your point, which may be the case.
> >> >
> >> > I think above "shortcuts" could lead to abuse of the clock framework
> >> > and its internal data structures. When going forward, this could make
> >> > it unnecessary harder to maintain the clock framework.
> >> >
> >> > I know, it's not my responsibility, but from my experience with MMC
> >> > and SDIO interfaces, is that those have been too easy abuse - since
> >> > most of the data structures and interfaces have been exported. Now,
> >> > it's hard to roll back that, if you see what I mean.
> >>
> >> Indeed, it worth clarifying this first.
> >>
> >> With clk_register deprecated in favor of clk_hw_register, we are likely
> >> to see that case rise elsewhere.
> >>
> >
> > So, according to the separate discussion [1], I think we can let
> > Martin decide what option to implement at this point.
> >
> > 1. Implement the "clk_hw_get_clk()" approach. The preferred option,
> > but requires wider changes of the clock subsystem as well.
> >
> > 2. Keep the existing approach, with devm_clk_get(). I am fine with
> > this as well, we can always switch to 1) later on.
>
> I have a problem with this approach.
> The dt-bindings would include "#clock-cells = <1>" for a device that
> does not actually provide and only needs it has a temporary work around.
> Those bindings are supposed to be stable ...

I agree, the bindings need to be stable.

What is the problem of keeping "#clock-cells = <1>" around, when we
move to a clk_hw_get_clk() approach in the next step?

>
> I have proposed 2 other short term solutions, let's see how it goes

Yes, seems like we need to wait for Stephen's input then.

Kind regards
Uffe
