Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36FBC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 12:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93BD62082F
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 12:09:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hq3YTyLL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgFQMJj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 08:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQMJj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 08:09:39 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2924CC061573
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 05:09:38 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e5so1386624ote.11
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 05:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EL5BzCkoUmainZKjx09aIYd6iOrNTRRO+Rauv/GEwCw=;
        b=hq3YTyLLtph2lK3ZOsv/FRvY6IybFEG5XMNJoQo9/tbRJh/5zXJv9sn4J1GOaldslH
         UToI2dp985JV/UUOSTwd7vcMgiKyjd3pnmrhiUKBMCvVGczpn+p7inyYus9TfUumWFWv
         WUnYsdUCIx3UL525CkkauewcjgNHg6uTOmOrwWqBbu6t4k1pIHzRrQnWjLQ065NG2hnJ
         j5rt5yD7OSVeOlcLDzQ0xQQl3QB6tsm72lCIsGaY+WjyiLnu/8DJvitjBWSH7+0zx4MB
         bB/mvE9jxBO8ZG1P2LvrER82G49JIt2XoleQe2trAXmA8po/Z7n0Jn6y+e7kKowfc/h7
         qIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EL5BzCkoUmainZKjx09aIYd6iOrNTRRO+Rauv/GEwCw=;
        b=eCrDNYMREF49zo25k2n1BUWAQzGZXEfhoDgLrlFy1fzmu3sU7q8GKl+JXEqnTjBBfM
         QIA+hxkTsMYrx4pcW78FsorussUgzlqmbS/oz663HTDzVxX8+j+KzFokdrQvPfZWcZxv
         Odz6T9IwDVq5lz8aIOAGTrWKavcMurtKXHEDYbp2Tm4wPm/kBsFNVy1nlLpjGqWqG5UJ
         eBrqPVP0F0N2llWeqIetPSI+GVsKAwT5CZyFcRJWH56ZZ1nUErEvkWrvTMpiGJwGQu0i
         Vu/cqght2Y7ivgqMagGwU8Cn5Hk1/n6Dq10qbn1zyckMs4QAqdssSk9N7bcBwwVnKFjb
         2rzg==
X-Gm-Message-State: AOAM532WQG/jI3epc0wKQuJil04SK/zM8k3zRoCEnRqaKYYMzVV0aTYb
        gY6PDCZjVh5vm0UB+uOMcTj1r+jFAx0hTHRJ90XH0A==
X-Google-Smtp-Source: ABdhPJyzu9qonwnPgqE//5itrvCdVGd52+dCAY0ouYokic1FEWqYsrvz3AvZUZqJitY64qAGv5yTDWWR9z35abY/ByY=
X-Received: by 2002:a9d:6a85:: with SMTP id l5mr5447118otq.371.1592395778151;
 Wed, 17 Jun 2020 05:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
 <20200602100924.26256-5-sumit.semwal@linaro.org> <20200602113241.GE5684@sirena.org.uk>
 <CAO_48GGgNUGosN2PiL=U5JkR3Bh5wNK3N4xYYML1UwmdfDPRww@mail.gmail.com>
 <20200602122554.GG5684@sirena.org.uk> <CAO_48GFwEHBGmz0QvN+pXFSyHC9+7=0aoJLHF4uupGSx2TcSvA@mail.gmail.com>
 <20200617114721.GD4613@sirena.org.uk> <CAO_48GF9pKZCCof170TvB0ubOkecDzcGhtUUuY_Td78L1J338A@mail.gmail.com>
 <20200617120601.GE4613@sirena.org.uk>
In-Reply-To: <20200617120601.GE4613@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 17 Jun 2020 17:39:26 +0530
Message-ID: <CAO_48GGhX-AxjvvvPKRMc+LQ_Uws1s_b4Q+aHokVv2RxcpObQw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] regulator: qcom: Add labibb driver
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 17 Jun 2020 at 17:36, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jun 17, 2020 at 05:27:12PM +0530, Sumit Semwal wrote:
> > On Wed, 17 Jun 2020 at 17:17, Mark Brown <broonie@kernel.org> wrote:
> > > On Wed, Jun 17, 2020 at 05:12:35PM +0530, Sumit Semwal wrote:
>
> > > > I understand from a pure regulators' correctness point of view,
> > > > ENABLE_CTL should be the one checked there, so I can change the patch
> > > > as you suggested, but there seems to be some performance penalty
> > > > there.
>
> > > I thought the goal was to have the performance penalty to ensure that
> > > the regulator had actually started?
>
> > IMHO, with the poll_enabled_time mechanism added, we would not need to
> > wait for the full enabled_time time for the regulator to get enabled,
> > but we could poll (and potentially know earlier) if the regulator is
> > enabled.
> > The performance penalty I was talking, is about how should we check if
> > the regulator is really enabled or not - via reading the STATUS1
> > register, which seems to tell the status a bit faster, or via reading
> > the ENABLE_CTL register which we also use to enable/disable the
> > regulator, but which seems to be slower in updating the status.
>
> That seems...  interesting.  Are you sure the regulator has fully ramped
> when STATUS1 starts flagging?
On a consumer device, I am not sure I have any way of checking that,
but if there's some way you'd like me to validate it, I'll be happy
to.
>
> > > > > > The WARN_ON? This was suggested by Bjorn to catch the case where the
> > > > > > DT binding for a PMIC instantiates only one of the regulators.
>
> > > > > No, this whole loop - why this whole match and get child stuff?
>
> > > > This loop mechanism is what I saw in the other qcom regulators
> > > > upstream, so thought it was an acceptable way.
> > > > For the two children nodes, do you recommend another mechanism to get
> > > > and validate both nodes?
>
> > > I don't understand what you mean by "two children nodes" here?
>
> > The two 'lab' and 'ibb' regulator nodes that are part of the labibb node.
>
> Use of_match and regulators_node like other regulator drivers.

Ok, let me see what I can do with those; we still need to flag if some
platform only instantiates one of the two lab/ibb regulators - I was
given the impression they're 'both or none' case.

Best,
Sumit.
